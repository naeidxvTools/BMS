<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单详细</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/desc.css'/>">
  </head>
  
<body>
	<div class="divOrder">
		<span>借阅号：${order.oid} 借阅时间：${order.ordertime}</span>
	</div>
	<div class="divContent">
		<div class="div2">
			<dl>
				<dt>借阅图书清单</dt>
				<dd>
					<table cellpadding="0" cellspacing="0">
							<tr>
								<th class="tt">图书名称</th>
								<th class="tt" align="left">单价</th>
								<th class="tt" align="left">数量</th>
								<th class="tt" align="left">小计</th>
							</tr>

							<c:forEach items="${order.orderItemList}" var="item">
													<tr style="padding-top: 20px; padding-bottom: 20px;">
														<td class="td" width="400px">
															<div class="bookname">
															  <img align="middle" width="70" src="<c:url value='/${item.book.image_b}'/>"/>
															  <a href="<c:url value='/BookServlet?method=load&bid=${item.book.bid}'/>">${item.book.bname}</a>
															</div>
														</td>
														<td class="td" >
															<span>&yen;${item.book.currPrice}</span>
														</td>
														<td class="td">
															<span>${item.quantity}</span>
														</td>
														<td class="td">
															<span>&yen;${item.subtotal}</span>
														</td>
													</tr>

							</c:forEach>
					</table>
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>

