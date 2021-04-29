<?php
namespace addons\php_cli;	// 注意命名空间规范

use app\common\library\Menu;
use think\Addons;

/**
 * 登录页面插件
 * @
 */
class Plugin extends Addons	// 需继承think\Addons类
{
	// 该插件的基础信息
	public $info = [
		'name' => 'php_cli',	// 插件标识
		'title' => '命令行插件',	// 插件名称
		'description' => '可以执行php命令',	// 插件简介
		'status' => 1,	// 状态
		'author' => 'mango',
		'version' => '1.0',
		'install'     => 0,                 // 是否已安装[1 已安装，0 未安装]
	];

	/**
	 * 插件安装方法
	 * @return bool
	 */
	public function install()
	{
		$menu = [
            [
				'name' => 'php_cli',	// 插件标识
                'href'    => '/addons/php_cli/back/index',
                'title'   => '命令行',
                'icon'    => 'fa fa-list',
                'ismenu'  => 1,//是否是菜单
            ]
        ];
        Menu::create($menu,1);
		return true;
	}

	/**
	 * 插件卸载方法
	 * @return bool
	 */
	public function uninstall()
	{
		
		Menu::delete('php_cli');
		return true;
	}

	/**
	 * 实现的testhook钩子方法
	 * @return mixed
	 */
	public function testhook($param)
	{
		// 调用钩子时候的参数信息
		print_r($param);
		// 当前插件的配置信息，配置信息存在当前目录的config.php文件中，见下方
		print_r($this->getConfig());
		// 可以返回模板，模板文件默认读取的为插件目录中的文件。模板名不能为空！
		return $this->fetch('info');
	}

    /**
     * 应用类插件的入口方法，获取系统用户，小程序信息，然后做子应用处理
     */
	public function welcome(){

    }

}