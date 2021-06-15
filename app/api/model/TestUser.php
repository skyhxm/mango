<?php

// +----------------------------------------------------------------------
// | Mango
// +----------------------------------------------------------------------
// | PHP交流群: 533738074
// +----------------------------------------------------------------------
// | 开源协议  MIT
// +----------------------------------------------------------------------
// | gitee开源项目：https://gitee.com/ruanzubao/mango
// +----------------------------------------------------------------------

namespace app\api\model;

use app\common\model\TimeModel;

class TestUser extends TimeModel
{
    protected $deleteTime = 'delete_time';

    public function getFieldsDesc(){}
    

        public function TestUser()
    {
        return $this->belongsto(TestUser::class,'id','id');
    }

    // {__CONTENT__}
}
