<?php
namespace addons\test;	// 注意命名空间规范

use app\common\library\Menu;
use think\Addons;

/**
 * 插件测试
 * @
 */
class Plugin extends Addons	// 需继承think\Addons类
{
	// 该插件的基础信息
	public $info = [
		'name' => 'test',	// 插件标识
		'title' => '插件代码示例',	// 插件名称
		'description' => '芒果插件开发代码示例',	// 插件简介
		'status' => 1,	// 状态
		'author' => 'bytest',
		'version' => '0.1',
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
                'href'    => 'test',
                'title'   => '测试插件菜单',
                'icon'    => '&#xe66f;',
                'ismenu'  => 1,//是否是菜单
                'sublist' => [
                    ['href' => 'addons/test/index/index', 'title' => '查看', 'ismenu' => 1],
                    ['href' => 'addons/test/index/add', 'title' => '添加', 'ismenu' => 1],
                    ['href' => 'addons/test/index/detail', 'title' => '详情', 'ismenu' => 1],
                ]
            ]
        ];
        Menu::create($menu);
		return true;
	}

	/**
	 * 插件卸载方法
	 * @return bool
	 */
	public function uninstall()
	{
		
		Menu::delete('test');
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
	    echo 'addons.test';
        global $_W;
	    var_dump($_W);
	    //todo 插件内跳转等操作
        $uri = $_W['siteroot'] . 'addons/' . $_W['current_module']['name'] . '/index.php' . '?r=mall/we7-entry/login';
        header('Location: ' . $uri);
    }

}