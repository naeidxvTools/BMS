$(function ()
{
    //1.找到所有错误信息，循环遍历之。调用一个方法来确定是否显示错误信息。
    $(".errorClass").each(function ()
    {
        showError($(this));  //遍历每个元素，使用每个元素来调用showError方法
    });

    //2.切换注册按钮的图片
    $("#submitBtn").hover(function ()
    {
        $(this).attr("src","/BMS/images/regist2.jpg");
    },function ()
    {
        $(this).attr("src","/BMS/images/regist1.jpg");
    });

    //3.输入框得到焦点隐藏错误信息
    $(".inputClass").focus(function ()
    {
        var labelId = $(this).attr("id") + "Error";  //通过输入框找到对应的label的id
        $("#" + labelId).text("");//把label的内容清空
        showError($("#" + labelId));//隐藏没有内容的label
    });

    //4.输入框失去焦点进行校验
    $(".inputClass").blur(function ()
    {
        var id = $(this).attr("id");
        var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";
        eval(funName);//执行函数调用
    });

    //5.表单提交时进行校验
    $("#formRegist").submit(function ()
    {
        var bool = true;
        var id = $(".inputClass").each(function ()
        {
            var id = $(this).attr("id");
            var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";
            var b = eval(funName);//执行函数调用
            if (!b)
            {
                bool =  b;
            }
        });

        /*var bool = true;
        if (!validateLoginname())
        {
            bool = false;
        }
        if (!validateVerifyCode())
        {
            bool = false;
        }

        if (!validateLoginpass())
        {
            bool = false;
        }
        if (!validateReloginpass())
        {
            bool = false;
        }
        if (!validateEmail())
        {
            bool = false;
        }*/
        return bool;
    });
});

//登录名校验方法
function validateLoginname()
{
    var id = "loginname";
    var value = $("#" + id).val(); //获取输入框内容
    //1.非空校验
    if (!value)
    {
        $("#" + id + "Error").text("（客户端）用户名不能为空!");
        showError($("#" + id + "Error"));
        return false;
    }

    //2.长度校验
    if (value.length < 3 || value.length > 20)
    {
        $("#" + id + "Error").text("（客户端）用户名必须在3-20之间!");
        showError($("#" + id + "Error"));
        return false;
    }
    //3.是否注册校验
    $.ajax({
        url:"/BMS/UserServlet",
        data:{method:"ajaxValidateLoginname",loginname:value},
        type:"POST",
        dataType:"json",
        async:false,
        cache:false,
        success:function (res)
        {
            if (!res)
            {
                $("#" + id + "Error").text("（异步请求）用户名已经注册!");
                showError($("#" + id + "Error"));
                return false;
            }
        }
    });

    return true;
}

//登录密码校验方法
function validateLoginpass()
{
    var id = "loginpass";
    var value = $("#" + id).val(); //获取输入框内容
    //1.非空校验
    if (!value)
    {
        $("#" + id + "Error").text("（客户端）密码不能为空!");
        showError($("#" + id + "Error"));
        return false;
    }

    //2.长度校验
    if (value.length < 3 || value.length > 20)
    {
        $("#" + id + "Error").text("（客户端）密码必须在3-20之间!");
        showError($("#" + id + "Error"));
        return false;
    }
    return true;
}

//确认密码校验方法
function validateReloginpass()
{
    var id = "reloginpass";
    var value = $("#" + id).val(); //获取输入框内容
    //1.非空校验
    if (!value)
    {
        $("#" + id + "Error").text("（客户端）确认密码不能为空!");
        showError($("#" + id + "Error"));
        return false;
    }

    //2.两次输入是否一致校验
    if (value != $("#loginpass").val())
    {
        $("#" + id + "Error").text("（客户端）两次密码输入不一致!");
        showError($("#" + id + "Error"));
        return false;
    }
    return true;
}

//Email校验方法
function validateEmail()
{
    var id = "email";
    var value = $("#" + id).val(); //获取输入框内容
    //1.非空校验
    if (!value)
    {
        $("#" + id + "Error").text("（客户端）email不能为空!");
        showError($("#" + id + "Error"));
        return false;
    }

    //2.email格式校验
    if (!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value))
    {
        $("#" + id + "Error").text("（客户端）email格式不正确!");
        showError($("#" + id + "Error"));
        return false;
    }

    //3.是否注册校验
    $.ajax({
        url:"/BMS/UserServlet",
        data:{method:"ajaxValidateEmail",email:value},
        type:"POST",
        dataType:"json",
        async:false,
        cache:false,
        success:function (res)
        {
            if (!res)
            {
                $("#" + id + "Error").text("（异步请求）Email已经注册!");
                showError($("#" + id + "Error"));
                return false;
            }
        }
    });
    return true;
}

//验证码校验方法
function validateVerifyCode()
{
    var id = "verifyCode";
    var value = $("#" + id).val(); //获取输入框内容
    //1.非空校验
    if (!value)
    {
        $("#" + id + "Error").text("（客户端）验证码不能为空!");
        showError($("#" + id + "Error"));
        return false;
    }

    //2.长度校验
    if (value.length != 4)
    {
        $("#" + id + "Error").text("（客户端）错误的验证码!");
        showError($("#" + id + "Error"));
        return false;
    }

    //3.是否正确校验
    $.ajax({
        url:"/BMS/UserServlet",
        data:{method:"ajaxValidateVerifyCode",verifyCode:value},
        type:"POST",
        dataType:"json",
        async:false,
        cache:false,
        success:function (res)
        {
            if (!res)
            {
                $("#" + id + "Error").text("（异步请求）验证码错误!");
                showError($("#" + id + "Error"));
                return false;
            }
        }

        /*
        cache: false,
            async: false,
            type: "POST",
            dataType: "json",
            data: {method: "ajaxValidateVerifyCode", verifyCode: value},
            url: "/BMS/UserServlet",
            success: function (flag)
            {
                if (!flag)
                {
                    $("#verifyCodeError").css("display", "");
                    $("#verifyCodeError").text("(异步)错误的验证码！");
                    bool = false;
                }
            }
         */
    });
    return true;
}

//判断当前元素是否存在内容，如果存在内容显示，否则不显示
function showError(ele)
{
    var text = ele.text();//获取元素内容
    if (!text)//如果元素没有内容
    {
        ele.hide();
        //ele.css("display","none");  //隐藏元素
    } else  //如果有内容
    {
        ele.show();
        //ele.css("display","");  //显示内容
    }
}