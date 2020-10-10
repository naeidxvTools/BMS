<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    //禁止浏览器缓存
    response.addHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.addHeader("Cache-Control", "pre-check=0, post-check=0");
    response.setDateHeader("Expires", 0);
%>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/login.css'/>">
    <script type="text/javascript" src="<c:url value='/jquery/jquery-3.4.0.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/jsps/js/user/login.js'/>"></script>
    <script src="<c:url value='/js/common.js'/>"></script>

    <script type="text/javascript">
        $(function ()
        {
            var loginname = window.decodeURI("${cookie.loginname.value}");

            if("${requestScope.user.loginname}")
            {
                loginname = "${requestScope.user.loginname}";
            }

            $("#loginname").val(loginname);
        });
    </script>
</head>
<body>
<div class="main">
    <div>
        <div class="imageDiv"><img class="img" src="<c:url value='/images/zj.png'/>"/></div>
        <div class="login1">
            <div class="login2">
                <div class="loginTopDiv">
                    <img id="imgLogo" src="<c:url value='/images/zan.gif'/>" width="100px"/>
                    <span class="loginTop">书城会员登录</span>
                    <span><a href="<c:url value='/jsps/user/regist.jsp'/>" class="registBtn"></a></span>
                </div>
                <div>
                    <form target="_top" action="<c:url value='/UserServlet'/>" method="post" id="loginForm">
                        <input type="hidden" name="method" value="login"/>
                        <table>
                            <tr>
                                <td width="50"></td>
                                <td><label class="error" id="msg">${msg}</label></td>
                            </tr>
                            <tr>
                                <td width="50">用户名</td>
                                <td><input class="input" type="text" name="loginname" id="loginname"/></td>
                            </tr>
                            <tr>
                                <td height="20">&nbsp;</td>
                                <td><label id="loginnameError" class="error"></label></td>
                            </tr>
                            <tr>
                                <td>密　码</td>
                                <td><input class="input" type="password" name="loginpass" id="loginpass" value="${user.loginpass}"/></td>
                            </tr>
                            <tr>
                                <td height="20">&nbsp;</td>
                                <td><label id="loginpassError" class="error"></label></td>
                            </tr>
                            <tr>
                                <td>验证码</td>
                                <td>
                                    <input class="input yzm" type="text" name="verifyCode" id="verifyCode" value="${user.verifyCode}"/>
                                    <img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/> "/>
                                    <a id="aVerifyCode" href="javascript:_change();">换张图</a>
                                </td>
                            </tr>
                            <tr>
                                <td height="20px">&nbsp;</td>
                                <td><label id="verifyCodeError" class="error"></label></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left">
                                    <input type="image" id="submit" src="<c:url value='/images/login1.jpg'/>"
                                           class="loginBtn"/>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
