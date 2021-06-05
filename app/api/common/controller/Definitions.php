<?php
namespace app\api\common\controller;

use hg\apidoc\annotation\Header;
use hg\apidoc\annotation\Param;
use hg\apidoc\annotation\Returned;

class Definitions
{
    /**
     * 获取分页数据列表的参数
     * @Param("pageIndex",type="int",require=true,default="0",desc="查询页数")
     * @Param("pageSize",type="int",require=true,default="20",desc="查询条数")
     * @Returned("total", type="int", desc="总条数")
     */
    public function pagingParam()
    {}

    /**
     * 返回字典数据
     * @Returned("id",type="int",desc="唯一id")
     * @Returned("name",type="string",desc="字典名")
     * @Returned("value",type="string",desc="字典值")
     */
    public function dictionary()
    {}

    /**
     * @Header("token",type="string",require=true,desc="身份票据")
     * @Header("shopid",type="string",require=true,desc="店铺id")
     */
    public function auth()
    {}

}
