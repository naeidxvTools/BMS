<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>cartlist.jsp</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
    <script src="<c:url value='/js/round.js'/>"></script>

    <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/cart/list.css'/>">
    <script type="text/javascript">

        $(function ()
        {
            //给全选按钮添加click事件
            $("#selectAll").click(function ()
            {
                //1.获取全选的状态
                let bool = $("#selectAll").attr("checked");
                //2.让所有条目的复选框与全选的状态同步
                setItemCheckBox(bool);
                //3.让结算按钮与全选同步
                setJieSuan(bool);
            });

            // 给所有条目复选框添加click事件
            $(":checkbox[name=checkboxBtn]").click(function ()
            {
                let selectedCount = $(":checkbox[name=checkboxBtn][checked=true]").length;//被勾选复选框个数
                let allCount = $(":checkbox[name=checkboxBtn]").length;//所有条目复选框个数
                if (selectedCount == allCount)
                {//全选了
                    $("#selectAll").attr("checked", true);//勾选全选复选框
                    setJieSuan(true);//使结算按钮可用
                } else if (selectedCount == 0)
                {//全撤消了
                    $("#selectAll").attr("checked", false);//撤消全选复选框
                    setJieSuan(false);//使结算按钮不可用
                } else
                {//未全选
                    $("#selectAll").attr("checked", false);//撤消全选复选框
                    setJieSuan(true);//使结算按钮可用
                }
            });


            // 给jia、jian添加事件
            $(".jian").click(function ()
            {
                let cartItemId = $(this).attr("id").substring(0, 32);
                let quantity = Number($("#" + cartItemId + "Quantity").val());
                if (quantity == 1)
                {
                    if (confirm("您是否真要删除该条目？"))
                    {
						location = "/BMS/CartItemServlet?method=batchDelete&cartItemIds=" + cartItemId;
                    }
                } else
                {
                    sendUpdateQuantity(cartItemId, quantity - 1);
                }
            });
            $(".jia").click(function ()
            {
                let cartItemId = $(this).attr("id").substring(0, 32);
                let quantity = Number($("#" + cartItemId + "Quantity").val());
				sendUpdateQuantity(cartItemId, quantity + 1);
            });

            // 异步请求，修改数量
            function sendUpdateQuantity(cartItemId, quantity)
            {
				/*
                 1. 通过cartItemId找到输入框元素
                 2. 通过cartItemId找到小计元素
                */
				let input = $("#" + cartItemId + "Quantity");
				let subtotal = $("#" + cartItemId + "Subtotal");

				$.ajax({
					async:false,
					cache:false,
					url:"/BMS/CartItemServlet",
					data:{method:"updateQuantity",cartItemId:cartItemId,quantity:quantity},
					type:"POST",
					dataType:"json",
					success: function (res)
					{
						input.val(res.quantity);
						subtotal.text(res.subtotal);
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

        //统一设置所有条目的复选按钮
        function setItemCheckBox(bool)
        {
            $(":checkbox[name=checkboxBtn]").attr("checked", bool);//让所有条目的复选框与参数bool同步
        }

        //批量删除
        function batchDelete()
        {
            //1.获取所有被选中条目的复选框
            //2.创建一数组，把所有被选中的复选框的值添加到数组中
            //3.指定location为CartItemServlet，参数method=batchDelete，参数cartItemIds=数组的toString()
            let cartItemIdArray = new Array();
            $(":checkbox[name=checkboxBtn][checked=true]").each(function ()
            {
                cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
            });
            location = "/BMS/CartItemServlet?method=batchDelete&cartItemIds=" + cartItemIdArray;
        }

        //结算
        function jiesuan()
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

<c:choose>
    <c:when test="${empty cartItemList}">
        <table width="95%" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="right">
                    <img align="top" src="<c:url value='/images/icon_empty.png'/>"/>
                </td>
                <td>
                    <span class="spanEmpty">您的借阅车中暂时为空</span>
                </td>
            </tr>
        </table>
    </c:when>
    <c:otherwise>
        <table width="95%" align="center" cellpadding="0" cellspacing="0">
            <tr align="center" bgcolor="#efeae5">
                <td align="left" width="50px">
                    <input type="checkbox" id="selectAll" checked="checked"/><label for="selectAll">全选</label>
                </td>
                <td colspan="2">商品名称</td>
                <td>单价</td>
                <td>登记编号</td>
                <td>操作</td>
            </tr>


            <c:forEach items="${cartItemList}" var="cartItem">
                <tr align="center">
                    <td align="left">
                        <input value="${cartItem.cartItemId}" type="checkbox" name="checkboxBtn" checked="checked"/>
                    </td>
                    <td align="left" width="70px">
                        <a class="linkImage" href="<c:url value='/BookServlet?method=load&bid=${cartItem.book.bid}'/>"><img border="0" width="54"
                                                                                              align="top"
                                                                                              src="<c:url value='/${cartItem.book.image_b}'/>"/></a>
                    </td>
                    <td align="left" width="400px">
                        <a href="<c:url value='/jsps/book/desc.jsp'/>"><span>${cartItem.book.bname}</span></a>
                    </td>
                    <td><span>&yen;<span class="currPrice">${cartItem.book.currPrice}</span></span></td>
                    <td width="100px">
                        <span class="price_n">${cartItem.book.registrationNumber}</span>
                    </td>
                    <td>
                        <a href="<c:url value='/CartItemServlet?method=batchDelete&cartItemIds=${cartItem.cartItemId}'/>">删除</a>
                    </td>
                </tr>
            </c:forEach>

            <tr>
                <td colspan="4" class="tdBatchDelete">
                    <a href="javascript:batchDelete();">批量删除</a>
                </td>
            </tr>
            <tr>
                <td colspan="7" align="right">
                    <a href="javascript:jiesuan();" id="jiesuan" class="jiesuan"></a>
                </td>
            </tr>
        </table>
        <form id="jieSuanForm" action="<c:url value='/CartItemServlet'/>" method="post">
            <input type="hidden" name="cartItemIds" id="cartItemIds"/>
            <input type="hidden" name="total" id="hiddenTotal"/>
            <input type="hidden" name="method" value="loadCartItems"/>
        </form>
    </c:otherwise>
</c:choose>

</body>
</html>
