## es6语法说明

:::warning
文档中会存在es6语法, 这里简单说明一下, 其中`IE`不支持`es6`语法
:::

### 概览

- let const
- 模板字符串
- 对象中属性方法简写
- 箭头函数
- 解构

这里只是简单说明, 有兴趣可以看大神<a href="https://es6.ruanyifeng.com/" target="_blank">阮一峰的资料</a>


### let与const

```
//lES6 新增了let命令，用来声明变量。它的用法类似于var，但是所声明的变量，只在let命令所在的代码块内有效。

{
	let a = 10;
	var b = 1;
}

a // ReferenceError: a is not defined.
b // 1


//const声明一个只读的常量。一旦声明，常量的值就不能改变。
const PI = 3.1415;
PI // 3.1415

PI = 3;
// TypeError: Assignment to constant variable.
```


### 模板字符串

```
//模板字符串（template string）是增强版的字符串，用反引号（`）标识。它可以当作普通字符串使用，也可以用来定义多行字符串，或者在字符串中嵌入变量。

// 普通字符串
`In JavaScript '\n' is a line-feed.`

// 多行字符串
`In JavaScript this is
 not legal.`

console.log(`string text line 1
string text line 2`);

// 字符串中嵌入变量
let name = "Bob", time = "today";
`Hello ${name}, how are you ${time}?`
```


### 对象中属性方法简写

```
//常规写法
var name = 'zs';

var obj = {
	name: name,
	run: function(){
		console.log('haha');
	}
}


//简写
let name = 'zs';

let obj = {
	name,
	run(){
		console.log('haha');
	}
}
```


### 箭头函数

```
//常规写法
setTimeout(function(){
	//...
}, 1000);

//简写
setTimeout(() => {
	//...
}, 1000);
```


### 解构

```
//假如现在有一个对象
let obj = {
	name: 'zs',
	age: 18,
	address: 'beijing',
}

//正常获取name
var name = obj.name

//解构写法
let { name } = obj

//也可以多个
let { name, age, address } = obj;

//如果不存在也可以声明默认值
let { name, age, address, status = '1' } = obj;

//想添加一条属性
obj.status = '1';

//对象属性合并
var newObj = {
	...obj,
	status: '1'
}

//方法传参
function calc(data){
	var a = data.a;
	var b = data.b;
	return a + b;
}
//解构传参
function calc({ a, b }){
	return a + b;
}
```

至于更多的就自己去找学习资料吧
