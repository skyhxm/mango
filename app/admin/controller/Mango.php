<?php
namespace app\admin\controller;

use app\common\controller\AdminController;
use think\facade\View;

class Mango extends AdminController
{

    public function login()
    {

        // dd(1);
        // 模板输出
        return View::fetch();
    }

    public function payqr()
    {
        $data = input();
        if (empty($data)) {
            exit('错误');
        }

        View::assign('img', 'http://api.k780.com:88/?app=qr.get&data=' . $data['img'] . '&level=L&size=6');
        View::assign('order_sn', $data['order_sn']);
        View::assign('name', $data['name']);
        // 模板输出
        return View::fetch();
    }

}
