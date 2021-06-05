<?php
namespace app\api\controller;

use app\api\common\controller\Api;
use hg\apidoc\annotation as Apidoc;

/**
 * @Apidoc\Title("controller")
 * @Apidoc\Group("api")
 */
class Index extends Api
{
    /**
     * @Apidoc\Title("function")
     * @Apidoc\Desc("最基础的接口注释写法")
     * @Apidoc\Url("/api/Index/index")
     * @Apidoc\Method("POST")
     * @Apidoc\Tag("tag")
     * @Apidoc\Header(ref="auth")
     * @Apidoc\Param(ref="pagingParam")
     * @Apidoc\Param("password", type="string",require=true, desc="密码" )
     * @Apidoc\Param("phone", type="string",require=true, desc="手机号" )
     * @Apidoc\Param("sex", type="int",default="1",desc="性别" )
     * @Apidoc\Returned(ref="pagingParam")
     */
    public function index()
    {

        echo "string";
    }
}
