<?php
namespace addons\login_page\controller;

use addons\login_page\model\LoginPage;
use EasyAdmin\annotation\ControllerAnnotation;
use app\admin\controller\Addon;
use think\App;

/**
 * Class Back
 * @package app\admin\controller\Addon
 * @ControllerAnnotation(title="登录页面")
 */
class Back extends Addon
{
    private static $_addon_name = 'login_page';
    private static $_model_name = 'addons\login_page\model\LoginPage';
    public function __construct(App $app)
    {
        parent::__construct($app,self::$_addon_name,self::$_model_name);
    }

    /**
     * 基类文件use app\admin\controller\Addon;
     */
    
}