<?php
namespace addons\php_cli\controller;

use addons\login_page\model\LoginPage;
use app\admin\traits\Curd;
use app\common\constants\AdminConstant;
use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;
use think\facade\Request;
use think\facade\View;

/**
 * Class Admin
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="商品分类管理")
 */
class Back extends AdminController
{
    use Curd;
    protected $layout = 'layout/default';
    protected $thisControllerJsPath;

    public function __construct(App $app)
    {
        parent::__construct($app);
        View::config([
            'view_path' => '../addons/php_cli/view' . DIRECTORY_SEPARATOR,
        ]);
        $this->thisControllerJsPath = 'addons/php_cli/js/back.js';
        $this->handle();
        View::layout($this->layout);
        View::assign('version', time());
        $this->model = new LoginPage();
    }

    public function handle()
    {
        list($thisModule, $thisController, $thisAction) = [app('http')->getName(), Request::controller(), Request::action()];
        list($thisControllerArr, $jsPath)               = [explode('.', $thisController), null];
        foreach ($thisControllerArr as $vo) {
            empty($jsPath) ? $jsPath = parse_name($vo) : $jsPath .= '/' . parse_name($vo);
        }
        $autoloadJs = file_exists(root_path('public') . "static/{$thisModule}/js/{$jsPath}.js") ? true : false;
        // dump(root_path('public')."static/{$thisModule}/js/{$jsPath}.js");
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

    //     /**
    //  * @NodeAnotation(title="添加")
    //  */
    // public function add()
    // {
    //     if ($this->request->isAjax()) {
    //         $post = $this->request->post();
    //         $authIds = $this->request->post('auth_ids', []);
    //         $post['auth_ids'] = implode(',', array_keys($authIds));
    //         $rule = [];
    //         $this->validate($post, $rule);
    //         try {
    //             $save = $this->model->save($post);
    //         } catch (\Exception $e) {
    //             $this->error('保存失败');
    //         }
    //         $save ? $this->success('保存成功') : $this->error('保存失败');
    //     }
    //     return $this->fetch();
    // }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $a        = input('a');
            $validate = substr(trim($a), 0, 3);
            // dd($a);
            if (!strstr($validate, 'php')) {
                return json(['code' => 1, 'msg' => '只支持php相关命令']);
            }

            $a = str_replace('php think', 'php ../think', $a);
            // 调用命令行的指令
            $output = `$a`;
            $output = iconv("utf-8", "gbk//IGNORE", $output);
            $output = mb_convert_encoding($output, 'UTF-8', 'GBK');
            return json(['code' => 1, 'msg' => $output]);
        }
        return $this->fetch();
    }

}
