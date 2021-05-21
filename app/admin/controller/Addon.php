<?php
namespace app\admin\controller;

use app\admin\traits\Curd;
use app\common\constants\AdminConstant;
use app\common\controller\AdminController;
use EasyAdmin\annotation\NodeAnotation;
use think\facade\Request;
use think\facade\View;

class Addon extends AdminController
{
    use Curd;
    protected $layout = 'layout/default';
    protected $thisControllerJsPath;

    public function __construct($app, $_addon_name, $_model_name)
    {
        parent::__construct($app);
        View::config([
            'view_path' => './addons/' . $_addon_name . '/view' . DIRECTORY_SEPARATOR,
        ]);
        $this->thisControllerJsPath = request()->domain() . '/addons/' . $_addon_name . '/js/back.js';
        $this->handle($_addon_name);
        View::layout($this->layout);
        View::assign('version', time());
        $this->model = new $_model_name();
    }

    public function handle($_addon_name)
    {
        list($thisModule, $thisController, $thisAction) = [app('http')->getName(), Request::controller(), Request::action()];
        list($thisControllerArr, $jsPath)               = [explode('.', $thisController), null];
        foreach ($thisControllerArr as $vo) {
            empty($jsPath) ? $jsPath = parse_name($vo) : $jsPath .= '/' . parse_name($vo);
        }
        // $autoloadJs = file_exists(root_path('public')."static/{$thisModule}/js/{$jsPath}.js") ? true : false;
        $autoloadJs = file_exists("./addons/{$_addon_name}/js/{$jsPath}.js") ? true : false;
        // dump("./addons/{$_addon_name}/js/{$jsPath}.js");
        // dump($autoloadJs);
        $thisControllerJsPath = $this->thisControllerJsPath;
        $adminModuleName      = config('app.admin_alias_name');
        $isSuperAdmin         = session('admin.id') == AdminConstant::SUPER_ADMIN_ID ? true : false;
        $data                 = [
            'adminModuleName'      => $adminModuleName,
            'thisController'       => parse_name($thisController),
            'thisAction'           => $thisAction,
            'thisRequest'          => parse_name("{$thisModule}/{$thisController}/{$thisAction}"),
            'thisControllerJsPath' => "{$thisControllerJsPath}",
            'autoloadJs'           => $autoloadJs,
            'isSuperAdmin'         => $isSuperAdmin,
            'version'              => env('app_debug') ? time() : ConfigService::getVersion(),
        ];
        // dump($data);
        View::assign($data);
    }

    /**
     * @NodeAnotation(title="删除")
     */
    public function delete()
    {
        $id  = input('id');
        $row = $this->model->whereIn('id', $id)->select();
        $row->isEmpty() && $this->error('数据不存在');
        try {
            $save = $row->delete();
        } catch (\Exception $e) {
            $this->error('删除失败');
        }
        $save ? $this->success('删除成功') : $this->error('删除失败');
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit()
    {
        $id  = input('id');
        $row = $this->model->find($id);
        empty($row) && $this->error('数据不存在');
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $rule = [];
            $this->validate($post, $rule);
            try {
                $save = $row->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="添加")
     */
    public function add()
    {
        if ($this->request->isAjax()) {
            $post             = $this->request->post();
            $authIds          = $this->request->post('auth_ids', []);
            $post['auth_ids'] = implode(',', array_keys($authIds));
            $rule             = [];
            $this->validate($post, $rule);
            try {
                $save = $this->model->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            $count                      = $this->model
                ->where($where)
                ->count();
            $list = $this->model
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ];
            return json($data);
        }
        return $this->fetch();
    }
}
