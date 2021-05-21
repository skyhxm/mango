import { h, Component, render } from 'preact'
import { deepMerge, isFunction } from '@/common/util'

class Cascader extends Component{


	constructor(options){
		super(options);

		this.state = {
			expand: [],
		}
	}

	blockClick(e){
		e.stopPropagation();
	}

	optionClick(item, selected, disabled, type, index, e){
		if(type === 'line'){
			if(disabled){
				return ;
			}
			//加载中的不需要进行处理
			if(item.__node.loading === true){
				return;
			}

			const { cascader, prop, sels } = this.props;

			//不是父节点的不需要处理
			if(!cascader.lazy && !item[prop.optgroup]){
				this.props.ck(item, selected, disabled);
				return
			}

			let expand = this.state.expand.slice(0, index + 1);
			expand[index] = item[this.props.prop.value];
			this.setState({ expand });
		}else if(type === 'checkbox'){
			this.props.ck(item, selected, disabled);
		}
		//阻止父组件上的事件冒泡
		this.blockClick(e);
	}

	//组件将要接收新属性
	componentWillReceiveProps(props){

	}

	//组件将要被挂载
	componentWillMount(){

	}

	render(config, state) {

		const { prop, empty, sels, theme, radio, template, data, cascader } = config;
		let { name, value, disabled, children } = prop;
		const showIcon = config.model.icon != 'hidden';

		const renderItem = (item, indent, index, checked) => {
			//是否被选中
			let selected = !!sels.find(sel => sel[value] == item[value]);
			//是否禁用
			let dis = item[disabled]
			// 是否半选
			let half = item.__node.half === true;

			//是否遵义严格父子结构
			if(cascader.strict){
				selected = selected || half || item.__node.selected
				dis = dis || item.__node.disabled;
			}

			const iconStyle = selected ? {
				color: theme.color,
				border: 'none'
			} : {
				borderColor: theme.color,
			};

			const isParent = item[children] && item[children].length > 0;
			const itemStyle = { backgroundColor: 'transparent' }
			const className = ['xm-option', (dis ? ' disabled' : ''), (selected ? ' selected' : ''), (showIcon ? 'show-icon' : 'hide-icon') ].join(' ');
			const iconClass = (() => {
				if(isParent && config.iconfont.parent === 'hidden'){
					return 'xm-option-icon-hidden'
				}
				return ['xm-option-icon', (() => {
					//如果是半选状态，但是没有配置半选图标就用默认的
					if(half){
						return config.iconfont.half ? config.iconfont.half + ' xm-custom-icon' : 0;
					}
					if(isParent && config.iconfont.parent){
						return config.iconfont.parent + ' xm-custom-icon';
					}
					if(selected){
						return config.iconfont.select ? config.iconfont.select : 0;
					}
					return config.iconfont.unselect ? config.iconfont.unselect + ' xm-custom-icon' : 0;
				})() || ('xm-iconfont ' + (radio ? 'xm-icon-danx' : cascader.strict && half ? 'xm-icon-banxuan' : 'xm-icon-duox'))].join(' ');
			})()


			if(item[value] === this.state.val){
				itemStyle.backgroundColor = theme.hover
			}

			const contentStyle = {}, checkedStyle = {};
			if(checked){
				contentStyle.color = theme.color
				contentStyle.fontWeight = 700
				checkedStyle.color = theme.color
			}
			let checkedClass = 'xm-right-arrow';

			//处理鼠标选择的背景色
			const hoverChange = e => {
				if(e.type === 'mouseenter'){
					if(!item[disabled]){
						this.setState({ val: item[value] })
					}
				}else if(e.type === 'mouseleave'){
					this.setState({ val: '' })
				}
			}

			return (
				<div class={ className } style={ itemStyle } value={ item[value] } onClick={
					this.optionClick.bind(this, item, selected, dis, 'line', index)
				} onMouseEnter={ hoverChange } onMouseLeave={ hoverChange }>
					{ showIcon && <i class={ iconClass } style={ iconStyle } onClick={ this.optionClick.bind(this, item, selected, dis, 'checkbox', index) }></i> }
					<div class='xm-option-content' style={ contentStyle } dangerouslySetInnerHTML={{ __html: template({ data, item, arr: sels, name: item[name], value: item[value] }) }}></div>
					{ item[children] && <div class={ checkedClass } style={ checkedStyle }></div> }
				</div>
			)
		}

		let boxArr = [];
		const renderGroup = (item, indent, index) => {
			const child = item[children];
			indent = indent + cascader.indent + 6

			const checked = child && this.state.expand[index] === item[value];
			checked && boxArr.push(
				<div class="xm-cascader-box" index={ index % 4 } style={{ left: indent + 'px', width: cascader.indent + 'px'}}>
					<div class="xm-cascader-scroll">{ child.map(c => renderGroup(c, indent, index + 1)) }</div>
				</div>
			)
			return renderItem(item, indent, index, checked)
		}

		let arr = data.map(item => renderGroup(item, 2, 0)).concat(boxArr).filter(a => a);
		// let safetyArr = deepMerge([], arr);
		// let safetySels = deepMerge([], sels);

		if(!arr.length){
			arr.push(<div class="xm-select-empty">{ empty }</div>)
		}

		return (
			<div onClick={ this.blockClick } class="xm-body-cascader" style={{ width: cascader.indent + 'px', maxHeight: config.height }}>
				{ arr }
			</div>
		)
	}

	//组件完成挂载
	componentDidMount(){
		this.props.onReset('cascader', 'class');
	}

	//此时页面又被重新渲染了
	// componentDidUpdate(){}
}

export default Cascader;
