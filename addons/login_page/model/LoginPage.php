<?php

// +----------------------------------------------------------------------
// | EasyAdmin
// +----------------------------------------------------------------------
// | PHP交流群: 763822524
// +----------------------------------------------------------------------
// | 开源协议  https://mit-license.org 
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zhongshaofa/EasyAdmin
// +----------------------------------------------------------------------

namespace addons\login_page\model;


use app\common\model\TimeModel;

class LoginPage extends TimeModel
{
	protected $table = 'm_page_login';
    protected $deleteTime = 'delete_time';

}