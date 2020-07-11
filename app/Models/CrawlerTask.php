<?php

namespace App\Models;

class CrawlerTask extends Model
{
    public $table = 'crawler_tasks';
    public $fillable = [
        'frame_id', 'dynamic_id', 'category_id', 'author_id', 'type', 
        'task_url', 'post_url_selector',  'quantity', 'crawl_resources', 
        'custom_run_time', 'repeat_time', 'crawl_time', 'crawl_datetime', 'crawl_last_time', 
        'status'
    ];

    /**
     * lay du lieu form
     * @return array
     */
    public function toFormData()
    {
        $data = $this->toArray();
        return $data;
    }
}
