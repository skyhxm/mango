## 测试

:::demo 
```html
<div id="demo1" class="xm-select-demo"></div>

<script>
xmSelect.render({
	el: '#demo1', 
	model: {
		label: {
			type: 'search'
		},
	},
	radio: true,
	filterable: true,
	data: [
		{name: '张三', value: 1, selected: true},
		{name: '李四', value: 2},
		{name: '王五', value: 3},
	]
	
})

</script>
```
:::
