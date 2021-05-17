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

namespace addons\php_cli\model;


use app\common\model\TimeModel;

class PhpCli extends TimeModel
{
	protected $table = 'm_php_cli';
    protected $deleteTime = 'delete_time';

}