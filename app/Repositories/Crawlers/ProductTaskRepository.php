<?php

namespace App\Repositories\Crawlers;

use App\Exceptions\NotReportException;
use App\Repositories\Base\BaseRepository;
use Carbon\Carbon;
use Crazy\Helpers\Arr;

class ProductTaskRepository extends BaseRepository
{
    protected $type = 'product';
    protected $crawl;
    /**
     * semdo
     *
     * @var \App\Crawlers\Sendo
     */
    protected $sendo = null;
    /**
     * semdo
     *
     * @var \App\Crawlers\Lazada
     */
    protected $lazada = null;
    /**
     * class chứ các phương thức để validate dử liệu
     * @var string $validatorClass 
     */
    protected $validatorClass = 'App\Validators\Crawlers\ProductTaskValidator';

    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\CrawlerTask::class;
    }

    /**
     * chạy các thiết lập
     */
    public function init()
    {
        $this->addDefaultParam('type', $this->type)->addDefaultValue('type', $this->type);
        $this->crawl = new CrawlProductRepository();
        $this->setJoinable([
            ['join', 'crawler_frames','crawler_frames.id', '=', 'crawler_tasks.frame_id'],
            // ['join', 'dynamics', 'dynamics.id', '=', 'crawler_tasks.dynamic_id'],
            ['leftJoin', 'categories', 'categories.id', '=', 'crawler_tasks.category_id']
        ]);
        $ct = 'crawler_tasks.';
        $columns = [
            'id' => $ct.'id',
            'task_url' => $ct.'task_url',
            'crawl_datetime' => $ct . 'crawl_datetime',
            'created_at' => $ct . 'created_at',
            'status' => $ct . 'status',
            'frame_name' => 'crawler_frames.name',
            // 'dynamic_name' => 'dynamics.name',
            'category_name' => 'categories.name',
        ];
        $this->setSortable($columns)->setSearchable($columns)->setWhereable($columns)
             ->setSelectable([
                 $ct.'*',
                 'frame_name' => 'crawler_frames.name',
                // 'dynamic_name' => 'dynamics.name',
                'category_name' => 'categories.name'
             ]);
    }

    /**
     * thay đổi trạng thái
     * @param int $id id của task cần thay đổi trạng thái
     * @param int|bool $status là trạng thái bao gồm 0 hoặc 1, true hoặc false
     * @return App\Models\CrawlerTask|null|false
     */
    public function changeStatus($id, $status)
    {
        $status = ($status && !in_array($status, ['false', 'off'])) ? 1 : 0;
        return $this->update($id, ['status' => $status]);

    }


    /**
     * chạy bởi task trực tiếp không cần truy vấn nhiều lần
     *
     * @param \App\Models\CrawlerTask $task
     * @param \App\Models\CrawlerFrame $frame
     * @return int Số lượng dữ liru65 bản ghi crawl dc
     */
    public function runByTask($task, $frame = null)
    {
        // cập nhậ lần crawl mới nhất
        $task->crawl_last_time = date('h:i:s');
        $task->crawl_datetime = Carbon::now();
        $task->save();

        if (!$frame) {
            $frame = app(FrameRepository::class)->first(['id' => $task->frame_id, 'type' => $this->type]);
            // nếu ko thấy frame trả về false
            if(!$frame) return false;
            $frame->checkSelectors();
        }
            $count = 0;
        try {
            if(preg_match('/sendo\.vn\/([^\/]*)($|\/|\?)/i', $task->task_url, $match)){
            
                return $this->crawl->sendo->runTask($task, $frame);
            }
            if(preg_match('/lazada\.vn\//i', $task->task_url) || count(explode('lazada.vn', strtolower($task->task_url))) > 1){
                return $this->crawl->lazada->runTask($task, $frame);
            }
            if(preg_match('/shopee.vn\/[^\.]*\-cat\.([0-9]*)\.([0-9]*)($|\?|\/)/i', $task->task_url, $shopee)){
                return $this->crawl->shopee->runTask($task, $frame, $shopee[2]);
            }
            if(preg_match('/shopee.vn\/[^\.]*\-cat\.([0-9]*)($|\?|\/)/i', $task->task_url, $shopee)){
                return $this->crawl->shopee->runTask($task, $frame, $shopee[1]);
            }
            // https://shopee.vn/%C4%90%E1%BB%93ng-h%E1%BB%93-tr%E1%BA%BB-em-cat.9607.9615
    
            // lấy html của trang để tim url post
            if (!($html = $this->crawl->getHtml($task->task_url))) {
                return false;
            }
    
            // dử liệu để crawl
            $crawlParams = [
                'category_id' => $task->category_id,
                'frame_id' => $task->frame_id,
                'shop_id' => $task->user_id?$task->user_id:$task->author_id,
                // 'dynamic_id' => $task->dynamic_id,
                'crawl_resources' => $task->crawl_resources,
            ];
    
            $selector = $task->post_url_selector ? $task->post_url_selector : $frame->item_url_selector;
            if(!$selector) return false;
            $post = $html->find($selector);
            $num = count($post) <= $task->quantity ? count($post) : $task->quantity;
            for ($i = 0; $i < $num; $i++) {
                if ($post[$i] && $post[$i]->attr['href']) {
                    $crawlParams['url'] = strpos($post[$i]->attr['href'], 'http') === 0 ? $post[$i]->attr['href'] : $frame->url . $post[$i]->attr['href'];
                    $res = $this->crawl->crawl($crawlParams);
                    if ($res) $count++;
                }
            }
    
    
            
        } catch (NotReportException $th) {
            
        }
        
        return $count;
    }

    /**
     * thực thi task
     * @param int $id
     */

    public function run($id)
    {
        // set_time_limit(0);
        if (!$task = $this->findBy('id', $id)) return false;
        return $this->runByTask($task);
    }

    /**
     * chạy nhiều task
     * @param array $idList
     * @return array mang các id dc crawl thành công
     */
    public function runMany(array $idList = [])
    {
        $runData = [];

        if (count($idList) && count($tasks = $this->get(['id' => $idList]))) {

            foreach ($tasks as $task) {
                if($count = $this->runByTask($task)) $runData[] = $count;
            }

        }
        return $runData;
    }

    /**
     * chạy task tự dộng
     */

    public function task()
    {
        $this->where('status', 1)->chunkById(50, function($tasks){
            foreach ($tasks as $task) {
                // thời gian hiện tại
                $currentTimeSeconds = time();

                // cũng là thời gian tính bằng giay. Nhưng là thời gian trong ngày
                $currentTimeOfDay = $this->getTime(date("H:i:s"));

                // thời gian của lần crawl trước đó
                $lastCrawlTimeSeconds = strtotime($task->crawl_datetime . '');

                // thời gian lặp lại hành dộng tính bằng giây
                $repeatTimeSeconds = $this->getTime($task->repeat_time);

                // thời gian thực hiện cụ thể
                $timeToCrawl = $this->getTime($task->crawl_time);
                
                // bắt dầu xử lý logic

                // nếu thời gian hiện tại trừ đi thời gian crawl trước đó mà lớn hơn hoặc bằng tần xuất
                if($currentTimeSeconds - $lastCrawlTimeSeconds >= $repeatTimeSeconds && $currentTimeOfDay >= $timeToCrawl){
                    $dd = $this->runByTask($task);
                }

            }
        });
    }



    public function getTime($time)
    {
        
        $time = get_time_seconds($time);
        return $time;
    }
}