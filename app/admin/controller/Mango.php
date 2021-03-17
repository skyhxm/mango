<?php
namespace app\admin\controller;

use app\BaseController;
use think\facade\View;
use think\facade\Db;
use think\facade\Session;

use app\admin\model\CoreOrder;

class Mango extends BaseController
{
	
	public function login()
	{

    	// 模板输出
        return View::fetch();
	}
	
	public function payqr()
	{
		$data = input();
		if( empty($data) ){
			exit('错误');
		}

		View::assign('img', 'http://api.k780.com:88/?app=qr.get&data='.$data['img'].'&level=L&size=6');
		View::assign('order_sn', $data['order_sn']);
		View::assign('name', $data['name']);
    	// 模板输出
        return View::fetch();
    }

}
