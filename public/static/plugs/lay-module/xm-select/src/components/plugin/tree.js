import { h, Component, render } from 'preact'
import { deepMerge, isFunction, mergeArr } from '@/common/util'

const emptyVal = {};

class Tree extends Component{

	constructor(options){
		super(options);

		this.state = {
			expandedKeys: [],
			filterValue: '',
			remote: true,
			loading: false,
			val: emptyVal,
		}

		this.searchCid = 0;
		this.inputOver = true;
		this.__value = '';
		this.tempData = [];
	}

	init(props){
		const { tree, dataObj, flatData, prop } = props;
		const { value, optgroup } = prop

		let keys = [];
		if(tree.expandedKeys === true){
			keys = flatData.filter(item => item[optgroup] === true).map(item => item[value])
		}else if(tree.expandedKeys === false){

		}else{
			tree.expandedKeys.forEach(key => {
				keys.push(key);

				let item = dataObj[key];
				while(item){
					let pkey = item[value];
					keys.findIndex(k => k === pkey) === -1 && (keys.push(pkey))
					item = item.__node.parent
				}
			});
		}
		this.setState({ expandedKeys: keys })
	}

	blockClick(e){
		e.stopPropagation();
	}

	optionClick(item, selected, disabled, type, e){
		if(type === 'line'){
			//加载中的不需要进行处理
			if(item.__node.loading === true){
				return;
			}

			const { tree, prop, sels } = this.props;
			const { clickExpand, clickCheck } = tree;
			
			//检测点击的是不是三角箭头
			let isExpand = e.target && isFunction(e.target.getAttribute) && e.target.getAttribute('type') === 'expand'
			//如果点击即展开
			if(clickExpand || isExpand){
				//不是父节点的不需要处理
				if(!tree.lazy && !item[prop.optgroup]){
					this.props.ck(item, selected, disabled);
					return
				}

				let val = item[this.props.prop.value];
				let expandedKeys = this.state.expandedKeys;
				let index = expandedKeys.findIndex(v => v === val);
				index === -1 ? expandedKeys.push(val) : expandedKeys.splice(index, 1);
				this.setState({ expandedKeys });

				//是否需要懒加载
				let child = item[prop.children];
				if(tree.lazy && child && child.length === 0 && item.__node.loading !== false){
					item.__node.loading = true;
					tree.load(item, (result) => {
						item.__node.loading = false;
						item[prop.children] = this.handlerData(result, prop.children);
						item[prop.selected] = sels.findIndex(i => i[prop.value] === item[prop.value]) != -1
						this.props.onReset(sels, 'treeData');
					});
				}
			}else{
				if(clickCheck){
					type = 'checkbox'
				}
			}
		}

		if(type === 'checkbox'){
			this.props.ck(item, selected, disabled);
		}
		//阻止父组件上的事件冒泡
		this.blockClick(e);
	}

	handlerData(data, children){
		return data.map(item => {
			item.__node = {};
			if(item[children]){
				item[children] = this.handlerData(item[children], children);
			}
			return item;
		})
	}

	searchInput(e){
		let v = e.target.value;

		if(v === this.__value){
			return ;
		}

		clearTimeout(this.searchCid);
		if(this.inputOver){
			//保证输入框内的值是实时的
			this.__value = v;

			//让搜索变成异步的
			this.searchCid = setTimeout(() => {
				this.callback = true;
				this.setState({ filterValue: this.__value, remote: true })
			}, this.props.delay);
		}
	}

	focus(){
		this.searchInputRef && this.searchInputRef.focus();
	}

	blur(){
		this.searchInputRef && this.searchInputRef.blur();
	}

	handleComposition(e){
		let type = e.type;

		if(type === 'compositionstart'){
			this.inputOver = false;
			clearTimeout(this.searchCid);
		}else if(type === 'compositionend'){
			this.inputOver = true;
			this.searchInput(e);
		}
	}

	filterData(data, val, parentHidden){
		const { prop, filterMethod, tree } = this.props;
		const { children, optgroup, name, value } = prop;

		data.forEach((item, index) => {
			//首先判断父节点的状态是显示还是隐藏
			let hiddenStatus = val ? !filterMethod(val, item, index, prop) : false;
			//严格模式下, 不计算父节点的状态
			let thisParentHidden;
			if(tree.strict){
				thisParentHidden = false;
			}else{//非严格模式下, 父节点显示, 子节点无条件显示
				thisParentHidden = parentHidden === false ? false : hiddenStatus;
				hiddenStatus = thisParentHidden
			}
			//如果包含了子节点
			if(item[optgroup]){
				//过滤出来子节点的数据
				let child = this.filterData(item[children], val, thisParentHidden);
				let childHiddenStatus = val ? child.filter(c => !c.__node.hidn).length === 0 : false;

				//严格模式下子节点都隐藏了, 父节点也不显示
				if(tree.strict){
					hiddenStatus = childHiddenStatus;
				}else{//非严格模式, 父节点没有搜索到, 看看子节点有没有显示的
					hiddenStatus = thisParentHidden && childHiddenStatus;
				}

				if(!hiddenStatus){//如果是显示状态
					let keys = this.state.expandedKeys;
					if(val && keys.findIndex(key => key === item[value]) === -1){
						keys.push(item[value]);
						this.setState({ expandedKeys: keys })
					}
				}
			}
			item.__node.hidn = hiddenStatus;
		});

		return data;
	}

	postData(){
		if(this.state.remote){
			this.callback = false;
			this.setState({ loading: true, remote: false });
			//让输入框失去焦点
			this.blur();
			this.props.remoteMethod(this.state.filterValue, (result, totalSize) => {
				//回调后可以重新聚焦
				this.focus();
				this.callback = true;
				this.setState({ loading: false, totalSize });
				this.props.onReset(result, 'data');
			}, this.props.show, 1);
		}
	}

	//组件将要接收新属性
	componentWillReceiveProps(props){
		if(this.props.show != props.show){
			if(!props.show){
				//清空输入框的值
				this.setState({ filterValue: '', val: emptyVal });
				this.__value = '';
				this.searchInputRef && (this.searchInputRef.value = '');
			}else{
				//聚焦输入框
				setTimeout(() => this.focus(), 0);
			}
		}
	}

	//组件将要被挂载
	componentWillMount(){
		this.init(this.props);
	}

	render(config, { expandedKeys }) {
		let { prop, empty, sels, theme, radio, template, data, tree, filterable, remoteSearch, searchTips, iconfont, enableKeyboard } = config;
		let { name, value, disabled, children, optgroup } = prop;

		let showIcon = config.model.icon != 'hidden';
		const renderItem = (item, indent, expand) => {
			//是否被选中
			let selected = !!sels.find(sel => sel[value] == item[value]);
			//是否禁用
			let dis = item[disabled]
			// 是否半选
			let half = item.__node.half === true;

			//tree是否遵义严格父子结构
			if(tree.strict){
				selected = selected || half || item.__node.selected
				dis = dis || item.__node.disabled;
			}

			const iconStyle = selected ? {
				color: theme.color,
				border: 'none'
			} : {
				borderColor: theme.color,
			};

			const itemStyle = { paddingLeft: indent + 'px' }

			//处理键盘的选择背景色
			if(enableKeyboard && item[value] === this.state.val){
				itemStyle.backgroundColor = theme.hover
			}

			//隐藏图标的处理
			if(!showIcon && selected){
				itemStyle.backgroundColor = theme.color;
				dis && (itemStyle.backgroundColor = '#C2C2C2');
			}
			const className = ['xm-option', (dis ? ' disabled' : ''), (selected ? ' selected' : ''), (showIcon ? 'show-icon' : 'hide-icon') ].join(' ');
			const iconClass = (() => {
				if(expand !== 0 && iconfont.parent === 'hidden'){
					return 'xm-option-icon-hidden'
				}
				return ['xm-option-icon', (() => {
					//如果是半选状态，但是没有配置半选图标就用默认的
					if(half){
						return iconfont.half ? iconfont.half + ' xm-custom-icon' : 0;
					}
					if(expand !== 0 && iconfont.parent){
						return iconfont.parent + ' xm-custom-icon';
					}
					if(selected){
						return iconfont.select ? iconfont.select : 0;
					}
					return iconfont.unselect ? iconfont.unselect + ' xm-custom-icon' : 0;
				})() || ('xm-iconfont ' + (radio ? 'xm-icon-danx' : tree.strict && half ? 'xm-icon-banxuan' : 'xm-icon-duox'))].join(' ');
			})()

			const treeIconClass = ['xm-tree-icon', expand ? 'expand':'', item[children] && (item[children].length > 0 || (tree.lazy && item.__node.loading !== false)) ? 'xm-visible':'xm-hidden'].join(' ');

			const iconArray = [];
			if(tree.showFolderIcon){
				iconArray.push(<i class={ treeIconClass } type="expand"></i>);
				if(tree.showLine){
					if(expand){
						iconArray.push(<i class='left-line' style={ {left: indent - tree.indent + 3 + 'px'} }></i>)
					}
					iconArray.push(<i class='top-line' style={ { left: indent - tree.indent + 3 + 'px', width: tree.indent + (expand === 0 ? 10 : -2) + 'px' } }></i>);
				}
			}


			//处理鼠标选择的背景色
			const hoverChange = e => {
				if(e.type === 'mouseenter'){
					if(!item[disabled]){
						if(enableKeyboard){
							this.setState({ val: item[value] })
						}else{
							e.target.style.backgroundColor = theme.hover;
						}
					}
				}else if(e.type === 'mouseleave'){
					if(!item[disabled]){
						if(enableKeyboard){

						}else{
							e.target.style.backgroundColor = '';
						}
					}
				}
			}

			return (
				<div class={ className } style={ itemStyle } value={ item[value] } onClick={
					this.optionClick.bind(this, item, selected, item[disabled], 'line')
				} onMouseEnter={ hoverChange } onMouseLeave={ hoverChange }>
					{ iconArray }
					{ item.__node.loading && <span class="loader"></span> }
					{ showIcon && <i class={ iconClass } style={ iconStyle } onClick={ this.optionClick.bind(this, item, selected, item[disabled], 'checkbox') }></i> }
					<div class='xm-option-content' dangerouslySetInnerHTML={{ __html: template({ data, item, arr: sels, name: item[name], value: item[value] }) }}></div>
				</div>
			)
		}

		const renderGroup = (item, indent) => {
			if(item.__node.hidn){
				return;
			}

			const child = item[children];
			indent = indent + tree.indent
			if(child){//分组模式
				let expand = this.state.expandedKeys.findIndex(k => item[value] === k) !== -1;
				child.length === 0 && (expand = false)
				return (
					<div class="xm-tree">
						{ tree.showFolderIcon && tree.showLine && expand && child.length > 0 && <i class='left-line left-line-group' style={ {left: indent + 3 + 'px'} }></i> }
						{ renderItem(item, indent, child.length === 0 && (!tree.lazy || tree.lazy && item.__node.loading === false) ? 0 : expand) }
						{ expand && <div class="xm-tree-box">{ child.map(c => renderGroup(c, indent)) }</div> }
					</div>
				)
			}
			return renderItem(item, indent, 0);
		}

		//这里处理过滤数据
		if(filterable){
			//检查是否需要远程搜索
			if(remoteSearch){
				this.postData();
			}else{
				this.filterData(data, this.state.filterValue);
			}
		}

		let safetyArr = deepMerge([], data);
		let safetySels = deepMerge([], sels);
		this.tempData = safetyArr;

		let arr = data.map(item => renderGroup(item, 10 - tree.indent)).filter(a => a);

		//工具条操作
		function flat(list, array){
			array.forEach(item => {
				if(item[optgroup]){
					//非严格模式, 如果隐藏父节点, 证明不可选
					if(!tree.strict && iconfont.parent !== 'hidden'){
						list.push(item)
					}
					flat(list, item[children])
				}else{
					list.push(item)
				}
			})
		}
		const toolbar = (
			<div class='xm-toolbar'>
				{ config.toolbar.list.map(tool => {
					const toolClass = 'toolbar-tag';

					let info, name = config.languageProp.toolbar[tool];
					if(tool === 'ALL'){
						info = { icon: 'xm-iconfont xm-icon-quanxuan', name, method: (pageData) => {
							let list = [];
							flat(list, pageData);
							//过滤掉禁用状态的不操作, 隐藏状态的不操作
							list = list.filter(item => !item[disabled] && !item.__node.hidn)
							this.props.onReset(radio ? list.slice(0, 1) : mergeArr(list, sels, prop), 'treeData');
						} };
					}else if(tool === 'CLEAR'){
						info = { icon: 'xm-iconfont xm-icon-qingkong', name, method: (pageData) => {
							this.props.onReset(sels.filter(item => item[prop.disabled]), 'treeData');
						} };
					}else if(tool === 'REVERSE'){
						info = { icon: 'xm-iconfont xm-icon-fanxuan', name, method: (pageData) => {
							let list = [];
							flat(list, pageData);
							list = list.filter(item => !item[disabled] && !item.__node.hidn)
							let selectedList = [];
							sels.forEach(item => {
								let index = list.findIndex(pageItem => pageItem[value] === item[value]);
								if(index == -1){
									selectedList.push(item);
								}else{
									list.splice(index, 1);
								}
							})
							this.props.onReset(radio ? selectedList.slice(0, 1) : mergeArr(list, selectedList, prop), 'treeData');
						} };
					}else {
						info = tool
					}

					const hoverChange = e => {
						if(e.type === 'mouseenter') e.target.style.color = theme.color;
						if(e.type === 'mouseleave') e.target.style.color = '';
					}

					return (<div class={ toolClass } onClick={ () => {
						isFunction(info.method) && info.method(safetyArr, safetySels)
					} } onMouseEnter={ hoverChange } onMouseLeave={ hoverChange }>
						{ config.toolbar.showIcon && <i class={ info.icon }></i> }
						<span>{ info.name }</span>
					</div>)
				}).filter(a => a) }
			</div>
		)

		const search = (
			<div class={ filterable ? 'xm-search' : 'xm-search dis' }>
				<i class="xm-iconfont xm-icon-sousuo"></i>
				<input class="xm-input xm-search-input" placeholder={ searchTips } />
			</div>
		);

		if(!arr.length){
			//查看无数据情况下是否显示分页
			arr.push(<div class="xm-select-empty">{ empty }</div>)
		}

		return (
			<div onClick={ this.blockClick } class="xm-body-tree" >
				{ config.toolbar.show && toolbar }
				{ search }
				<div class="scroll-body" style={ {maxHeight: config.height} }>{ arr }</div>
				{ this.state.loading && <div class="loading" >
					<span class="loader"></span>
				</div> }
			</div>
		)
	}

	//组件完成挂载
	componentDidMount(){
		let input = this.base.querySelector('.xm-search-input');
		if(input){
			input.addEventListener('compositionstart', this.handleComposition.bind(this));
			input.addEventListener('compositionupdate', this.handleComposition.bind(this));
			input.addEventListener('compositionend', this.handleComposition.bind(this));
			input.addEventListener('input', this.searchInput.bind(this));
			this.searchInputRef = input;
		}
	}

	//此时页面又被重新渲染了
	componentDidUpdate(){
		if(this.callback){
			this.callback = false;

			let done = this.props.filterDone;
			if(isFunction(done)){
				done(this.state.filterValue, this.tempData || []);
			}
		}
	}

}

export default Tree;
