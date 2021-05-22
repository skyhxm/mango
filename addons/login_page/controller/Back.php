<?php
namespace addons\login_page\controller;

use app\admin\controller\Addon;

/**
 * Class Back
 * @package app\admin\controller\Addon
 * @ControllerAnnotation(title="登录页面")
 */
class Back extends Addon
{
    private static $_addon_name = 'login_page';
    private static $_model_name = 'addons\login_page\model\LoginPage';
    public function __construct()
    {
        parent::__construct(self::$_addon_name, self::$_model_name);
    }

    /**
     * 基类文件use app\admin\controller\Addon;
     */

}
