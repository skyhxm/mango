/**
 * 选中dom元素
 */
export function selector(el) {
	return el.nodeType ? el : document.querySelector(el);
}

/**
 * 警告提示
 */
export function warn() {
	let arr = [];
	for (var i = 0; i < arguments.length; i++) {
		arr.push(`${i + 1}. ${arguments[i]}`);
	}
	console.warn(arr.join('\n'));
}


/**
 * 安全拷贝数据
 */
export function safety(data) {
	return JSON.parse(JSON.stringify(data));
}

/**
 * 检测对象是否为数组
 */
export function isArray(obj) {
	return Object.prototype.toString.call(obj) == "[object Array]";
}

/**
 * 检测对象是否为函数
 */
export function isFunction(obj) {
	return Object.prototype.toString.call(obj) == "[object Function]";
}

/**
 * 转化为数字
 */
export function toNum(obj) {
	obj -= 0;
	isNaN(obj) && (obj = 0);
	return obj;
}

/**
 * 简单的深度合并
 */
export function deepMerge(obj1, obj2) {
	let key;
	for (key in obj2) {
		// 如果target(也就是obj1[key])存在，且是对象的话再去调用deepMerge，否则就是obj1[key]里面没这个对象，需要与obj2[key]合并
		// 如果obj2[key]没有值或者值不是对象，此时直接替换obj1[key]
		obj1[key] =
			obj1[key] &&
			obj1[key].toString() === "[object Object]" &&
			(obj2[key] && obj2[key].toString() === "[object Object]") ?
			deepMerge(obj1[key], obj2[key]) :
			(obj1[key] = obj2[key]);
	}
	return obj1;
}

/**
 * 数组合并
 */
export function mergeArr(arr1, arr2, prop) {
	let value = prop.value;
	let result = [...arr2];
	for (let i = 0; i <  arr1.length; i++) {
		let item = arr1[i];
		if (!arr2.find(a => a[value] == item[value])) {
			result.push(item);
		}
	}
	return result;
}



export function watch(data) {
	return new Promise((resolve, reject) => {
		for (let key in data) {
			let value = data[key];
			Object.defineProperty(data, key, {
				configurable: false, // 该状态下的属性描述符不能被修改和删除
				enumerable: false, // 该状态下的属性描述符中的属性不可被枚举
				get() {
					return value;
				},
				set(newVal) {
					if (newVal !== value) {
						resolve(key, newVal, value);
						value = newVal;
					}
				}
			});
		}
	});
}

export function checkUserAgent() {
	const ua = navigator.userAgent;
	if (ua.indexOf('Mac OS') != -1) {
		return 'mac';
	}
	return 'win';
}

export function IEVersion() {
	var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
	var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE<11浏览器
	var isEdge = userAgent.indexOf("Edge") > -1 && !isIE; //判断是否IE的Edge浏览器
	var isIE11 = userAgent.indexOf('Trident') > -1 && userAgent.indexOf("rv:11.0") > -1;
	if (isIE) {
		var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
		reIE.test(userAgent);
		var fIEVersion = parseFloat(RegExp["$1"]);
		if (fIEVersion == 7) {
			return 7;
		} else if (fIEVersion == 8) {
			return 8;
		} else if (fIEVersion == 9) {
			return 9;
		} else if (fIEVersion == 10) {
			return 10;
		} else {
			return 6; //IE版本<=7
		}
	} else if (isEdge) {
		return 'edge'; //edge
	} else if (isIE11) {
		return 11; //IE11
	} else {
		return -1; //不是ie浏览器
	}
}

export function exchangeOptionsData(arr, { prop }){
	let { disabled, children, optgroup, value } = prop;
	let newArr = [], group;
	for(let i = 0; i < arr.length; i++){
		let item = arr[i];
		newArr.push(item);
		if(item[optgroup]){
			group = item;
			item[children] = [];
			continue;
		}
		let child = item[children];
		if(isArray(child)){
			group = null;
			item[optgroup] = true;
			child.forEach(c => newArr.push(c));
			continue;
		}
		if(group){
			group[children].push(item);
		}
	}
	return newArr;
}

export function toSimple(data, sels, list, prop){
	if(!data || !isArray(data)){
		return;
	}

	let { children, selected, value } = prop;
	data.forEach(item => {
		if(item.__node[selected] || sels.find(i => i[value] === item[value])){
			list.push(item);
		}else{
			toSimple(item[children], sels, list, prop);
		}
	})
}

export function delProp(data, children, props){
	if(!data || !isArray(data)){
		return;
	}
	return data.map(item => {
		item = { ...item };
		props.forEach(prop => delete item[prop]);
		item[children] = delProp(item[children], children, props);
		return item;
	})
}
