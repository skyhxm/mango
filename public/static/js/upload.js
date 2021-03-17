
layui.config({
base: '/static/lib/layui/extend/' //静态资源所在路径
}).extend({
	tableSelect: 'tableSelect/tableSelect' 
}).use(['upload','tableSelect'], function(){
  var $ = layui.jquery
  ,upload = layui.upload
  ,tableSelect = layui.tableSelect;
  var init = {
		table_elem: '#currentTable',
		table_render_id: 'currentTableRenderId',
		upload_url: '/admin/upload/uploadfile',
		upload_exts: 'doc|gif|ico|icon|jpg|mp3|mp4|p12|pem|png|rar',
		image_pre:"/storage/"
	};
	
	var imageTemplate = function (data,option) {
				console.log(data);
				var option = {};
                option.imageWidth =  200;
                option.imageHeight = 40;
                option.imageSplit =  '|';
                option.imageJoin =  '<br>';
                option.title = "图片信息";
                var field = "url",
                    title = option.title;
                try {
                    var value = eval("data." + field);
                } catch (e) {
                    var value = undefined;
                }
                if (value === undefined) {
                    return '<img style="max-width: ' + option.imageWidth + 'px; max-height: ' + option.imageHeight + 'px;" src="' + value + '" data-image="' + title + '">';
                } else {
                    var values = value.split(option.imageSplit),
                        valuesHtml = [];
                    values.forEach((value, index) => {
						value = "/"+value;
                        valuesHtml.push('<img style="max-width: ' + option.imageWidth + 'px; max-height: ' + option.imageHeight + 'px;" src="' + value + '" data-image="' + title + '">');
                    });
                    return valuesHtml.join(option.imageJoin);
                }
            };
	
  var uploadList = document.querySelectorAll("[data-upload]");
  var uploadSelectList = document.querySelectorAll("[data-upload-select]");

  if (uploadList.length > 0) {
	  $.each(uploadList, function (i, v) {
		  var exts = $(this).attr('data-upload-exts'),
			  uploadName = $(this).attr('data-upload'),
			  uploadNumber = $(this).attr('data-upload-number'),
			  uploadSign = $(this).attr('data-upload-sign');
		  exts = exts || init.upload_exts;
		  uploadNumber = uploadNumber || 'one';
		  uploadSign = uploadSign || '|';
		  var elem = "input[name='" + uploadName + "']",
			  uploadElem = this;

		  // 监听上传事件
		  upload.render({
			  elem: this,
			  url: init.upload_url,
			  accept: 'file',
			  exts: exts,
			  // 让多图上传模式下支持多选操作
			  multiple: (uploadNumber !== 'one') ? true : false,
			  done: function (res) {
				  if (res.code === 1) {
					  var url = res.data.url;
					  if (uploadNumber !== 'one') {
						  var oldUrl = $(elem).val();
						  if (oldUrl !== '') {
							  url = oldUrl + uploadSign + url;
						  }
					  }
					  $(elem).val(url);
					  $(elem).trigger("input");
					  layer.msg(res.msg);
				  } else {
					  layer.msg(res.msg);
				  }
				  return false;
			  }
		  });

		  // 监听上传input值变化
		  $(elem).bind("input propertychange", function (event) {
			  var urlString = $(this).val(),
				  urlArray = urlString.split(uploadSign),
				  uploadIcon = $(uploadElem).attr('data-upload-icon');
			  uploadIcon = uploadIcon || "file";

			  $('#bing-' + uploadName).remove();
			  if (urlString.length > 0) {
				  var parant = $(this).parent('div');
				  var liHtml = '';
				  $.each(urlArray, function (i, v) {
					  var originurl = v;
					  if(!(v.indexOf("/storage/") != -1) ){
						v = init.image_pre+v;
					  }
					  liHtml += '<li><a><img src="' + v + '" data-image  onerror="this.src=\'/static/images/upload-icons/' + uploadIcon + '.png\';this.onerror=null"></a><small class="uploads-delete-tip bg-red badge" data-upload-delete="' + uploadName + '" data-upload-url="' + originurl + '" data-upload-sign="' + uploadSign + '">×</small></li>\n';
				  });
				  parant.after('<ul id="bing-' + uploadName + '" class="layui-input-block layui-upload-show">\n' + liHtml + '</ul>');
			  }

		  });

		  // 非空初始化图片显示
		  if ($(elem).val() !== '') {
			  $(elem).trigger("input");
		  }
	  });

	  // 监听上传文件的删除事件
	  $('body').on('click', '[data-upload-delete]', function () {
		  var uploadName = $(this).attr('data-upload-delete'),
			  deleteUrl = $(this).attr('data-upload-url'),
			  sign = $(this).attr('data-upload-sign');
		  var confirm = layer.confirm("确认删除", {title: '操作确认', btn: ['确认', '取消']}, function () {
			  var elem = "input[name='" + uploadName + "']";
			  var currentUrl = $(elem).val();
			  //console.log(currentUrl);
			   //console.log(deleteUrl);
			  var url = '';
			  if (currentUrl !== deleteUrl) {
				  url = currentUrl.replace(deleteUrl, '');
				  url = url.replace(sign+sign, '');
				  var reg =new RegExp("(^\\"+sign+"{1})|"+"(\\"+sign+"{1}$)","g");
				  url = url.replace(reg,''); 
				  $(elem).val(url);
				  $(elem).trigger("input");
			  } else {
				  $(elem).val(url);
				  $('#bing-' + uploadName).remove();
			  }
			  layer.close(confirm);
		  });
		  return false;
	  });
  }

  if (uploadSelectList.length > 0) {
	  $.each(uploadSelectList, function (i, v) {
		  var exts = $(this).attr('data-upload-exts'),
			  uploadName = $(this).attr('data-upload-select'),
			  uploadNumber = $(this).attr('data-upload-number'),
			  uploadSign = $(this).attr('data-upload-sign');
		  exts = exts || init.upload_exts;
		  uploadNumber = uploadNumber || 'one';
		  uploadSign = uploadSign || '|';
		  var selectCheck = uploadNumber === 'one' ? 'radio' : 'checkbox';
		  var elem = "input[name='" + uploadName + "']",
			  uploadElem = $(this).attr('id');

		  tableSelect.render({
			  elem: "#" + uploadElem,
			  checkedKey: 'id',
			  //searchType: 'more',
			  /*searchList: [
				  {searchKey: 'title', searchPlaceholder: '请输入文件名'},
			  ],*/
			  table: {
				  url: "/admin/upload/getUploadFiles",
				  cols: [[
					  {type: selectCheck},
					  {field: 'id', title: 'ID'},
					  {field: 'url', minWidth: 80, search: false, title: '图片信息', imageHeight: 40, align: "center", templet: imageTemplate},
					  //{field: 'original_name', width: 150, title: '文件原名', align: "center"},
					  {field: 'mimetype', width: 120, title: 'mime类型', align: "center"},
					  {field: 'createtime', width: 200, title: '创建时间', align: "center", search: 'range'},
				  ]]
			  },
			  done: function (e, data) {
				  var urlArray = [];
				  $.each(data.data, function (index, val) {
					  var urlstr = val.url;
					  urlstr = urlstr.replace(/^storage\//,'');
					  urlArray.push(urlstr);
				  });
				  var url = urlArray.join(uploadSign);
				
				  layer.msg('选择成功', {icon: 1, shade: [0.02, '#000'], scrollbar: false, time: 2000, shadeClose: true}, function () {
					  $(elem).val(url);
					  $(elem).trigger("input");
				  });
			  }
		  })

	  });

  }

  
});
