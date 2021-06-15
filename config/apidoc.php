<?php
return [
    // 文档标题
    'title'              => 'APi接口文档',
    // 文档描述
    'desc'               => '',
    // 版权申明
    'copyright'          => 'Powered By hg-code',
    // 默认作者
    'default_author'     => 'mango',
    // 默认请求类型
    'default_method'     => 'POST',
    // 设置应用/版本（必须设置）
    'apps'               => [
        ['title' => 'v1.0', 'path' => 'app\api\controller', 'folder' => 'v1'],
    ],
    // 控制器分组
    'groups'             => [
        ['title' => '基础模块', 'name' => 'base'],
        ['title' => 'API', 'name' => 'api'],
    ],
    // 指定公共注释定义的文件地址
    'definitions'        => "app\api\common\controller\Definitions",
    //指定生成文档的控制器
    'controllers'        => [],
    // 过滤，不解析的控制器
    'filter_controllers' => [],
    // 缓存配置
    'cache'              => [
        // 是否开启缓存
        'enable' => false,
        // 缓存文件路径
<<<<<<< HEAD
        'path'   => './runtime/apidoc/',
=======
        'path'   => '../runtime/apidoc/',
>>>>>>> a45c881b3f81953d04d8835ae8f7848ae0d62289
        // 是否显示更新缓存按钮
        'reload' => true,
        // 最大缓存文件数
        'max'    => 5, //最大缓存数量
    ],
    // 权限认证配置
    'auth'               => [
        // 是否启用密码验证
<<<<<<< HEAD
        'enable'     => false,
=======
        'enable'     => true,
>>>>>>> a45c881b3f81953d04d8835ae8f7848ae0d62289
        // 验证密码
        'password'   => "123456",
        // 密码加密盐
        'secret_key' => "apidoc#hg_code",
    ],
    // 统一的请求Header
    'headers'            => [],
    // 统一的请求参数Parameters
    'parameters'         => [],
    // 统一的请求响应体，仅显示在文档提示中
    'responses'          => [
        ['name' => 'code', 'desc' => '状态码', 'type' => 'int'],
        ['name' => 'msg', 'desc' => '操作描述', 'type' => 'string'],
        ['name' => 'time', 'desc' => '时间', 'type' => 'string'],
        ['name' => 'data', 'desc' => '业务数据', 'main' => true, 'type' => 'object'],
    ],
    // md文档
    'docs'               => [
        'menu_title' => '开发文档',
        'menus'      => [],
    ],
    'crud'               => [],

];
