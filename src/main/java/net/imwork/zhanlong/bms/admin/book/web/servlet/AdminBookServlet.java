package net.imwork.zhanlong.bms.admin.book.web.servlet;

import net.imwork.zhanlong.commons.CommonUtils;
import net.imwork.zhanlong.bms.book.domain.Book;
import net.imwork.zhanlong.bms.book.service.BookService;
import net.imwork.zhanlong.bms.category.domain.Category;
import net.imwork.zhanlong.bms.category.service.CategoryService;
import net.imwork.zhanlong.bms.pager.PageBean;
import net.imwork.zhanlong.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminBookServlet",urlPatterns = "/admin/AdminBookServlet")
public class AdminBookServlet extends BaseServlet
{
    private BookService bookService = new BookService();
    private CategoryService categoryService = new CategoryService();

    /**
     * 删除图书
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String bid = request.getParameter("bid");

        //删除图片
        Book book = bookService.load(bid);
        String savapath = this.getServletContext().getRealPath("/"); //获取真实路径
        new File(savapath, book.getImage_w()).delete(); //删除文件
        new File(savapath, book.getImage_b()).delete(); //删除文件

        bookService.delete(bid);//删除数据库的记录

        request.setAttribute("msg","删除图书成功!");

        return "f:/adminjsps/msg.jsp";
    }

    /**
     * 修改图书
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.把表单数据封装到Book对象中
        //2.封装cid到Category中
        //3.把Category赋给Book
        //4.调用service完成工作
        //5.保存成功信息，转发到msg.jsp
        Map map = request.getParameterMap();
        Book book = CommonUtils.mapToBean(map, Book.class);
        Category category = CommonUtils.mapToBean(map, Category.class);
        book.setCategory(category);
        bookService.edit(book);
        request.setAttribute("msg","修改图书成功!");
        return "f:/adminjsps/msg.jsp";
    }

    /**
     * 加载图书
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        //1.获取bid，得到Book对象，保存之
        String bid = request.getParameter("bid");
        Book book = bookService.load(bid);
        request.setAttribute("book", book);

        //2.获取所有一级分类，保存之
        request.setAttribute("parents", categoryService.findParents());

        //3.获取当前图书所属一级分类下的所有二级分类
        String pid = book.getCategory().getParent().getCid();
        request.setAttribute("children", categoryService.findChildren(pid));

        //4.转发到desc.jsp显示
        return "f:/adminjsps/admin/book/desc.jsp";
    }

    /**
     * 添加图书：第一步
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String addPre(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.获取所有一级分类，保存之
        //2.转发到add.jsp，该页面会在下拉列表中显示所有一级分类
        List<Category> parents = categoryService.findParents();
        request.setAttribute("parents", parents);
        return "f:/adminjsps/admin/book/add.jsp";
    }

    public String ajaxFindChildren(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.获取pid
        //2.通过pid查询出所有二级分类
        //3.把List<Category>转换成json，输出给客户端
        String pid = request.getParameter("pid");
        List<Category> children = categoryService.findChildren(pid);
        String json = toJson(children);
        response.getWriter().print(json);
        return null;
    }
    //{"cid":"dddd","cname":"zhangsan"}
    private String toJson(Category category)
    {
        StringBuilder sb = new StringBuilder("{");
        sb.append("\"cid\"").append(":").append("\"").append(category.getCid()).append("\"");
        sb.append(",");
        sb.append("\"cname\"").append(":").append("\"").append(category.getCname()).append("\"");
        sb.append("}");
        return sb.toString();
    }

    //[{"cid":"dddd","cname":"zhangsan"},{"cid":"ddfff","cname":"lisi"}]
    private String toJson(List<Category> categoryList)
    {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < categoryList.size(); i++)
        {
            sb.append(toJson(categoryList.get(i)));
            if (i < categoryList.size() - 1)
            {
                sb.append(",");
            }
        }
        sb.append("]");
        return sb.toString();
    }
    /**
     * 显示所有分类
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findCategoryAll(HttpServletRequest request, HttpServletResponse response)

    {
         /*
        1.通过service得到所有的分类
         */
        List<Category> parents = categoryService.findAll();
        /*
        2.保存到request，转发到left.jsp
         */
        request.setAttribute("parents", parents);
        return "f:/adminjsps/admin/book/left.jsp";
    }

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
     * 按分类查
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findByCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        //1.得到pc:如果页面传，使用页面的，如果没传，pc=1
        int pc = getPc(request);

        //2.得到url
        String url = getUrl(request);

        //3.获得查询条件，本方法就是cid，即分类的id
        String cid = request.getParameter("cid");

        //4.使用pc和cid调用service#findByCategory得到PageBean
        PageBean<Book> pb = bookService.findByCategory(cid, pc);

        //5.给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        return "f:/adminjsps/admin/book/list.jsp";
    }

    /**
     * 按作者查询
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findByAuthor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        //1.得到pc:如果页面传，使用页面的，如果没传，pc=1
        int pc = getPc(request);

        //2.得到url
        String url = getUrl(request);

        //3.获得查询条件，本方法就是cid，即分类的id
        String author = request.getParameter("author");

        //4.使用pc和cid调用service#findByCategory得到PageBean
        PageBean<Book> pb = bookService.findByAuthor(author, pc);

        //5.给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        return "f:/adminjsps/admin/book/list.jsp";
    }

    /**
     * 按出版社查询
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findByPress(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        //1.得到pc:如果页面传，使用页面的，如果没传，pc=1
        int pc = getPc(request);

        //2.得到url
        String url = getUrl(request);

        //3.获得查询条件，本方法就是cid，即分类的id
        String press = request.getParameter("press");

        //4.使用pc和cid调用service#findByCategory得到PageBean
        PageBean<Book> pb = bookService.findByPress(press, pc);

        //5.给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        return "f:/adminjsps/admin/book/list.jsp";
    }

    /**
     * 按名称查询
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findByBname(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        //1.得到pc:如果页面传，使用页面的，如果没传，pc=1
        int pc = getPc(request);

        //2.得到url
        String url = getUrl(request);

        //3.获得查询条件，本方法就是bname，即书名的bname
        String bname = request.getParameter("bname");

        //4.使用pc和cid调用service#findByCategory得到PageBean
        PageBean<Book> pb = bookService.findByBname(bname, pc);

        //5.给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        return "f:/adminjsps/admin/book/list.jsp";
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
            throws ServletException, IOException {
        /*
         * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
         */
        int pc = getPc(request);
        /*
         * 2. 得到url：...
         */
        String url = getUrl(request);
        /*
         * 3. 获取查询条件，本方法就是cid，即分类的id
         */
        Book criteria = CommonUtils.mapToBean(request.getParameterMap(), Book.class);
        /*
         * 4. 使用pc和cid调用service#findByCategory得到PageBean
         */
        PageBean<Book> pb = bookService.findByCombination(criteria, pc);
        /*
         * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
         */
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        return "f:/adminjsps/admin/book/list.jsp";
    }

}
