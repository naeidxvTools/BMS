<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>My JSP 'left.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/book/left.css'/>">
	<script src="<c:url value='/jquery/jquery-3.4.0.js'/> " type="text/javascript"></script>
	<script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">

	<script type="text/javascript">

		var bar = new Q6MenuBar("bar", "九江船舶图书"); //对象名必须与第一个参数相同！

		$(function ()
		{
			bar.colorStyle = 2; //指定配色样式，一共0，1，2，3，4
			bar.config.imgDir = "<c:url value='/menu/img/'/>";//小工具所需图片路径
			bar.config.radioButton = true;//是否排斥，多个一级分类是否排斥

			/*
            ********bar.add("程序设计", "Java Javascript", "/goods/jsps/book/list.jsp", "body");**********
            1.程序设计：一级分类名称
            2.Java JavaScript：二级分类名称
            3./goods/jsps/book/list.jsp：点击二级分类后链接的URL
            4.body：链接的内容在哪个框架页显示
             */
			<c:forEach items="${parents}" var="parent">
			<c:forEach items="${parent.children}" var="child">

			bar.add("${parent.cname}", "${child.cname}", "/BMS/admin/AdminBookServlet?method=findByCategory&cid=${child.cid}", "body");

			</c:forEach>
			</c:forEach>


			$("#menu").html(bar.toString());
			//$("#menu").html("你好");
		});
	</script>
</head>

<body>
<div id="menu"></div>
</body>
</html>
