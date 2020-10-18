<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书详细</title>
    
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
<%--    <script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>--%>
	<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/desc.css'/>">
	<script src="<c:url value='/jsps/js/book/desc.js'/>"></script>
	  <script type="text/javascript">

		  $(function ()
		  {
			  queryBorrow();

			  // 异步请求，查询数据库是否借阅
			  function queryBorrow()
			  {
			  	let bianhao = $("#bianhao").text();  // ok

			  	$.ajax({
					  async:false,
					  cache:false,
					  url:"/BMS/BookServlet",
					  data:{method:"queryBorrow",no:bianhao},
					  type:"POST",
					  dataType:"json",
					  success: function (res)
					  {
						  if (res.no == bianhao)
						  {
							  $("#btn").click(function ()
							  {
							  	 alert("你选择的图书已经被接走了，请请选择其他的图书！")
							  	 return true;
							  });
						  }
					  }
				  });
			  }
		  });

		  //设置结算按钮样式
		  function setJieSuan(bool)
		  {
			  if (bool)
			  {// 有效状态
				  $("#jiesuan").removeClass("kill").addClass("jiesuan");//切换样式
				  $("#jiesuan").unbind("click");//撤消"点击无效"
			  } else
			  {// 无效状态
				  $("#jiesuan").removeClass("jiesuan").addClass("kill");//切换样式
				  $("#jiesuan").click(function ()
				  {//使其"点击无效"
					  return false;
				  });
			  }
		  }

		  //借阅
		  function jieyue()
		  {
			  //1.获取所有被选中的条目的id，放到数组中
			  let cartItemIdArray = new Array();
			  $(":checkbox[name=checkboxBtn][checked=true]").each(function ()
			  {
				  cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
			  });
			  //2.把数组的值toString()，然后赋值给表单的cartItemIds这个hidden
			  $("#cartItemIds").val(cartItemIdArray.toString());
			  //把总计的值，也保存到表单中
			  $("#hiddenTotal").val($("#total").text());

			  //3.提交这个表单
			  $("#jieSuanForm").submit();
		  }


	  </script>
  </head>
  
  <body>
  <div class="divBookName">${book.bname}</div>
  <div>
    <img align="top" src="<c:url value='/${book.image_w}'/>" class="img_image_w"/>
    <div class="divBookDesc">
	    <ul>
	    	<li>图书编号：${book.bid}</li>
			<li>登记编号：<div id="bianhao">${book.registrationNumber}</div></li>
	    </ul>
		<hr class="hr1"/>
		<table>
			<tr>
				<td colspan="2">
					作者：${book.author} 著
				</td>
			</tr>
			<tr>
				<td colspan="2">
					出版社：${book.press}
				</td>
				<td colspan="2">出版时间：${book.publishtime}</td>
			</tr>
			<tr>
				<td colspan="2">版次：${book.edition}</td>
				<td>页数：${book.pageNum}</td>
			</tr>
			<tr>
				<td colspan="2">印刷时间：${book.printtime}</td>
				<td>开本：${book.booksize} 开</td>
			</tr>
			<tr>
				<td colspan="2">
					定价：${book.currPrice}
				</td>
			</tr>
		</table>
		<div class="divForm">
			<form id="form1" action="<c:url value='/CartItemServlet'/>" method="post">
				<input type="hidden" name="method" value="add"/>
				<input type="hidden" name="bid" value="${book.bid}"/>
<%--  				我要借阅：<input id="cnt" style="width: 40px;text-align: center;" type="text" name="quantity" value="1"/>件--%>
  			</form>
  			<a id="btn" href="javascript:$('#form1').submit();"></a>
  		</div>	
	</div>
  </div>
  </body>
</html>
