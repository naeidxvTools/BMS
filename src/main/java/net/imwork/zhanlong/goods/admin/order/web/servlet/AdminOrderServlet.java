package net.imwork.zhanlong.goods.admin.order.web.servlet;

import net.imwork.zhanlong.goods.order.domain.Order;
import net.imwork.zhanlong.goods.order.service.OrderService;
import net.imwork.zhanlong.goods.pager.PageBean;
import net.imwork.zhanlong.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminOrderServlet",urlPatterns = "/admin/AdminOrderServlet")
public class AdminOrderServlet extends BaseServlet
{
    private OrderService orderService = new OrderService();

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
     * 查询所有
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        //1.得到pc:如果页面传，使用页面的，如果没传，pc=1
        int pc = getPc(request);

        //2.得到url
        String url = getUrl(request);

        //4.使用pc调用service#findAll得到PageBean
        PageBean<Order> pb = orderService.findAll(pc);

        //5.给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        System.out.println("ok");
        return "f:/adminjsps/admin/order/list.jsp";
    }

    /**
     * 按状态查询
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findByStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        //1.得到pc:如果页面传，使用页面的，如果没传，pc=1
        int pc = getPc(request);

        //2.得到url
        String url = getUrl(request);

        //3.获取链接参数：status
        int status = Integer.parseInt(request.getParameter("status"));

        //4.使用pc调用service#findAll得到PageBean
        PageBean<Order> pb = orderService.findByStatus(status,pc);

        //5.给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        System.out.println("ok");
        return "f:/adminjsps/admin/order/list.jsp";
    }

    /**
     * 查看订单详细信息
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
        return "f:/adminjsps/admin/order/desc.jsp";
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
            return "f:/adminjsps/msg.jsp";
        }
        orderService.updateStatus(oid,5); //设置状态为取消!
        request.setAttribute("code", "success");
        request.setAttribute("msg","您的订单已经取消了，您不后悔吗!");
        return "f:/adminjsps/msg.jsp";
    }

    /**
     * 发货
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String deliver(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String oid = request.getParameter("oid");
        //校验订单状态
        int status = orderService.findStatus(oid);
        if (status != 2)
        {
            request.setAttribute("code", "error");
            request.setAttribute("msg","状态不对，不能发货!");

            return "f:/adminjsps/msg.jsp";
        }
        orderService.updateStatus(oid,3); //设置状态为取消!
        request.setAttribute("code", "success");
        request.setAttribute("msg","您的订单已发货，请查看物流，马上确认吧!");
        return "f:/adminjsps/msg.jsp";
    }

}

