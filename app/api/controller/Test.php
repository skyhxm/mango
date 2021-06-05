<?php
namespace app\api\controller;

use app\api\common\controller\Api;
use hg\apidoc\annotation as Apidoc;

/**
 * @Apidoc\Title("基础示例")
 * @Apidoc\Group("api")
 */
class Test extends Api
{
    /**
     * @Apidoc\Title("测试接口")
     * ...
     */
    public function index()
    {

        echo "string";
    }
}
