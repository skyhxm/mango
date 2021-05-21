import { h, Component, render } from 'preact'

/**
 * 默认提示
 */
class Custom extends Component{

	constructor(options){
		super(options);
	}

	blockClick(e){
		e.stopPropagation();
	}

	shouldComponentUpdate(){
		return !this.prepare;
	}

	render(config) {
		this.prepare = true;
		return (
			<div onClick={ this.blockClick } class="xm-body-custom" >
				<div class="scroll-body" style={ {maxHeight: config.height} }>
					<div style="margin: 5px 0" dangerouslySetInnerHTML={{ __html: config.content }}></div>
				</div>
			</div>
		)
	}
}

export default Custom;
