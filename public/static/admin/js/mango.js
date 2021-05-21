 define(["jquery","okLayer", "okUtils","inputmail","jqueryMigrate"], function($,okLayer,okUtils,inputmail,jqueryMigrate) {
        let form = layui.form;


        //laydate.render({elem: "#birthday", type: "datetime"});

        form.verify({

        });

        $(function(){
            $("#email").changeTips({
                divTip:".on_changes"
            }); 
        })
        $("#quzhuce").click(function() {
            $("#zhuce").show(100);
            $("#denglu").hide(100);
            //window.open("https://ruanzubao.com/pc/user/login.html?method=reg")
        });

        $("#qudenglu").click(function() {
            $("#zhuce").hide(100);
            $("#denglu").show(100);
        });
        

        form.on("submit(add)", function(data) {
            okUtils.ajax("http://ruanzubao.com/api/user/login.html", "post", data.field, true).done(function(response) {
                //console.log(response);
                if (response.code == 1) {
                    okLayer.greenTickMsg("登录成功", function() {

                        const Storage = {};
                        Storage.get = function(name) {
                            return localStorage.getItem(name);
                        }

                        Storage.set = function(name, val) {
                            localStorage.setItem(name, val);
                        }

                        Storage.set("mangoadmin_userinfo", response.data.userinfo.token);
                        //console.log(Storage.get("mangoadmin_userinfo"));

                        parent.layer.close(parent.layer.getFrameIndex(window.name));
                    });
                } else {
                    okLayer.redCrossMsg(response.msg, function() {

                    })
                }

            }).fail(function(error) {
                console.log(error)
            });
            return false;
        });


        //注册
        form.on("submit(reg)", function(data) {
            okUtils.ajax("http://ruanzubao.com/api/user/register", "post", data.field, true).done(function(response) {
                //console.log(response);
                if (response.code == 1) {
                    okLayer.greenTickMsg("注册成功", function() {

                        parent.layer.close(parent.layer.getFrameIndex(window.name));
                    });
                } else {
                    okLayer.redCrossMsg(response.msg, function() {

                    })
                }

            }).fail(function(error) {
                console.log(error)
            });
            return false;
        });

        var timeClock
        function sendCode() {
            var timer_num = 60;
            $(".send").addClass("disable"); //使按钮不能被点击
            timeClock = setInterval(function(){
                timer_num--;
                $('.send').text(timer_num);
                if (timer_num == 0) {
                    clearInterval(timeClock);
                    $('.send').text('发送');
                    $(".send").removeClass("disable"); //
                } 
            },1000)
        }
        $('.send').click(function(){
            //判断邮箱
            var email = $("#email").val();
            if(!email){
                return layer.msg('邮箱不能为空');
            }
            $.ajax({
                url:'http://ruanzubao.com/api/ems/send',
                data:{email:email},
                type:'post',
                success:function(e){
                    if(e.code == 1){
                        sendCode();
                        layer.msg(e.msg);
                    }else{
                        layer.msg(e.msg);
                    }   
                }
            })
            
        })
    });