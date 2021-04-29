<?php
namespace addons\test\controller;

use app\common\controller\AddonBase;
class Index extends AddonBase
{
    public function index()
    {
    	//var_dump($this->getInfo());
    	$this->assign('name','');
        return $this->fetch();
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