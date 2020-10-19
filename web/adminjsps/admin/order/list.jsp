<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>借阅列表</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
<%--	<script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>--%>
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/order/list.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/css.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript">
		//批量删除
		function batchDelete()
		{
			// //1.获取所有被选中条目的复选框
			// //2.创建一数组，把所有被选中的复选框的值添加到数组中
			// //3.指定location为CartItemServlet，参数method=batchDelete，参数cartItemIds=数组的toString()
			// let cartItemIdArray = new Array();
			// $(":checkbox[name=checkboxBtn][checked=true]").each(function ()
			// {
			// 	cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
			// });
			// location = "/BMS/CartItemServlet?method=batchDelete&cartItemIds=" + cartItemIdArray;
			alert("批量删除");
		}
	</script>
</head>

<body>

<div class="divMain">
	<div class="title">
		<div style="margin-top:7px;">
			<span style="margin-left: 50px;margin-right: 725px;">商品信息</span>
			<span style="margin-left: 100px;">操作</span>
		</div>
	</div>
	<br/>
	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">



		<c:forEach items="${pb.beanList}" var="order">
			<tr class="tt">
				<td width="320px">借阅号：<a  href="<c:url value='/admin/AdminOrderServlet?method=load&oid=${order.oid}'/>">${order.oid}</a></td>
				<td width="200px">借阅时间：${order.ordertime}</td>
			</tr>
			<tr style="padding-top: 10px; padding-bottom: 10px;">

				<td colspan="2">
					<c:forEach items="${order.orderItemList}" var="orderItem">
						<img border="0" width="70" src="<c:url value='/${orderItem.book.image_b}'/>"/>
						<a class="link2" href="<c:url value='/admin/AdminOrderServlet?method=remove&bid=${orderItem.book.bid}'/>">删除</a>
					</c:forEach>
				</td>
				<td>
					<span style="margin-left: 400px;">
						<a href="javascript:batchDelete();">批量删除</a><br/>
					</span>

				</td>
			</tr>
		</c:forEach>

	</table>
	<br/>
	<%@include file="/jsps/pager/pager.jsp" %>
</div>
</body>
</html>