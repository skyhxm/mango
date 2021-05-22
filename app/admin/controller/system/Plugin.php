<?php
/**
 * +----------------------------------------------------------------------
 * | 插件管理控制器
 * +----------------------------------------------------------------------
 */
namespace app\admin\controller\system;

use app\admin\facade\ThinkAddons;

// 插件服务
use app\common\builder\FormBuilder;
use app\common\controller\AdminController;
use mango\Http;
use think\facade\Request;
use think\facade\View;
use ZipArchive;

class Plugin extends AdminController
{
    public function getList()
    {
        // 获取插件列表
        $list = ThinkAddons::localAddons();

        return json([
            'code'  => 0,
            'count' => count($list),
            'data'  => $list,
            'msg'   => '查询成功',
        ]);
    }
    // 列表
    public function index()
    {
        return View::fetch();
    }

    // 插件配置信息预览
    public function config(string $name)
    {
        $config = ThinkAddons::config($name);
        // 如果插件自带配置模版的话加载插件自带的，否则调用表单构建器
        $file = app()->getRootPath() . 'addons' . DIRECTORY_SEPARATOR . $name . DIRECTORY_SEPARATOR . 'config.html';
        if (file_exists($file)) {
            View::assign([
                'config' => $config,
            ]);
            return View::fetch($file);
        } else {
            // 获取字段数据
            $columns = $this->makeAddColumns($config);
            // 判断是否分组
            $group = ThinkAddons::checkConfigGroup($config);
            // 构建页面
            $builder = FormBuilder::getInstance();
            $builder->setFormUrl(url('configSave'))
                ->addHidden('id', $name);
            $group ? $builder->addGroup($columns) : $builder->addFormItems($columns);
            return $builder->fetch();
        }
    }

    // 插件配置信息保存
    public function configSave()
    {
        if (Request::isPost()) {
            $result = ThinkAddons::configPost(Request::except(['file'], 'post'));
            if ($result['code'] == 1) {
                $this->success($result['msg'], 'index');
            } else {
                $this->error($result['msg']);
            }
        }
    }

    // 更改插件状态 [启用/禁用]
    public function state(string $id)
    {
        return ThinkAddons::state($id);
    }

    // 安装插件
    public function install(string $id)
    {
        return ThinkAddons::install($id);
    }
    // 安装插件
    public function refresh()
    {
        return ThinkAddons::refresh();
    }

    // 卸载插件
    public function uninstall(string $id)
    {
        return ThinkAddons::uninstall($id);
    }

    // =========================================

    // 生成表单信息
    private function makeAddColumns(array $config)
    {
        // 判断是否开启了分组
        if (ThinkAddons::checkConfigGroup($config) === false) {
            // 未开启分组
            return $this->makeAddColumnsArr($config);
        } else {
            $columns = [];
            // 开启分组
            foreach ($config as $k => $v) {
                $columns[$k] = $this->makeAddColumnsArr($v);
            }
            return $columns;
        }
    }

    // 生成表单返回数组
    private function makeAddColumnsArr(array $config)
    {
        $columns = [];
        foreach ($config as $k => $field) {
            // 初始化
            $field['name']     = $field['name'] ?? $field['title'];
            $field['field']    = $k;
            $field['tips']     = $field['tips'] ?? '';
            $field['required'] = $field['required'] ?? 0;
            $field['group']    = $field['group'] ?? '';
            if (!isset($field['setup'])) {
                $field['setup'] = [
                    'default'     => $field['value'] ?? '',
                    'extra_attr'  => $field['extra_attr'] ?? '',
                    'extra_attr'  => $field['extra_attr'] ?? '',
                    'extra_class' => $field['extra_class'] ?? '',
                    'placeholder' => $field['placeholder'] ?? '',
                ];
            }

            if ($field['type'] == 'text') {
                $columns[] = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['name'], // 字段别名
                    $field['tips'], // 提示信息
                    $field['setup']['default'], // 默认值
                    $field['group'], // 标签组，可以在文本框前后添加按钮或者文字
                    $field['setup']['extra_attr'], // 额外属性
                    $field['setup']['extra_class'], // 额外CSS
                    $field['setup']['placeholder'], // 占位符
                    $field['required'], // 是否必填
                ];
            } elseif ($field['type'] == 'textarea' || $field['type'] == 'password') {
                $columns[] = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['name'], // 字段别名
                    $field['tips'], // 提示信息
                    $field['setup']['default'], // 默认值
                    $field['setup']['extra_attr'], // 额外属性
                    $field['setup']['extra_class'] ?? '', // 额外CSS
                    $field['setup']['placeholder'] ?? '', // 占位符
                    $field['required'], // 是否必填
                ];
            } elseif ($field['type'] == 'radio' || $field['type'] == 'checkbox') {
                $columns[] = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['name'], // 字段别名
                    $field['tips'], // 提示信息
                    $field['options'], // 选项（数组）
                    $field['setup']['default'], // 默认值
                    $field['setup']['extra_attr'], // 额外属性 extra_attr
                    '', // 额外CSS extra_class
                    $field['required'], // 是否必填
                ];
            } elseif ($field['type'] == 'select' || $field['type'] == 'select2') {
                $columns[] = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['name'], // 字段别名
                    $field['tips'], // 提示信息
                    $field['options'], // 选项（数组）
                    $field['setup']['default'], // 默认值
                    $field['setup']['extra_attr'], // 额外属性
                    $field['setup']['extra_class'] ?? '', // 额外CSS
                    $field['setup']['placeholder'] ?? '', // 占位符
                    $field['required'], // 是否必填
                ];
            } elseif ($field['type'] == 'number') {
                $columns[] = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['name'], // 字段别名
                    $field['tips'], // 提示信息
                    $field['setup']['default'], // 默认值
                    '', // 最小值
                    '', // 最大值
                    $field['setup']['step'], // 步进值
                    $field['setup']['extra_attr'], // 额外属性
                    $field['setup']['extra_class'], // 额外CSS
                    $field['setup']['placeholder'] ?? '', // 占位符
                    $field['required'], // 是否必填
                ];
            } elseif ($field['type'] == 'hidden') {
                $columns[] = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['setup']['default'] ?? '', // 默认值
                    $field['setup']['extra_attr'] ?? '', // 额外属性 extra_attr
                ];
            } elseif ($field['type'] == 'date' || $field['type'] == 'time' || $field['type'] == 'datetime') {
                // 使用每个字段设定的格式
                if ($field['type'] == 'time') {
                    $field['setup']['format'] = str_replace("HH", "h", $field['setup']['format']);
                    $field['setup']['format'] = str_replace("mm", "i", $field['setup']['format']);
                    $field['setup']['format'] = str_replace("ss", "s", $field['setup']['format']);
                    $format                   = $field['setup']['format'] ?? 'H:i:s';
                } else {
                    $field['setup']['format'] = str_replace("yyyy", "Y", $field['setup']['format']);
                    $field['setup']['format'] = str_replace("mm", "m", $field['setup']['format']);
                    $field['setup']['format'] = str_replace("dd", "d", $field['setup']['format']);
                    $field['setup']['format'] = str_replace("hh", "h", $field['setup']['format']);
                    $field['setup']['format'] = str_replace("ii", "i", $field['setup']['format']);
                    $field['setup']['format'] = str_replace("ss", "s", $field['setup']['format']);
                    $format                   = $field['setup']['format'] ?? 'Y-m-d H:i:s';
                }
                $field['setup']['default'] = $field['setup']['default'] > 0 ? date($format, $field['setup']['default']) : '';
                $columns[]                 = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['name'], // 字段别名
                    $field['tips'], // 提示信息
                    $field['setup']['default'], // 默认值
                    $field['setup']['format'], // 日期格式
                    $field['setup']['extra_attr'], // 额外属性 extra_attr
                    '', // 额外CSS extra_class
                    $field['setup']['placeholder'], // 占位符
                    $field['required'], // 是否必填
                ];
            } elseif ($field['type'] == 'daterange') {
                $columns[] = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['name'], // 字段别名
                    $field['tips'], // 提示信息
                    $field['setup']['default'], // 默认值
                    $field['setup']['format'], // 日期格式
                    $field['setup']['extra_attr'] ?? '', // 额外属性
                    $field['setup']['extra_class'] ?? '', // 额外CSS
                    $field['required'], // 是否必填
                ];
            } elseif ($field['type'] == 'tag') {
                $columns[] = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['name'], // 字段别名
                    $field['tips'], // 提示信息
                    $field['setup']['default'], // 默认值
                    $field['setup']['extra_attr'] ?? '', // 额外属性
                    $field['setup']['extra_class'] ?? '', // 额外CSS
                    $field['required'], // 是否必填
                ];
            } elseif ($field['type'] == 'image' || $field['type'] == 'images' || $field['type'] == 'file' || $field['type'] == 'files') {
                $columns[] = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['name'], // 字段别名
                    $field['tips'], // 提示信息
                    $field['setup']['default'], // 默认值
                    $field['setup']['size'], // 限制大小（单位kb）
                    $field['setup']['ext'], // 文件后缀
                    $field['setup']['extra_attr'] ?? '', // 额外属性
                    $field['setup']['extra_class'] ?? '', // 额外CSS
                    $field['setup']['placeholder'] ?? '', // 占位符
                    $field['required'], // 是否必填
                ];
            } elseif ($field['type'] == 'editor') {
                $columns[] = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['name'], // 字段别名
                    $field['tips'], // 提示信息
                    $field['setup']['default'], // 默认值
                    $field['setup']['heidht'] ?? 0, // 高度
                    $field['setup']['extra_attr'] ?? '', // 额外属性
                    $field['setup']['extra_class'] ?? '', // 额外CSS
                    $field['required'], // 是否必填
                ];
            } elseif ($field['type'] == 'color') {
                $columns[] = [
                    $field['type'], // 类型
                    $field['field'], // 字段名称
                    $field['name'], // 字段别名
                    $field['tips'], // 提示信息
                    $field['setup']['default'], // 默认值
                    $field['setup']['extra_attr'] ?? '', // 额外属性
                    $field['setup']['extra_class'] ?? '', // 额外CSS
                    $field['setup']['placeholder'] ?? '', // 占位符
                    $field['required'], // 是否必填
                ];
            }
        }
        return $columns;
    }

    // 生成列表页额外JS
    private function makeExtraJs()
    {
        $js = '<script type="text/javascript">
                // 安装
                $.operate.pluginInstall = function(id) {
                    var url = \'' . url('install') . '\';
                    $.modal.confirm("确认要安装?", function () {
                        var data = {"id": id};
                        $.operate.submit(url, "post", "json", data);
                    });
                }
                // 卸载
                $.operate.pluginUninstall = function(id) {
                    var url = \'' . url('uninstall') . '\';
                    $.modal.confirm("确认要卸载?", function () {
                        var data = {"id": id};
                        $.operate.submit(url, "post", "json", data);
                    });
                }
            </script>';
        return $js;
    }

    // 获取全部插件==========================================================================================
    public function getAllplug()
    {
        //$list = Market::field('name,intro,description,author,version,price,sales')->select();
        $res = Http::get(self::getServerUrl() . '/api/plug/index');
        // dd($res);
        $list = json_decode($res, true)['data'];

        if ($list) {
            # code...
            foreach ($list as $key => $value) {
                // 增加右侧按钮组
                $str   = '';
                $file  = $value['name'] ? $value['name'] : 'addons';
                $class = "\\addons\\{$file}\\Plugin";
                if (class_exists($class)) {
                    // 容器类的工作由think\Container类完成，但大多数情况我们只需要通过app助手函数或者think\App类即可容器操作
                    $appinfo = app($class);
                    $info    = $appinfo->getInfo();

                    if (isset($info['install']) && $info['install'] == 1) {
                        // 已安装，增加配置按钮
                        $str .= '<a class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:void(0)" data-name="' . $file . '" lay-event="config"><i class="fa fa-edit"></i> 配置</a> ';
                        $str .= '<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0)" data-name="' . $file . '" lay-event="uninstall"><i class="fa fa-edit"></i> 卸载</a> ';
                        if ($info['status'] == 1) {
                            $str .= '<a class="layui-btn layui-btn-warm layui-btn-xs" href="javascript:void(0)" data-name="' . $file . '" lay-event="state"><i class="fa fa-edit"></i>禁用</a>';
                        } else {
                            $str .= '<a class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:void(0)" data-name="' . $file . '" lay-event="state"><i class="fa fa-edit"></i>启用</a>';
                        }
                    } else {
                        // 未安装，增加安装按钮
                        $str = '<a class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:void(0)" data-name="' . $file . '" lay-event="remoteInstall"><i class="fa fa-edit"></i> 安装</a>';
                    }

                    $list[$key]['button'] = $str;
                    $list[$key]['status'] = $info['status'];
                    $list[$key]['name']   = $value['name']; //插件识别标识
                    $list[$key]['title']  = $value['title'];
                } else {
                    //本地没安装此插件跳出
                    // 未安装，增加安装按钮
                    $str = '<a class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:void(0)" data-name="' . $file . '" lay-event="remoteInstall"><i class="fa fa-edit"></i> 安装</a>';

                    $list[$key]['status']  = 0;
                    $list[$key]['name']    = $value['name']; //插件识别标识
                    $list[$key]['title']   = $value['title'];
                    $list[$key]['button']  = $str;
                    $list[$key]['sales']   = $value['sales'];
                    $list[$key]['version'] = $value['version'];
                    continue;
                }
            }

        } else {
            $list = [];
        }

        return json(['code' => 0, 'count' => count($list), 'data' => $list, 'msg' => '查询成功']);
    }

    // 安装远程插件
    public function remoteInstall(string $id)
    {
        // dd(input());
        $parmers       = input();
        $caomei_tokeny = '';
        if (isset($parmers['token']) && !empty($parmers['token'])) {
            $caomei_tokeny = $parmers['token'];
        }

        // $list = Market::where(['intro'=>$id])->find();
        // if( empty($list) ){
        //     return json(['code'=> 0,'msg'=>'插件错误，请联系管理员']);
        // }

        $pay_type = isset($parnms['pay_type']) ? $parnms['pay_type'] : '1'; //1微信，2支付宝

        // 远程下载插件
        $tmpFile = $this->download($id, ['token' => $caomei_tokeny, 'pay_type' => $pay_type]);
        // dump($tmpFile);die;
        if ($tmpFile['code'] != '1') {
            return json($tmpFile);
        }

        // 解压插件
        $addonDir = $this->unzip($id);

        return ThinkAddons::install($id);

        //return json(['code'=> 1,'count'=>0,'data'=>$list, 'msg'=>$list['name'].'插件安装成功']);
    }

    /**
     * 远程下载插件
     *
     * @param   string $name 插件名称
     * @param   array $extend 扩展参数
     * @return  string
     * @throws  AddonException
     * @throws  Exception
     */
    public static function download($name, $extend = [])
    {
        $addonTmpDir = './runtime/addons/';

        if (!is_dir($addonTmpDir)) {
            @mkdir($addonTmpDir, 0755, true);
        }
        $tmpFile = $addonTmpDir . $name . ".zip";
        // dd($tmpFile);
        $options = [
            CURLOPT_CONNECTTIMEOUT => 30,
            CURLOPT_TIMEOUT        => 30,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_HTTPHEADER     => [
                'X-REQUESTED-WITH: XMLHttpRequest',
            ],
        ];
        $ret = Http::sendRequest(self::getServerUrl() . '/api/plug/down', array_merge(['name' => $name], $extend), 'GET', $options);

        // dump($ret);die;
        if ($ret['ret']) {
            if (substr($ret['msg'], 0, 1) == '{') {
                $json = (array) json_decode($ret['msg'], true);
                //如果传回的是一个下载链接,则再次下载
                if (isset($json['data']) && isset($json['data']['file'])) {
                    array_pop($options);
                    $ret = Http::sendRequest(self::getServerUrl() . $json['data']['file'],
                        array_merge(['name' => $name], $extend), 'GET', $options);
                    if (!$ret['ret']) {
                        //下载返回错误，抛出异常
                        return ['msg' => $json['msg'], 'code' => $json['code'], 'data' => $json['data']];
                    }
                } else {
                    //下载返回错误，抛出异常
                    return $json;
                }
            }
            // dump($tmpFile);die;
            if ($write = fopen($tmpFile, 'w')) {
                fwrite($write, $ret['msg']);
                fclose($write);
                return ['msg' => '下载成功', 'code' => '1'];
            }
            exit("没有权限写入临时文件");
        }
        exit("无法下载远程文件");
    }

    /**
     * 解压插件
     *
     * @param   string $name 插件名称
     * @return  string
     * @throws  Exception
     */
    public static function unzip($name)
    {
        $addonTmpDir = './runtime/addons/';
        $file        = $addonTmpDir . $name . ".zip";

        $dir = './addons/';
        if (class_exists('ZipArchive')) {
            $zip = new ZipArchive;
            if ($zip->open($file) !== true) {
                exit('Unable to open the zip file');
            }
            if (!$zip->extractTo($dir)) {
                $zip->close();
                exit('Unable to extract the file');
            }
            $zip->close();
            //删除文件
            @unlink($file);
            return $dir;
        }
        exit("无法执行解压操作，请确保ZipArchive安装正确");
    }

    /**
     * 获取远程服务器
     * @return  string
     */
    protected static function getServerUrl()
    {
        //测试域名
        // return 'http://ruan.cn';
        return 'https://ruanzubao.com';
    }
}
