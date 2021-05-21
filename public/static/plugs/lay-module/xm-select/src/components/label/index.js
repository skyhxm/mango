import { h, Component, render } from 'preact'
import { isFunction, toSimple } from '@/common/util'

/**
 * 标签的渲染
 */
class Label extends Component{

	constructor(options){
		super(options);
	}

	iconClick(item, selected, disabled, e){
		this.props.ck(item, selected, disabled, true);
		//阻止父组件上的事件冒泡
		e.stopPropagation();
	}

	scrollFunc(e){
		if(e.wheelDeltaX == 0){
			let child = this.labelRef.getElementsByClassName('xm-label-block');
			let sum   = 10;
			for(let i = 0; i < child.length; i++){
				sum += child[i].getBoundingClientRect().width + 5;
			}
			let width = this.labelRef.getBoundingClientRect().width;
			let max   = sum > width ? sum - width : width;
			let left  = this.labelRef.scrollLeft + e.deltaY;
			left < 0   && (left = 0);
			left > max && (left = max);
			this.labelRef.scrollLeft = left;
		}
	}

	blur(){
		let input = this.base.querySelector('.label-search-input');
		input && input.blur();
	}

	componentDidMount(){
		if (this.labelRef.addEventListener) {
			this.labelRef.addEventListener('DOMMouseScroll', this.scrollFunc.bind(this), false);
		}
		if(this.labelRef.attachEvent){
			this.labelRef.attachEvent('onmousewheel', this.scrollFunc.bind(this));
		}
		this.labelRef.onmousewheel = this.scrollFunc.bind(this);
	}

	render(config) {
		const { data, prop, theme, model, sels, autoRow, tree } = config;
		const { name, disabled } = prop;

		//获取配置项
		const label = model.label;
		const type = label.type;
		const conf = label[type];

		let list = sels;
		//树结构开启极简显示
		if(tree.show && tree.strict && tree.simple){
			list = []
			toSimple(data, sels, list, prop);
		}

		//渲染结果
		let html = '', innerHTML = true;
		//悬浮显示已选择
		let title = list.map(item => item[name]).join(',')

		if(type === 'text'){
			html = list.map(sel => `${conf.left}${sel[name]}${conf.right}`).join(conf.separator)
		}else if(type === 'block'){
			innerHTML = false;
			//已选择的数据
			let arr = [...list];

			const style = { backgroundColor: theme.color }
			//显示的个数
			const count = conf.showCount <= 0 ? arr.length : conf.showCount;

			html = arr.splice(0, count).map(sel => {
				const styleProps = { width: conf.showIcon ? 'calc(100% - 20px)' : '100%', }
				const className = ['xm-label-block', sel[disabled] ? 'disabled':''].join(' ');
				return (
					<div class={className} style={ style }>
						{ conf.template && isFunction(conf.template) ? (
							<span style={ styleProps } dangerouslySetInnerHTML={{ __html: conf.template(sel, arr) }}></span>
						) : (
							<span style={ styleProps }>{ sel[name] }</span>
						) }
						{ conf.showIcon && <i class="xm-iconfont xm-icon-close" onClick={ this.iconClick.bind(this, sel, true, sel[disabled]) }></i> }
					</div>
				)
			})

			//剩余没显示的数据
			if(arr.length){
				html.push(
					<div class="xm-label-block" style={ style }>
						+ { arr.length }
					</div>
				)
			}
		}else if(type == 'search'){
			innerHTML = false;
			let one = '';
			if(list.length){
				one = list[0][name]
			}

			html = (
				<input class="label-search-input" type="text" placeholder={ config.searchTips } style={{ width: '100%', border: 'none' }} value={
					one
				} onInput={ e => {
					this.props.onReset(e, 'labelSearch')
				}}  onCompositionstart={ e => {
					this.props.onReset(e, 'labelSearch')
				}}  compositionupdate={ e => {
					this.props.onReset(e, 'labelSearch')
				}}  compositionend={ e => {
					this.props.onReset(e, 'labelSearch')
				}}  onClick={ e => {
					e.stopPropagation();
				}}></input>
			)
		}else{
			if(list.length && conf && conf.template){
				html = conf.template(data, list);
			}else{
				html = list.map(sel => sel[name]).join(',')
			}
		}

		const className = ['xm-label', autoRow ? 'auto-row' : 'single-row'].join(' ');
		return (
			<div class={ className }>
				<div class="scroll" ref={ ref => this.labelRef = ref }>
					{ innerHTML ?
						<div class="label-content" dangerouslySetInnerHTML={{ __html: html }}></div> :
						<div class="label-content" title={ title }>{ html }</div>
					}
				</div>
			</div>
		)
	}
}

export default Label;
