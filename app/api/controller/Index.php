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
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = '*';

}
