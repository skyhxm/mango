<?php

namespace app\admin\model\test;

use app\common\model\TimeModel;

class user extends TimeModel
{

    protected $name = "test_user";

    protected $deleteTime = false;

    
    public function testUserPro()
    {
        return $this->belongsTo('\app\admin\model\TestUserPro', 'user_id', 'id');
    }

    public function testUserPro2()
    {
        return $this->belongsTo('\app\admin\model\TestUserPro2', 'user_id', 'id');
    }

    

}