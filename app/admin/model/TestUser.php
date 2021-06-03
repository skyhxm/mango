<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class TestUser extends TimeModel
{

    protected $name = "test_user";

    protected $deleteTime = false;

    
    public function testUserPro()
    {
        return $this->belongsTo('\app\admin\model\TestUserPro', 'user_id', 'id');
    }

    

}