<?php
namespace app\api\common\controller;

use think\App;
use think\Request;

class Api extends App
{
    protected $request;

    public function __construct(Request $request)
    {
        $this->request = $request;

        var_dump($this->request);
    }
}
