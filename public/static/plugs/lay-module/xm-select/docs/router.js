import Component from './components/component.vue';
import { version } from '../package.json'

function importVue(path) {
	return r => require.ensure([], () => r(require(`./pages${path}.vue`)));
}
function importMd(path) {
	return r => require.ensure([], () => r(require(`./mds${path}.md`)));
}



export default [{
		path: '*',
		hidden: true,
		redirect: '/',
	},{
		path: '/',
		name: '/',
		hidden: true,
		redirect: '/component',
	}, {
		path: '/changelog',
		name: '更新日志 v' + version,
		component: importVue('/changelog'),
	}, {
		path: '/add',
		name: 'QQ群: 1145047250',
		redirect: '/',
	}, {
		path: '/component',
		name: '入门指南',
		redirect: '/component/install',
		component: Component,
		children: [{
			path: '/component/install',
			name: '安装与使用',
			component: importMd('/install'),
		}, {
			path: '/component/options',
			name: '配置项与方法',
			component: importMd('/options'),
		}]
	}, {
		path: '/basic',
		name: '示例',
		redirect: '/basic/base',
		component: Component,
		children: [
            { path: '/basic/use', 		name: 'Base 基础使用', component: importMd('/XM01') },
            { path: '/basic/language', 	name: 'Language 国际化', component: importMd('/XM02') },
            { path: '/basic/initValue', name: 'InitValue 默认选中', component: importMd('/XM03') },
            { path: '/basic/tips', 		name: 'Tips 修改提示', component: importMd('/XM04') },
            { path: '/basic/filter', 	name: 'Filterable 搜索模式', component: importMd('/XM05') },
            { path: '/basic/direction', name: 'Direction 下拉方向', component: importMd('/XM06') },
            { path: '/basic/style', 	name: 'Style 自定义样式', component: importMd('/XM07') },
            { path: '/basic/paging', 	name: 'Paging 分页', component: importMd('/XM08') },
            { path: '/basic/radio', 	name: 'Radio 单选', component: importMd('/XM09') },
            { path: '/basic/repeat', 	name: 'Repeat 重复选', component: importMd('/XM10') },
            { path: '/basic/prop', 		name: 'Prop 自定义属性', component: importMd('/XM11') },
            { path: '/basic/theme', 	name: 'Theme 主题', component: importMd('/XM12') },
            { path: '/basic/show', 		name: 'Show 显示与隐藏', component: importMd('/XM13') },
            { path: '/basic/model', 	name: 'Model 显示方式', component: importMd('/XM14') },
            { path: '/basic/template', 	name: 'Template 构建选项', component: importMd('/XM15') },
            { path: '/basic/on', 		name: 'On 监听选择', component: importMd('/XM16') },
            { path: '/basic/test', 		name: 'Test 性能测试', component: importMd('/XM17') },
            { path: '/basic/max', 		name: 'Max 多选上限', component: importMd('/XM18') },
            { path: '/basic/toolbar', 	name: 'Toolbar 工具条', component: importMd('/XM19') },
            { path: '/basic/showCount', name: 'ShowCount 选项数量', component: importMd('/XM20') },
            { path: '/basic/optgroup', 	name: 'Optgroup 分组', component: importMd('/XM21') },
            { path: '/basic/autoRow', 	name: 'AutoRow 自动换行', component: importMd('/XM22') },
            { path: '/basic/hiddenIcon',name: 'HiddenIcon 隐藏图标', component: importMd('/XM23') },
            { path: '/basic/size', 		name: 'Size 尺寸', component: importMd('/XM24') },
            { path: '/basic/warning', 	name: 'Warning 警告', component: importMd('/XM25') },
            { path: '/basic/disabled', 	name: 'Disabled 禁用', component: importMd('/XM26') },
            { path: '/basic/create', 	name: 'Create 创建条目', component: importMd('/XM27') },
        ]
	}, {
		path: '/c',
		name: '进阶示例',
		redirect: '/senior/getValue',
		component: Component,
		children: [
            { path: '/senior/getValue', name: '赋值与取值', component: importMd('/ZM01') },
            { path: '/senior/form', name: '表单提交', component: importMd('/ZM02') },
            { path: '/senior/table', name: '表格中多选', component: importMd('/ZM03') },
            { path: '/senior/remoteSearch', name: '远程搜索', component: importMd('/ZM04') },
            { path: '/senior/update', name: '动态数据', component: importMd('/ZM05') },
            { path: '/senior/alert', name: '弹框中的多选', component: importMd('/ZM06') },
            { path: '/senior/get', name: '获取实例对象', component: importMd('/ZM07') },
            { path: '/senior/batch', name: '批量操作', component: importMd('/ZM08') },
        ]
	}, {
		path: '/plugin',
		name: '拓展中心',
		redirect: '/plugin/customer',
		component: Component,
		children: [
            { path: '/plugin/customer', name: '下拉自定义', component: importMd('/ZP01') },
            { path: '/plugin/tree', name: '下拉树 Tree', component: importMd('/ZP02') },
            { path: '/plugin/laydate', name: '下拉日期多选', component: importMd('/ZP03') },
            { path: '/plugin/panel', name: '下拉折叠面板', component: importMd('/ZP04') },
            { path: '/plugin/transfer', name: '下拉穿梭框', component: importMd('/ZP05') },
            { path: '/plugin/cascader', name: '级联模式 Cascader', component: importMd('/ZP06') },
        ]
	}, {
		path: '/question',
		name: '常见问题',
		component: importMd('/question'),
	}, {
		path: '/es6',
		name: 'es6语法说明',
		component: importMd('/es6'),
	}, {
        path: '/test',
        name: '测试',
        hidden: true,
        // hidden: false,
        component: importMd('/ZTEST'),
    },

];
