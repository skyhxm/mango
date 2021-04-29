<?php
namespace addons\login_page\controller;

use app\common\controller\AddonBase;
use app\admin\traits\Curd;

class Index extends AddonBase
{
    use Curd;

    public function index()
    {
    	// var_dump($this->getInfo());
    	$this->assign('name','');
        return $this->fetch('/index/index');
    }
    public function add()
    {
    	 return $this->fetch();
    }
    public function detail()
    {
    	 return $this->fetch();
    }
}