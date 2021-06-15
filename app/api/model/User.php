<?php

// +----------------------------------------------------------------------
// | EasyAdmin
// +----------------------------------------------------------------------
// | PHP交流群: 763822524
// +----------------------------------------------------------------------
// | 开源协议  https://mit-license.org
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zhongshaofa/EasyAdmin
// +----------------------------------------------------------------------

namespace app\api\model;

use app\common\model\TimeModel;

class User extends TimeModel
{
    protected $name = "system_command";

    protected $deleteTime = false;

    public function getFieldsDesc()
    {}

}
