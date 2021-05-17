<?php
namespace addons\php_cli\controller;

use addons\login_page\model\LoginPage;
use EasyAdmin\annotation\ControllerAnnotation;
use app\admin\controller\Addon;
use think\App;

/**
 * Class Back
 * @package app\admin\controller\Addon
 * @ControllerAnnotation(title="命令行工具")
 */
class Back extends Addon
{
    private static $_addon_name = 'php_cli';
    private static $_model_name = 'addons\php_cli\model\PhpCli';
    public function __construct(App $app)
    {
        parent::__construct($app,self::$_addon_name,self::$_model_name);
    }

    /**
     * 基类文件use app\admin\controller\Addon;
     */

     /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $a        = input('a');
            $validate = substr(trim($a), 0, 3);
            // dd($a);
            if (!strstr($validate, 'php')) {
                return json(['code' => 1, 'msg' => '只支持php相关命令']);
            }

            $a = str_replace('php think', 'php ../think', $a);
            // 调用命令行的指令
            $output = `$a`;
            $output = iconv("utf-8", "gbk//IGNORE", $output);
            $output = mb_convert_encoding($output, 'UTF-8', 'GBK');
            return json(['code' => 1, 'msg' => $output]);
        }
        return $this->fetch();
    }
    
}