<?php

namespace app\common\library;

use app\common\model\SystemMenu;
use mango\Tree;
use think\Exception;

class Menu
{

    /**
     * 创建菜单
     * @param array $menu
     * @param mixed $parent 父类的name或pid
     */
    public static function create($menu, $parent = 0)
    {
        if (!is_numeric($parent)) {
            $parentRule = SystemMenu::getByHref($parent);
            $pid = $parentRule ? $parentRule['id'] : 0;
        } else {
            $pid = $parent;
        }
        $allow = array_flip(['file', 'href', 'title', 'icon', 'condition', 'remark', 'ismenu','weigh']);
        foreach ($menu as $k => $v) {
            $hasChild = isset($v['sublist']) && $v['sublist'] ? true : false;

            $data = array_intersect_key($v, $allow);

            $data['ismenu'] = isset($data['ismenu']) ? $data['ismenu'] : ($hasChild ? 1 : 0);
            $data['icon'] = isset($data['icon']) ? $data['icon'] : ($hasChild ? 'fa-list' : '');
            $data['pid'] = $pid;
            $data['status'] = '1';
            try {
                $menu = SystemMenu::create($data);
                if ($hasChild) {
                    self::create($v['sublist'], $menu->id);
                }
            } catch (Exception $e) {
                throw new Exception($e->getMessage());
            }
        }
    }

    /**
     * 删除菜单
     * @param string $name 规则name
     * @return boolean
     */
    public static function delete($name)
    {
        $ids = self::getSystemMenuIdsByName($name);
        if (!$ids) {
            return false;
        }
        SystemMenu::destroy($ids);
        return true;
    }

    /**
     * 启用菜单
     * @param string $name
     * @return boolean
     */
    public static function enable($name)
    {
        $ids = self::getSystemMenuIdsByName($name);
        if (!$ids) {
            return false;
        }
        SystemMenu::where('id', 'in', $ids)->update(['status' => '1']);
        return true;
    }

    /**
     * 禁用菜单
     * @param string $name
     * @return boolean
     */
    public static function disable($name)
    {
        $ids = self::getSystemMenuIdsByName($name);
        if (!$ids) {
            return false;
        }
        SystemMenu::where('id', 'in', $ids)->update(['status' => 'hidden']);
        return true;
    }

    /**
     * 导出指定名称的菜单规则
     * @param string $name
     * @return array
     */
    public static function export($name)
    {
        $ids = self::getSystemMenuIdsByName($name);
        if (!$ids) {
            return [];
        }
        $menuList = [];
        $menu = SystemMenu::getByHref($name);
        if ($menu) {
            $ruleList = collection(SystemMenu::where('id', 'in', $ids)->select())->toArray();
            $menuList = Tree::instance()->init($ruleList)->getTreeArray($menu['id']);
        }
        return $menuList;
    }

    /**
     * 根据名称获取规则IDS
     * @param string $name
     * @return array
     */
    public static function getSystemMenuIdsByName($name)
    {
        $ids = [];
        $menu = SystemMenu::getByHref($name);
        if ($menu) {
            // 必须将结果集转换为数组
            $ruleList = SystemMenu::order('sort', 'desc')->field('id,pid,href')->select()->toArray();
            
            // 构造菜单数据
            $ids = Tree::instance()->init($ruleList)->getChildrenIds($menu['id'], true);
        }
       
        return $ids;
    }

}
