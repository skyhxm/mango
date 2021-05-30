define(["jquery", "easy-admin","okLayer"], function($, ea,okLayer) {
    var form = layui.form
    var i = 0;

    function setFields(el, table_name) {
        // console.log(el,table_name)
        if (table_name) {
            $.get('getFields', {
                    'table_name': table_name
                },
                function(data) {
                    var main_key = $(el).parent().prev().hasClass('main-key')
                    if (main_key) {
                        $(el).parent().prev().find('option').remove();
                        for (var i in data) {
                            $(el).parent().prev().find('select').append('<option value="' + data[i]['name'] + '">' + data[i]['name'] + '</option>');
                        }
                    }
                    var other_key = $(el).parent().prev().prev().hasClass('other-key')
                    if (other_key) {
                        $(el).parent().prev().prev().find('option').remove();
                        for (var i in data) {
                            $(el).parent().prev().prev().find('select').append('<option value="' + data[i]['name'] + '">' + data[i]['name'] + '</option>');
                        }
                    }
                    console.log(main_key, other_key)
                    //渲染多选
                    var demo2 = xmSelect.render({
                        el: el,
                        data: data,
                        on: function(data) {
                            //arr:  当前多选已选中的数据
                            var arr = data.arr;
                            let r = arr.map(item => {
                                return item.name;
                            }).join(',').split(',');
                            $(el).prev().val(r)
                        },
                    })

                    form.render()
                }
            );
        }
    }
    //初始化主表
    var main_table = $('.main-table').val()
    setFields('.field-data', main_table)
    // 点击追加关联模型
    $('#add-content').click(function() {
        i++
        // 添加类名
        $('#tpl').find('.field-data').addClass('field-data' + i)
        $('#tpl').find('.other-table').addClass('other-table' + i)
        //修改name
        $('#tpl').find('.other-table').prop('name','otable'+i)
        $('#tpl').find('.other-type').prop('name','otype'+i)
        $('#tpl').find('.other-key select').prop('name','okey'+i)
        $('#tpl').find('.main-key select').prop('name','mkey'+i)
        $('#tpl').find('.fields-div input').prop('name','ofields'+i)
        $('input[name="numbers"]').val(i)
        $('#add-temptl').append(
            $('#tpl').html()
        )
        var table_name = $('.other-table' + i).val()
        setFields('.field-data' + i, table_name)

    })
    form.on('select(main-table)', function(data) {
        var classes = data.elem.getAttribute("class")
        if (classes) {
            var arr = classes.split(/[ ]+/); //以空格分开
            var lenth = (arr.length)
            var table_class = '.' + arr[lenth - 1];
        }
        // console.log(table_class)
        var class_fields = $(table_class).parent().parent().find('.fields-div').find('.demo').attr('class')
        if (class_fields) {
            var arr = class_fields.split(/[ ]+/); //以空格分开
            var lenth = (arr.length)
            var table_class = '.' + arr[lenth - 1];
        }
        setFields(table_class, data.value)
    })
    // 点击移除
    $(document).on('click', '.del-btn', function() {
        //去除数量
        var n = $('input[name="numbers"]').val()
        $('input[name="numbers"]').val(n-1)
        $(this).parent().parent().parent().remove()
    })
    // 显示关联按钮
    form.on('checkbox(showmodel)', function(data) {
        if (data.elem.checked) { //判断当前多选框是选中还是取消选中
            $('#table-set').show()
        } else {
            $('#table-set').hide()
        }
    });
    // 生成命令行
    $('#create_cmd').click(function(){
        $('input[name="cmd"]').val(1)
        $.get('add', 
               $("#curd_form").serializeArray()
            ,
            function(data) {
                $('input[name="create_cmd"]').val(data)
            }
        );
    })
    // 立即执行
    $('#create').click(function(){
        layer.confirm('确定执行吗？？', {
          btn: ['确定', '取消'] //可以无限个按钮
        }, function(index, layero){
            $('input[name="cmd"]').val(0)
            $.get('add', 
                   $("#curd_form").serializeArray()
                ,
                function(data) {
                    data.data = data.data+'&#10;'
                    data.data += $('#res_msg').html()
                    $('#res_msg').html(data.data)
                    form.render()
                }
            );
            layer.close(index)
        });
    })
    // 生成菜单命令行
    $('#create_cmd_menu').click(function(){
        $('input[name="cmd"]').val(1)
        $.get('add', 
               $("#menu_form").serializeArray()
            ,
            function(data) {
                $('input[name="create_cmd_menu"]').val(data)
            }
        );
    })
    // 立即执行
    $('#create_menu').click(function(){
        layer.confirm('确定执行吗？？', {
          btn: ['确定', '取消'] //可以无限个按钮
        }, function(index, layero){
            $('input[name="cmd"]').val(0)
            $.get('add', 
                   $("#menu_form").serializeArray()
                ,
                function(data) {
                    data.data = data.data+'&#10;'
                    data.data += $('#res_menu_msg').html()
                    $('#res_menu_msg').html(data.data)
                    form.render()
                }
            );
            layer.close(index)
        });
    })
    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'system.command/index',
        add_url: 'system.command/add',
        edit_url: 'system.command/edit',
        delete_url: 'system.command/delete',
        export_url: 'system.command/export',
        modify_url: 'system.command/modify',
    };

    var Controller = {

        index: function() {
            ea.table.render({
                init: init,
                cols: [
                    [
                        { type: 'checkbox' },
                        { field: 'id', title: 'ID' },
                        { field: 'type', title: '类型' },
                        { field: 'params', title: '参数' },
                        { field: 'command', title: '命令' },
                        { field: 'executetime', title: '执行时间' },
                        { field: 'createtime', title: '创建时间' },
                        { field: 'updatetime', title: '更新时间' },
                        { field: 'status', title: '状态', templet: ea.table.switch },
                        { width: 250, title: '操作', templet: ea.table.tool },

                    ]
                ],
            });

            ea.listen();
        },
        add: function() {
            ea.listen();
        },
        edit: function() {
            ea.listen();
        },
    };
    return Controller;
});