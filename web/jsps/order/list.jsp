<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="net.imwork.zhanlong.bms.cart.domain.CartItem" %>
<%@ page import="net.imwork.zhanlong.bms.order.domain.Order" %>
<%@ page import="net.imwork.zhanlong.bms.pager.PageBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/list.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
<%--    <script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>--%>
  </head>
  
  <body>

<div class="divMain">
	<div class="divTitle" align="center"><b>借阅信息</b></div>
	<br/>
	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">

		<c:forEach items="${pb.beanList}" var="order">
				<tr class="tt">
					<td width="320px">借阅号：<a  href="<c:url value='/OrderServlet?method=load&oid=${order.oid}'/>">${order.oid}</a></td>
					<td width="200px">借阅时间：${order.ordertime}</td>
					<td width="200px"></td>
				</tr>

				<tr style="padding-top: 10px; padding-bottom: 10px;">
					<td colspan="2">
						<c:forEach items="${order.orderItemList}" var="orderItem">
							<a class="link2" href="<c:url value='/BookServlet?method=load&bid=${orderItem.book.bid}'/>">
								<img border="0" width="70" src="<c:url value='/${orderItem.book.image_b}'/>"/><--${orderItem.book.registrationNumber}
							</a>
						</c:forEach>
					</td>
				</tr>
		</c:forEach>

	</table>
	<br/>
	<%@include file="/jsps/pager/pager.jsp" %>
</div>
  </body>
</html>
