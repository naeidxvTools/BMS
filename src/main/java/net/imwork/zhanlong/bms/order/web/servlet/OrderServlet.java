package net.imwork.zhanlong.bms.order.web.servlet;

import net.imwork.zhanlong.commons.CommonUtils;
import net.imwork.zhanlong.bms.cart.domain.CartItem;
import net.imwork.zhanlong.bms.cart.service.CartItemService;
import net.imwork.zhanlong.bms.order.domain.Order;
import net.imwork.zhanlong.bms.order.domain.OrderItem;
import net.imwork.zhanlong.bms.order.service.OrderService;
import net.imwork.zhanlong.bms.pager.PageBean;
import net.imwork.zhanlong.bms.user.domain.User;
import net.imwork.zhanlong.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

@WebServlet(name = "OrderServlet",urlPatterns = "/OrderServlet")
public class OrderServlet extends BaseServlet
{
    private OrderService orderService = new OrderService();
    private CartItemService cartItemService = new CartItemService();

    /**
     * 获得当前页码
     * @param request
     * @return
     */
    private int getPc(HttpServletRequest request)
    {
        int pc = 1;
        String param = request.getParameter("pc");

        if (param != null && !param.trim().isEmpty())
        {
            try
            {
                pc = Integer.parseInt(param);
            } catch (RuntimeException e)
            {}
        }
        return pc;
    }

    /**
     * 截取url，页面中的分页导航中需要使用它作为超链接的目标
     * @param request
     * @return
     */
    private String getUrl(HttpServletRequest request)
    {
        String url = request.getRequestURI() + "?" + request.getQueryString();

        //如果url中存在pc参数，截取掉，如果不存在那就不用截取
        int index = url.lastIndexOf("&pc=");
        if (index != -1)
        {
            url = url.substring(0, index);
        }
        return url;
    }


    /**
     * 取消订单
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String cancel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String oid = request.getParameter("oid");
        //校验订单状态
        int status = orderService.findStatus(oid);
        if (status != 1)
        {
            request.setAttribute("code", "error");
            request.setAttribute("msg","状态不对，不能取消!");
            return "f:/jsps/msg.jsp";
        }
        orderService.updateStatus(oid,5); //设置状态为取消!
        request.setAttribute("code", "success");
        request.setAttribute("msg","您的订单已经取消了，您不后悔吗!");
        return "f:/jsps/msg.jsp";
    }

    /**
     * 确认收货
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String confirm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String oid = request.getParameter("oid");
        //校验订单状态
        int status = orderService.findStatus(oid);
        if (status != 3)
        {
            request.setAttribute("code", "error");
            request.setAttribute("msg","状态不对，不能确认收货!");
            return "f:/jsps/msg.jsp";
        }
        orderService.updateStatus(oid,4); //设置状态为交易成功!
        request.setAttribute("code", "success");
        request.setAttribute("msg","恭喜，交易成功!");
        return "f:/jsps/msg.jsp";
    }


    /**
     * 加载订单
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String oid = request.getParameter("oid");
        Order order = orderService.load(oid);
        request.setAttribute("order", order);

        String btn = request.getParameter("btn");//btn说明了用户点击哪个超链接来访问本方法
        request.setAttribute("btn",btn);
        return "f:/jsps/order/desc.jsp";
    }

    /**
     * 生成订单
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String createOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.获取所有购物车条目的id，查询之
        String cartItemIds = request.getParameter("cartItemIds");
        List<CartItem> cartItemList = cartItemService.loadCartItems(cartItemIds);

        //2.创建order
        Order order = new Order();
        order.setOid(CommonUtils.uuid()); //设置主键
        order.setOrdertime(String.format("%tF %<tT",new Date()));//下单时间
        order.setStatus(1); //设置状态，1表示未付款
        order.setAddress(request.getParameter("address"));//设置收货地址
        User owner = (User) request.getSession().getAttribute("sessionUser");
        order.setOwner(owner);//设置订单所有者

        BigDecimal total = new BigDecimal("0");//必须使用字符串类型的构造器
        for (CartItem cartItem : cartItemList)
        {
            total = total.add(new BigDecimal(cartItem.getSubtotal() + ""));
        }
        order.setTotal(total.doubleValue());//设置总计

        //3.创建List<OrderItem>
        //一个CartItem对应一个OrderItem
        List<OrderItem> orderItemList = new ArrayList<>();
        for (CartItem cartItem : cartItemList)
        {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderItemId(CommonUtils.uuid());//设置主键
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setSubtotal(cartItem.getSubtotal());
            orderItem.setBook(cartItem.getBook());
            orderItem.setOrder(order);
            orderItemList.add(orderItem);
        }
        order.setOrderItemList(orderItemList);

        //4.调用service完成添加
        orderService.createOrder(order);

        //删除购物车条目
        cartItemService.batchDelete(cartItemIds);

        //5.保存订单，转发到ordersucc.jsp
        request.setAttribute("order", order);

        return "f:/OrderServlet?method=myOrders";
    }


    /**
     * 我的订单
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String myOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        //1.得到pc:如果页面传，使用页面的，如果没传，pc=1
        int pc = getPc(request);

        //2.得到url
        String url = getUrl(request);

        //3.从当前session中获取User
        User user = (User) request.getSession().getAttribute("sessionUser");

        //request.setAttribute("cartItemList",cartItemList);
//        List<CartItem> cartItemList = (List<CartItem>) request.getAttribute("cartItemList");
//        System.out.println("cartItemList = .........." + cartItemList);

        //4.使用pc和cid调用service#findByCategory得到PageBean
        PageBean<Order> pb = orderService.myOrders(user.getUid(), pc);

        //5.给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
        pb.setUrl(url);

        request.setAttribute("pb", pb);

        return "f:/jsps/order/list.jsp";
    }

}
