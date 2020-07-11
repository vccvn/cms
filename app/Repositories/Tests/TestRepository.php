<?php

namespace App\Repositories\Tests;

use App\Repositories\Base\BaseRepository;

/**
 * danh sách method
 * @method TestRepository select(...$columns) thêm các cột cần select
 * @method TestRepository selectRaw($string) select dạng nguyen bản
 * @method TestRepository from($table) 
 * @method TestRepository fromRaw($string)
 * @method TestRepository join(string $table, string $tableColumn, string $operator = '=', string $leftTableColumn) join vs 1 bang khac
 * @method TestRepository leftJoin($table, $tableColumn, $operator, $leftTableColumn)
 * @method TestRepository crossJoin($_ = null)
 * @method TestRepository where($_ = null)
 * @method TestRepository whereRaw($_ = null)
 * @method TestRepository whereIn($column, $values = [])
 * @method TestRepository whereNotIn($column, $values = [])
 * @method TestRepository whereBetween($column, $values = [])
 * @method TestRepository whereNotBetween($column, $values = [])
 * @method TestRepository whereDay($_ = null)
 * @method TestRepository whereMonth($_ = null)
 * @method TestRepository whereYear($_ = null)
 * @method TestRepository whereDate($_ = null)
 * @method TestRepository whereTime($_ = null)
 * @method TestRepository whereColumn($_ = null)
 * @method TestRepository orWhere($_ = null)
 * @method TestRepository orWhereRaw($_ = null)
 * @method TestRepository orWhereIn($column, $values = [])
 * @method TestRepository orWhereNotIn($column, $values = [])
 * @method TestRepository orWhereBetween($column, $values = [])
 * @method TestRepository orWhereNotBetween($column, $values = [])
 * @method TestRepository orWhereDay($_ = null)
 * @method TestRepository orWhereMonth($_ = null)
 * @method TestRepository orWhereYear($_ = null)
 * @method TestRepository orWhereDate($_ = null)
 * @method TestRepository orWhereTime($_ = null)
 * @method TestRepository orWhereColumn($leftColumn, $operator = '=', $rightColumn)
 * @method TestRepository groupBy($column)
 * @method TestRepository having($_ = null)
 * @method TestRepository havingRaw($_ = null)
 * @method TestRepository orderBy($_ = null)
 * @method TestRepository orderByRaw($_ = null)
 * @method TestRepository skip($_ = null)
 * @method TestRepository take($_ = null)
 * @method TestRepository with($_ = null)
 * @method TestRepository withCount($_ = null)
 * @method TestRepository load($_ = null)
 */

class TestRepository extends BaseRepository
{
    /**
     * class chứ các phương thức để validate dử liệu
     * @var string $validatorClass 
     */
    protected $validatorClass = 'Tests\TestValidator';
    /**
     * @var string $resourceClass
     */
    protected $resourceClass = 'TestResource';
    /**
     * @var string $collectionClass
     */
    protected $collectionClass = 'TestCollection';

    /**
     * tên class mặt nạ. Thược có tiền tố [tên thư mục] + \ vá hậu tố Mask
     *
     * @var string
     */
    protected $maskClass = 'Tests\TestMask';

    /**
     * tên collection mặt nạ
     *
     * @var string
     */
    protected $maskCollectionClass = 'Tests\TestCollection';

    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Test::class;
    }

}