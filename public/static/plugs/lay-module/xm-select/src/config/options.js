import zn from './language/zn'
import en from './language/en'

const lanSetting = { zn, en }

export default function (lan = 'zn') {
	let setting = lanSetting[lan] || zn;

	return {
		//配置语言
		language: lan,
		//所有的语言配置
		languageProp: setting,
		//多选数据
		data: [],
		//自定义数据
		content: '',
		//表单提交的name
		name: 'select',
		//表单验证
		layVerify: '',
		//验证类型
		layVerType: '',
		//验证提示
		layReqText: '',
		//尺寸
		size: 'medium',
		//是否禁用多选
		disabled: false,
		//默认选中数据, 优先级大于selected
		initValue: null,
		//创建条目
		create: null,
		//默认提示
		tips: setting.tips,
		//空数据提示
		empty: setting.empty,
		//搜索延迟 ms
		delay: 500,
		//搜索默认提示
		searchTips: setting.searchTips,
		//是否开始本地搜索
		filterable: false,
		//本地搜索过滤方法
		filterMethod: function(val, item, index, prop){
			if(!val) return true;
			return item[prop.name].indexOf(val) != -1;
		},
		//是否开启远程搜索
		remoteSearch: false,
		//远程搜索回调
		remoteMethod: function(val, cb){
			cb([]);
		},
		//下拉方向
		direction: 'auto',
		//自定义样式
		style: {},
		//默认多选的高度
		height: '200px',
		//已选中数据是否自动换行显示
		autoRow: false,
		//是否开启分页
		paging: false,
		//分页每页的条数
		pageSize: 10,
		//分页无数据是否展示分页
		pageEmptyShow: true,
		//是否开启远程分页
		pageRemote: false,
		//是否开启单选模式
		radio: false,
		//是否开启重复选模式
		repeat: false,
		//是否点击选项后自动关闭下拉框
		clickClose: false,
		//多选上限
		max: 0,
		maxMethod: function(sels, item){},
		//选项显示数量
		showCount: 0,
		//是否开启键盘操作
		enableKeyboard: true,
		//工具条
		toolbar: {
			show: false,
			showIcon: true,
			list: [ 'ALL', 'CLEAR' ],
		},
		//树状结构
		tree: {
			//是否展示树
			show: false,
			//是否展示三角图标
			showFolderIcon: true,
			//是否展示连接线
			showLine: true,
			//间距
			indent: 20,
			//默认展开的节点数组
			expandedKeys: [],
			//是否严格遵守父子模式
			strict: true,
			//是否懒加载
			lazy: false,
			//懒加载回调
			load: null,
			//是否开启极简模式
			simple: false,
			//标注节点类型的key
			nodeType: '__node_type',
			//点击节点是否展开
			clickExpand: true,
			//点击节点是否选中
			clickCheck: true,
		},
		//级联结构
		cascader: {
			//是否展示级联
			show: false,
			//间距
			indent: 100,
			//是否严格遵守父子模式
			strict: true,
		},
		//自定义属性名称
		prop: {
			name: 'name',
			value: 'value',
			selected: 'selected',
			disabled: 'disabled',
			children: 'children',
			optgroup: 'optgroup',
			click: 'click',
		},
		//主题配置
		theme: {
			color: '#009688',		//默认主题颜色
			maxColor: '#e54d42',	//多选上限边框闪烁颜色
			hover: '#f2f2f2',		//键盘hover的颜色
		},
		//模型
		model: {
			label: {
				type: 'block',
				text: {
					left: '',
					right: '',
					separator: ', ',
				},
				block: {
					showCount: 0,
					showIcon: true,
					template: null,
				},
				count: {
					template(data, sels){
						return `已选中 ${sels.length} 项, 共 ${data.length} 项`
					}
				},
			},
			icon: 'show',
			type: 'absolute',//可选值， relative， fixed
		},
		//自定义选中的图标
		iconfont: {
			select: '',
			unselect: '',
			half: '',
			parent: '',
		},
		// 展开下拉框
		show(){

		},
		// 隐藏下拉框
		hide(){

		},
		// 模板组成, 当前option数据, 已经选中的数据, name, value
		template({ item, sels, name, value }){
			return name;
		},
		//监听选中事件
		on({ arr, item, selected }){

		}
	}
}
