    define(["jquery", "okLayer", "okUtils", "okMock"], function ($,okLayer,okUtils,okMock ) {

    let table = layui.table;
    let form = layui.form;
    //全部插件
    let userTable = table.render({
        elem: '#tableId',
        url: 'getAllplug',
        // url: '{:url("getList")}',
        cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        limit: 10000,
        page: false,
        toolbar: true,
        toolbar: "#toolbarTpl",
        height:'full',
        cols: [[
            // {field: "intro", title: "标识", width: 100, sort: true},
            {field: "title", title: "名称"},
            {field: "version", title: "版本"},
            {field: "describe", title: "简述"},
            {field: "author", title: "作者"},
            {field: "market_price", title: "价格"},
            {field: "sales", title: "销量"},
            {field: "status_switch", title: "状态", templet: "#statusTpl"},
            
            {field: "button", title: "操作按钮"},
        ]],
        done: function (res, curr, count) {
            console.info(res, curr, count);
        }
    });

    //本地插件
    let userTablebd = table.render({
        elem: '#tableIdbd',
        url: 'getList',
        cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        limit: 10000,
        page: false,
        toolbar: true,
        toolbar: "#toolbarTpl",
        height:'full',
        cols: [[
            //{field: "name", title: "标识", width: 100, sort: true},
            {field: "title", title: "名称" },
            {field: "version", title: "版本"},
            {field: "description", title: "简述"},
            {field: "author", title: "作者" },
            
            {field: "status", title: "状态",  templet: "#statusTpl"},
            
            {field: "button",  title: "操作按钮"},
        ]],
        done: function (res, curr, count) {
            console.info(res, curr, count);
        }
    });

    form.on("submit(search)", function (data) {
        userTable.reload({
            where: data.field,
            page: {curr: 1}
        });
        return false;
    });

    table.on("toolbar(tableFilter)", function (obj) {
        switch (obj.event) {
            case "batchEnabled":
                batchEnabled();
                break;
            case "batchDisabled":
                batchDisabled();
                break;
            case "batchDel":
                batchDel();
                break;
            case "add":
                add();
                break;
        }
    });

    table.on("tool(tableFilter)", function (obj) {
        let data = obj.data;
        switch (obj.event) {
            case "install":
                install(data.name);
                break;
            case "uninstall":
                uninstall(data.name);
                break;
            case "config":
                config(data.name);
                break;
            case "state":
                state(data.name);
                break;
            case "remoteInstall":
                remoteInstall(data.name);
                break;
        }
    });

    //安装远程插件
    function remoteInstall(id) {
        const Storage = {};
        Storage.get = function(name) {
            return localStorage.getItem(name);
        }
        var mango_tokeny = Storage.get("mangoadmin_userinfo");
        if (!mango_tokeny) {
            return okLayer.confirm("你当前未登录MangoAdmin，登录后将同步已购买的记录", function () {

                layer.open({
                    type: 2,
                    title: '用户登录',
                    maxmin: true,
                    skin: 'layui-layer-lan',
                    shadeClose: true, //点击遮罩关闭层
                    area : ['600px' , '480px'],
                    content:'/admin/mango/login.html'//弹框显示的url
                });
            })
        }
        okLayer.confirm("确定要安装吗？", function () {
            okUtils.ajax("remoteInstall", "get", {id: id,token: mango_tokeny}, true).done(function (response) {
                if(response.code=='1'){
                    //userTable.reload();
                    //okUtils.tableSuccessMsg(response.msg);
                    okLayer.greenTickMsg(response.msg, function () {
                        userTable.reload();
                        userTablebd.reload();
                    })
                }else{

                    if(response.code =='401'){
                        //未登录
                        layer.open({
                            type: 2,
                            title: '用户登录',
                            maxmin: true,
                            skin: 'layui-layer-lan',
                            shadeClose: true, //点击遮罩关闭层
                            area : ['600px' , '480px'],
                            content:'/admin/mango/login.html'//弹框显示的url
                        });
                    }else{
                        okLayer.redCrossMsg(response.msg, function () {
                        })
                    }


                    if(response.code =='-5'){
                        //未购买
                        okLayer.redCrossMsg(response.msg, function () {
                            var html="<img style='height: 200px;width: 200px;' src='"+ response.data.img +"' >";
                            layer.open({
                                type : 2,
                                title : '请使用手机扫码二维码支付',
                                shade: [0.001, '#393D49'],
                                area : ['500px' , '500px'],
                                // skin : 'layui-layer-nobg', //沒有背景色
                                shadeClose : true,
                                content:'/admin/mango/payqr.html?img='+response.data.code_url +'&order_sn='+response.data.order_sn +'&name='+response.data.name //弹框显示的url
                            });
                        });
                    }else{
                        okLayer.redCrossMsg(response.msg, function () {
                        })
                    }
                    
                }
                
            }).fail(function (error) {
                console.log(error)
            });
        })
    }

    //安装本地插件
    function install(id) {
        okLayer.confirm("确定要安装吗？", function () {
            okUtils.ajax("install", "get", {id: id}, true).done(function (response) {
                if(response.code==1){
                    console.log(response);
                    //userTable.reload();
                    //okUtils.tableSuccessMsg(response.msg);
                    okLayer.greenTickMsg(response.msg, function () {
                        userTable.reload();
                        userTablebd.reload();
                    })
                }else{
                    okLayer.redCrossMsg(response.msg, function () {
                        
                    })
                }
                
            }).fail(function (error) {
                console.log(error)
            });
        })
    }

    function config(id) {
        okLayer.open("配置", "config?name="+id, "90%", "90%", function (layero) {
            //let iframeWin = window[layero.find("iframe")[0]["name"]];
            //iframeWin.initForm(data);
        }, function () {
            userTable.reload();
            userTablebd.reload();
        })
    }

    function uninstall(id) {
        okLayer.confirm("确定要卸载安装吗？", function () {
            okUtils.ajax("uninstall", "get", {id: id}, true).done(function (response) {
                if(response.code==1){
                    console.log(response);
                    //userTable.reload();
                    //okUtils.tableSuccessMsg(response.msg);
                    okLayer.greenTickMsg(response.msg, function () {
                        userTable.reload();
                        userTablebd.reload();
                    })
                }else{
                    okLayer.greenTickMsg(response.msg, function () {
                        
                    })
                }
                
            }).fail(function (error) {
                console.log(error)
            });
        })
    }
    function state(id) {
        okLayer.confirm("确定执行此操作吗？", function () {
            okUtils.ajax("state", "get", {id: id}, true).done(function (response) {
                if(response.code==1){
                    console.log(response);
                    //userTable.reload();
                    //okUtils.tableSuccessMsg(response.msg);
                    okLayer.greenTickMsg(response.msg, function () {
                        userTable.reload();
                        userTablebd.reload();
                    })
                }else{
                    okLayer.greenTickMsg(response.msg, function () {
                        
                    })
                }
                
            }).fail(function (error) {
                console.log(error)
            });
        })
    }

    $('.get-user').click(function(){
        const Storage = {};
        Storage.get = function(name) {
            return localStorage.getItem(name);
        }
        var mango_tokeny = Storage.get("mangoadmin_userinfo");
        if(!mango_tokeny){
            layer.open({
                type: 2,
                title: '用户登录',
                maxmin: true,
                skin: 'layui-layer-lan',
                shadeClose: true, //点击遮罩关闭层
                area : ['600px' , '480px'],
                content:'/admin/mango/login.html'//弹框显示的url
            });
        }else{
            layer.open({
              content: mango_tokeny
              ,btn: ['退出', '取消']
              ,yes: function(index, layero){
                //按钮【按钮一】的回调
                localStorage.removeItem("mangoadmin_userinfo");
                layer.msg('退出成功',{time:1500})
                setTimeout(layer.close(index),800)
              }
              ,btn2: function(index, layero){
                //按钮【按钮二】的回调
                
                //return false 开启该代码可禁止点击该按钮关闭
              }
              ,cancel: function(){ 
                //右上角关闭回调
                
                //return false 开启该代码可禁止点击该按钮关闭
              }
            });
        }
    })

    $('.refresh').click(function(){
        userTable.reload();
        userTablebd.reload();
    })
    

    form.verify({
			
    });

    form.on("submit(add)", function (data) {
        okUtils.ajax($('#plugs_action').attr('action'), "post", data.field, true).done(function (response) {
            //console.log(response);
            if(response.code==1){
                okLayer.greenTickMsg("编辑成功", function () {
                    parent.layer.close(parent.layer.getFrameIndex(window.name));
                });
            }else{
                okLayer.greenTickMsg(response.msg, function () {
                    
                })
            }
            
        }).fail(function (error) {
            console.log(error)
        });
        return false;
    });

    var Controller = {
        index:function(){}
    }
    return Controller;
})