<?php
namespace app\api\controller;

use hg\apidoc\annotation\Group;
use hg\apidoc\annotation\Title;
use \think\App;

/**
 * @Title("基础示例")
 * @Group("base")
 */
class Index extends App
{
    /**
     * @Title("测试接口")
     * ...
     */
    public function index()
    {

        echo "string";
    }
}
