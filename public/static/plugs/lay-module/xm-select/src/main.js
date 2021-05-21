import '@/common/expand'
import '@/style/index.less'
import '@/style/iconfont.less'
import { default as xmSelect, datas } from './index.js';

const moduleName = 'xmSelect';

/**
 * 监听全页面点击关闭事件
 */
window.addEventListener('click', () => {
	Object.keys(datas).forEach(key => {
		let item = datas[key]
		item && item.closed && item.closed()
	})
})

/**
 * 监听页面滚动事件
 */
window.addEventListener('scroll', () => {
	Object.keys(datas).forEach(key => {
		let item = datas[key]
		item && item.calcPosition && item.calcPosition()
	})
})


if ((typeof exports === 'undefined' ? 'undefined' : _typeof(exports)) === 'object') {
	module.exports = xmSelect;
} else if (typeof define === 'function' && define.amd) {
	define(xmSelect);
} else if (window.layui && layui.define) {
	layui.define(function(exports) {
		exports(moduleName, xmSelect);
	});
}

window[moduleName] = xmSelect;
