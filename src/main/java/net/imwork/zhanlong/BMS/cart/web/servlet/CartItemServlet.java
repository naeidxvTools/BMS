package net.imwork.zhanlong.BMS.cart.web.servlet;

import net.imwork.zhanlong.commons.CommonUtils;
import net.imwork.zhanlong.BMS.book.domain.Book;
import net.imwork.zhanlong.BMS.cart.domain.CartItem;
import net.imwork.zhanlong.BMS.cart.service.CartItemService;
import net.imwork.zhanlong.BMS.user.domain.User;
import net.imwork.zhanlong.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CartItemServlet", urlPatterns = "/CartItemServlet")
public class CartItemServlet extends BaseServlet
{
    private CartItemService cartItemService = new CartItemService();

    /**
     * 加载多个CartItem
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String loadCartItems(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String cartItemIds = request.getParameter("cartItemIds");
        double total = Double.parseDouble(request.getParameter("total"));
        List<CartItem> cartItemList = cartItemService.loadCartItems(cartItemIds);
        request.setAttribute("cartItemList",cartItemList);
        request.setAttribute("cartItemIds", cartItemIds);
        request.setAttribute("total", total);
        return "f:/jsps/cart/showitem.jsp";
    }

    /**
     * 修改购物车条目数量
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String updateQuantity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String cartItemId = request.getParameter("cartItemId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        CartItem cartItem = cartItemService.updateQuantity(cartItemId, quantity);
        StringBuilder sb = new StringBuilder("{");

        sb.append("\"quantity\"").append(":").append(cartItem.getQuantity());
        sb.append(",");
        sb.append("\"subtotal\"").append(":").append(cartItem.getSubtotal());

        sb.append("}");
        System.out.println(sb);
        response.getWriter().print(sb);

        return null;
    }

    /**
     * 批量删除
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String batchDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String cartItemIds = request.getParameter("cartItemIds");

        cartItemService.batchDelete(cartItemIds);

        return myCart(request,response);
    }

    /**
     * 添加购物车条目
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        Map map = request.getParameterMap();
        CartItem cartItem = CommonUtils.mapToBean(map, CartItem.class);
        Book book = CommonUtils.mapToBean(map, Book.class);
        User user = (User) request.getSession().getAttribute("sessionUser");
        cartItem.setBook(book);
        cartItem.setUser(user);

        cartItemService.add(cartItem);

        return myCart(request,response);
    }

    /**
     * 我的购物车
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String myCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        User user = (User) request.getSession().getAttribute("sessionUser");

        List<CartItem> cartItemList = cartItemService.myCart(user.getUid());

        request.setAttribute("cartItemList", cartItemList);
        return "f:/jsps/cart/list.jsp";
    }

}
