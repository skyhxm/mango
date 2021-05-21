import { h, Component, render } from 'preact'
import { datas, optionData, childData } from '@/index.js';
import { warn, listenerClose, isArray, deepMerge, exchangeOptionsData, toSimple, delProp } from '@/common/util'
import Framework from '@/components/framework'
import defaultOptions from '@/config/options'

class xmOptions {

	constructor(options) {
		this.init(options);
	}

	init(options){
		//定义默认值
		this.options = defaultOptions(options.language);
		//开始渲染数据
		this.update(options);
	}

	/**
	 * 更新数据 + 重新渲染
	 */
	update(options = {}){

		let updateData = !!options.data;

		//记录最新的配置项
		this.options = deepMerge(this.options, options);
		this.options.__render_success = false;

		//如果dom不存在, 则不进行渲染事项
		let { dom } = this.options;
		if(!dom){
			warn(`没有找到渲染对象: ${options.el}, 请检查`)
			return ;
		}
		//判断data的数据类型
		let optionsData = this.options.data || [];
		if(typeof(optionsData) === 'function'){
			optionsData = optionsData();
			this.options.data = optionsData;
		}
		if(!isArray(optionsData)){
			warn(`data数据必须为数组类型, 不能是${ typeof(data) }类型`)
			return ;
		}

		render(<Framework { ...this.options } __update={ Date.now() } updateData={ updateData } />, dom);
		
		this.options.__render_success = true;
		
		//返回多选对象
		return this;
	}

	/**
	 * 重置多选, 回到初始化的状态
	 */
	reset(){
		const { el } = this.options
		//重新渲染
		this.init(optionData[el]);
		//子组件初始化
		childData[el].init(this.options, true);
		return this;
	}

	/**
	 * 主动打开多选
	 */
	opened(){
		let ref = childData[this.options.el];
		!ref.state.show && ref.onClick();
		return this;
	}

	/**
	 * 主动关闭多选
	 */
	closed(){
		let ref = childData[this.options.el];
		ref.state.show && ref.onClick();
		return this;
	}

	/**
	 * 获取多选选中的数据
	 */
	getValue(type){
		const { tree, prop, data } = this.options;
		let sels = childData[this.options.el].state.sels;
		let list = sels;

		//树结构开启极简显示
		if(tree.show && tree.strict && tree.simple){
			list = []
			toSimple(data, sels, list, prop);
		}

		let arr = delProp(list, prop.children, [ '__node' ]);;

		if(type === 'name'){
			return arr.map(item => item[this.options.prop.name]);
		}else
		if(type === 'nameStr'){
			return arr.map(item => item[this.options.prop.name]).join(',');
		}else
		if(type === 'value'){
			return arr.map(item => item[this.options.prop.value]);
		}else
		if(type === 'valueStr'){
			return arr.map(item => item[this.options.prop.value]).join(',');
		}

		return arr;
	}

	/**
	 * 设置多选数据
	 */
	setValue(sels, show, listenOn = false){
		if(!isArray(sels)){
			warn('请传入数组结构...')
			return ;
		}
		childData[this.options.el].value(this.options.radio ? sels.slice(0, 1) : sels, show, listenOn);
		return this;
	}

	/**
	 * 追加赋值
	 */
	append(sels){
		if(!isArray(sels)){
			warn('请传入数组结构...')
			return ;
		}
		childData[this.options.el].append(sels);
		return this;
	}

	/**
	 * 删除赋值
	 */
	delete(sels){
		if(!isArray(sels)){
			warn('请传入数组结构...')
			return ;
		}
		childData[this.options.el].del(sels);
		return this;
	}

	/**
	 * 闪烁警告边框
	 */
	warning(color, sustain = false){
		let showColor = color || this.options.theme.maxColor;

		sustain === true ? (
			childData[this.options.el].base.style.borderColor = showColor
		) : (
			childData[this.options.el].updateBorderColor(showColor)
		)
		return this;
	}

	/**
	 * 获取选中的节点
	 * leafOnly: 是否只是叶子节点，默认值为 false
	 * includeHalfChecked: 是否包含半选节点，默认值为 false
	 */
	getTreeValue(leafOnly, includeHalfChecked){
		const { tree, cascader, prop } = this.options;
		const { value } = prop;

		//如果不是树状结构, 直接使用getValue
		if(!(tree.show || cascader.show)){
			return this.getValue(leafOnly);
		}

		//获得当前已经选中的数据
		let sels = childData[this.options.el].state.sels;

		//存储选中的数据
		let list = [];

		let nodeType = tree.nodeType;

		const listPush = (item, type) => {
			if(!list.find(i => i[value] === item[value])){
				item = { ...item }
				item[nodeType] = type;
				list.push(item);
			}
		}

		for(let i = 0; i < sels.length; i++){
			let node = { ...sels[i] };
			//首页先把子节点放入到数据中
			listPush(node, 'leaf');
			while(node = node.__node.parent){
				let { half, selected } = node.__node
				//如果想要父节点, 检测父节点是否为选中状态
				if(!leafOnly && selected){
					listPush(node, 'parent');
				}else
				//如果是需要半选状态, 并且处于半选状态
				if(includeHalfChecked && half && !selected){
					listPush(node, 'half');
				}
			}
		}

		let arr = delProp(list, prop.children, [ '__node' ]);;

		return arr;
	}

	/**
	 * 动态操作树状结构的节点展开状态
	 */
	changeExpandedKeys(keys){
		childData[this.options.el].changeExpandedKeys(keys)
		return this;
	}

	/**
	 * 动态启用一些选项
	 */
	enable(sels){
		if(!isArray(sels)){
			warn('请传入数组结构...')
			return ;
		}
		if(sels.length === 0){
			return ;
		}
		childData[this.options.el].upDate(sels, true)
		return this;
	}

	/**
	 * 动态禁用一些选项
	 */
	disable(sels){
		if(!isArray(sels)){
			warn('请传入数组结构...')
			return ;
		}
		if(sels.length === 0){
			return ;
		}
		childData[this.options.el].upDate(sels, false)
		return this;
	}

	/**
	 * 滚动到某个选项
	 */
	scroll(val){
		let opt = this.options.dom.querySelector(`.xm-option[value="${ val }"]`);
		opt && opt.scrollIntoView(false)
		return this;
	}
	
	/**
	 * 重新计算下拉的位置
	 */
	calcPosition(){
		childData[this.options.el].calcPosition()
		return this;
	}

}

export default xmOptions;
