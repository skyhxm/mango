<?php

namespace app\admin\controller\system;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use think\App;
use think\facade\Cache;
use think\facade\Db;

/**
 * @ControllerAnnotation(title="system_command")
 */
class Command extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\system\Command();

    }

    /**
     * @NodeAnotation(title="添加")
     */
    public function add()
    {
        $s_time = time();
        $result = '';
        $cmd    = '';
        if ($this->request->isAjax()) {
            $post = $this->request->request();
            $type = $post['type'];
            switch ($type) {
                case 'crud':
                    $cmd = $this->createCmd($post);
                    if ($post['cmd'] == 1) {
                        return json($cmd);
                    } else {
                        if (env('mango.is_demo')) {
                            $result = '演示环境禁止执行';
                        } else {
                            $result = shell_exec($cmd);
                        }
                        // dd($result);
                    }
                    break;
                case 'menu':
                    $cmd = $this->createMenu($post);
                    Cache::clear();
                    if ($post['cmd'] == 1) {
                        return json($cmd);
                    } else {
                        $result = 'success';
                        // dd($result);
                    }
                    break;
                default:
                    # code...
                    break;
            }
            $rule                = [];
            $post['content']     = $result;
            $post['command']     = $cmd;
            $post['createtime']  = time();
            $post['executetime'] = time() - $s_time;
            $post['status']      = $result ? 'successed' : 'failured';
            $post['params']      = str_replace('php think curd -t ', '', $cmd);
            $post['params']      = str_replace('php think menu ', '', $cmd);
            $this->validate($post, $rule);
            try {
                $save = $this->model->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败:' . $e->getMessage());
            }
            $save ? $this->success('保存成功', $result ? $result . '！' : 'failured！') : $this->error('保存失败');
        }
        // 数据库所有表
        $tables = Db::getTables();
        $this->assign('tables', $tables);
        // 控制器
        $controllers = $this->get_controller_list();
        $this->assign('controllers', $controllers);
        return $this->fetch();
    }

    /**
     * 根据表名称获取字段
     */
    public function getFields()
    {
        $tableName = $this->request->get('table_name', 'm_mall_cate');
        $fields    = Db::getFields($tableName);
        $keys      = array_keys($fields);
        foreach ($keys as $key => &$value) {
            $res['name']  = $value;
            $res['value'] = $value;
            $result[]     = $res;
        }
        return json($result);
    }

    /**
     * 创建phpcmd命令
     */
    private function createCmd($post)
    {
        // 表前缀
        $prefix = config('database.connections.mysql.prefix');
        // 主表
        $mtable = $post['mtable'];
        $mtable = str_replace($prefix, '', $mtable);
        // 主表
        $main_cmd = $this->mainTable($post);
        // 基础命令
        $cmd = 'php think curd -t ' . $mtable;
        // 有主表
        if ($main_cmd) {
            $cmd .= $main_cmd;
        }
        // 模型设置
        $set_model = @$post['set_model'];
        // 模型设置
        $cmd_model = $this->setModel($set_model, $post);

        return $cmd . $cmd_model;
    }

    /**
     * 模型设置
     */
    private function setModel($set_model, $post)
    {
        // 命令
        $cmd = '';
        // 存在模型设置
        if ($set_model) {
            // 关联模型
            $relation = @$set_model['relation'];
            if ($relation) {
                $cmd .= $this->relationModel($post);
            }
            // 全局模型
            $global = @$set_model['global'];
            if ($global) {
                $cmd .= $this->globalModel();
            }
            // 删除模型
            $delete = @$set_model['delete'];
            if ($delete) {
                $cmd .= $this->deleteModel();
            }
            // 强制覆盖模型
            $force = @$set_model['force'];
            if ($force) {
                $cmd .= $this->forceModel();
            }
        }

        return $cmd;
    }

    /**
     * 关联模型
     */
    private function relationModel($post)
    {
        $prefix = config('database.connections.mysql.prefix');
        $cmd    = '';
        // 关联数量
        $numbers = $post['numbers'];
        // 循环数量
        for ($i = 1; $i <= $numbers; $i++) {
            $otable = str_replace($prefix, '', $post['otable' . $i]);
            // -r test_cate --foreignKey=cate_id --primaryKey=id
            $cmd .= ' -r ' . $otable . ' --foreignKey=' . $post['okey' . $i] . ' --primaryKey=' . $post['mkey' . $i] . ' --relationOnlyFileds=' . $post['ofields' . $i];
        }

        return $cmd;
    }

    /**
     * 全局模型
     */
    private function globalModel()
    {

    }

    /**
     * 删除模型
     */
    private function deleteModel()
    {
        return ' -d 1';
    }

    /**
     * 强制覆盖模型
     */
    private function forceModel()
    {
        return ' -f 1';
    }

    /**
     * 主表
     */
    private function mainTable($post)
    {
        $cmd = '';
        // 主表字段
        $mfields = $post['mfields'];
        if ($mfields) {
            $cmd .= ' --relationOnlyFileds=' . $mfields;
        }
        // 主表控制器
        $controller = $post['controller'];
        if ($controller) {
            $cmd .= ' -c ' . $controller;
        }
        // 主表模型
        $model = $post['model'];
        if ($model) {
            $cmd .= ' -m ' . $model;
        }

        // dd($cmd);
        return $cmd;
    }

    /**
     * 获取控制器列表
     * @internal
     */
    public function get_controller_list()
    {
        $adminPath     = dirname(__DIR__) . DS;
        $controllerDir = $adminPath;
        // dd($controllerDir);
        $files = new \RecursiveIteratorIterator(
            new \RecursiveDirectoryIterator($controllerDir), \RecursiveIteratorIterator::LEAVES_ONLY
        );
        $list = [];
        foreach ($files as $name => $file) {
            if (!$file->isDir()) {
                $filePath = $file->getRealPath();
                $name     = str_replace($controllerDir, '', $filePath);
                $name     = str_replace(DS, "/", $name);
                $list[]   = ['id' => $name, 'name' => $name];
            }
        }

        return $list;
        $pageNumber = $this->request->request("pageNumber");
        $pageSize   = $this->request->request("pageSize");
        return json(['list' => array_slice($list, ($pageNumber - 1) * $pageSize, $pageSize), 'total' => count($list)]);
    }

    /**
     * 创建菜单
     */
    private function createMenu($post)
    {
        $mtable    = $post['mtable'];
        $mtable    = str_replace('/', '.', $mtable);
        $mtable    = str_replace('.php', '/index', $mtable);
        $mtable    = strtolower($mtable);
        $set_model = @$post['set_model'];
        if ($set_model) {
            $delete = @$set_model['delete'];
            if ($delete) {
                Db::name('system_menu')->where('href', $mtable)->delete();
            }
        }

        $menu_data = [
            'pid'         => 2,
            'title'       => $post['name_menu'],
            'icon'        => 'fa fa-list',
            'href'        => $mtable,
            'target'      => '_self',
            'create_time' => time(),
        ];
        if (env('mango.is_demo')) {
            $return = '演示环境禁止执行';
        }
        if ($post['cmd'] == 1) {
            goto b;
        }
        if (@$set_model['force']) {
            Db::name('system_menu')->where('href', $mtable)->delete();
            Db::name('system_menu')->insert($menu_data);
        } else {
            $menu = Db::name('system_menu')->where('href', $mtable)->find();
            if (!$menu) {
                Db::name('system_menu')->insert($menu_data);
            }
        }
        b:
        return 'php think menu --controller ' . $post['mtable'];
    }
}
