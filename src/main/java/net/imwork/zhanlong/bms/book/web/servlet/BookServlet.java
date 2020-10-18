package net.imwork.zhanlong.bms.book.web.servlet;

import net.imwork.zhanlong.bms.cart.domain.CartItem;
import net.imwork.zhanlong.commons.CommonUtils;
import net.imwork.zhanlong.bms.book.domain.Book;
import net.imwork.zhanlong.bms.book.service.BookService;
import net.imwork.zhanlong.bms.pager.PageBean;
import net.imwork.zhanlong.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 图书模块的web层
 */
@WebServlet(name = "BookServlet",urlPatterns = "/BookServlet")
public class BookServlet extends BaseServlet
{
    private BookService bookService = new BookService();

    /**
     * 获取pc
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
            } catch (RuntimeException e) {}
        }
        return pc;
    }

    /**
     * 获取Url,页面中的分页导航中需要使用它作为超链接的目标
     * @param request
     * @return
     */
    private String getUrl(HttpServletRequest request)
    {
        String url = request.getRequestURI() + "?" + request.getQueryString();
        int index = url.lastIndexOf("&pc=");
        if (index != -1)
        {
            url = url.substring(0, index);
        }
        return url;
    }

    /**
     * 按分类查询
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findByCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.得到pc
        int pc = getPc(request);
        //2.得到url
        String url = getUrl(request);
        //3.获取查询条件 cid
        String cid = request.getParameter("cid");
        //4.使用pc和cid调用service的findByCategory方法
        PageBean<Book> pageBean = bookService.findByCategory(cid, pc);
        //5.给PageBean设置url，保存PageBean，转发到jsps/book/list.jsp
        pageBean.setUrl(url);
        request.setAttribute("pb",pageBean);
        return "f:/jsps/book/list.jsp";
    }

    /**
     * 按作者查
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findByAuthor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.得到pc
        int pc = getPc(request);
        //2.得到url
        String url = getUrl(request);
        //3.获取查询条件 author
        String author = request.getParameter("author");
        //4.使用pc和cid调用service的findByCategory方法
        PageBean<Book> pageBean = bookService.findByAuthor(author, pc);
        //5.给PageBean设置url，保存PageBean，转发到jsps/book/list.jsp
        pageBean.setUrl(url);
        request.setAttribute("pb",pageBean);
        return "f:/jsps/book/list.jsp";
    }

    /**
     * 按出版社查
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findByPress(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.得到pc
        int pc = getPc(request);
        //2.得到url
        String url = getUrl(request);
        //3.获取查询条件 press
        String press = request.getParameter("press");
        //4.使用pc和cid调用service的findByCategory方法
        PageBean<Book> pageBean = bookService.findByPress(press, pc);
        //5.给PageBean设置url，保存PageBean，转发到jsps/book/list.jsp
        pageBean.setUrl(url);
        request.setAttribute("pb",pageBean);
        return "f:/jsps/book/list.jsp";
    }

    /**
     * 按书名查询
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findByBname(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.得到pc
        int pc = getPc(request);
        //2.得到url
        String url = getUrl(request);
        //3.获取查询条件 bname
        String bname = request.getParameter("bname");
        //4.使用pc和cid调用service的findByCategory方法
        PageBean<Book> pageBean = bookService.findByBname(bname, pc);
        //5.给PageBean设置url，保存PageBean，转发到jsps/book/list.jsp
        pageBean.setUrl(url);
        request.setAttribute("pb",pageBean);
        return "f:/jsps/book/list.jsp";
    }

    /**
     * 多条件组合查询
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findByCombination(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.得到pc
        int pc = getPc(request);
        //2.得到url
        String url = getUrl(request);
        //3.获取查询条件
        Book criteria = CommonUtils.mapToBean(request.getParameterMap(), Book.class);

        //4.使用pc和cid调用service的findByCategory方法
        PageBean<Book> pageBean = bookService.findByCombination(criteria, pc);
        //5.给PageBean设置url，保存PageBean，转发到jsps/book/list.jsp
        pageBean.setUrl(url);
        request.setAttribute("pb",pageBean);
        return "f:/jsps/book/list.jsp";
    }

    /**
     * 按bid查询
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String bid = request.getParameter("bid");

        Book book = bookService.load(bid);

        request.setAttribute("book",book);

        return "f:/jsps/book/desc.jsp";
    }

    /**
     * 查询数据库是否借阅
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String queryBorrow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String no = request.getParameter("no");
        System.out.println("no = " + no);
        String queryBorrow = bookService.queryBorrow(no);
        System.out.println("queryBorrow = " + queryBorrow);
        StringBuilder sb = new StringBuilder("{");
        sb.append("\"no\"").append(":").append("\"").append(queryBorrow).append("\"");
        sb.append("}");
        response.getWriter().print(sb);

        return null;
    }

}
