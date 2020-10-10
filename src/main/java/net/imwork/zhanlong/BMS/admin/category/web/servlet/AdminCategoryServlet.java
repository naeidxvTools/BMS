package net.imwork.zhanlong.BMS.admin.category.web.servlet;

import net.imwork.zhanlong.commons.CommonUtils;
import net.imwork.zhanlong.BMS.book.service.BookService;
import net.imwork.zhanlong.BMS.category.domain.Category;
import net.imwork.zhanlong.BMS.category.service.CategoryService;
import net.imwork.zhanlong.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCategoryServlet",urlPatterns = "/admin/AdminCategoryServlet")
public class AdminCategoryServlet extends BaseServlet
{
    private CategoryService categoryService = new CategoryService();
    private BookService bookService = new BookService();

    /**
     * 添加一级分类
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String addParent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.封装表单数据到Category中
        //2.调用Service的add()方法完成添加
        //3.调用findAll()，返回list.jsp显示所有分类
        Category parent = CommonUtils.mapToBean(request.getParameterMap(), Category.class);
        parent.setCid(CommonUtils.uuid()); //设置cid
        categoryService.add(parent);
        return findAll(request, response);
    }

    /**
     * 添加二级分类：第二步
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String addChild(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.封装表单数据到Category中
        //1.1需要手动的把表单中的pid映射到Child对象中
        //2.调用Service的add()方法完成添加
        //3.调用findAll()，返回list.jsp显示所有分类
        Category child = CommonUtils.mapToBean(request.getParameterMap(), Category.class);
        child.setCid(CommonUtils.uuid()); //设置cid

        //手动映射pid
        String pid = request.getParameter("pid");
        Category parent = new Category();
        parent.setCid(pid);
        child.setParent(parent);

        categoryService.add(child);
        return findAll(request, response);
    }

    /**
     * 添加二级分类：第一步
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String addChildPre(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String pid = request.getParameter("pid"); //当前点击的父分类id
        List<Category> parents = categoryService.findParents();
        request.setAttribute("pid", pid);
        request.setAttribute("parents", parents);
        return "f:/adminjsps/admin/category/add2.jsp";
    }

    /**
     * 修改一级分类：第一步
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String editParentPre(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.获取链接中的cid
        //2.使用cid加载Category
        //3.保存Category
        //4.转发到edit.jsp页面显示Category
        String cid = request.getParameter("cid");
        Category parent = categoryService.load(cid);
        request.setAttribute("parent", parent);
        return "f:/adminjsps/admin/category/edit.jsp";
    }

    /**
     * 修改一级分类：第二步
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String editParent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.封装表单数据到Category中
        //2.调用Service的edit()方法完成修改
        //3.调用findAll()，返回list.jsp显示所有分类
        Category parent = CommonUtils.mapToBean(request.getParameterMap(), Category.class);
        categoryService.edit(parent);
        return findAll(request, response);
    }

    /**
     * 修改二级分类：第一步
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String editChildPre(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.获取链接中的cid
        //2.使用cid加载Category
        //3.保存Category
        //3.1查询所有一级分类，保存之
        //4.转发到edit2.jsp页面显示Category
        String cid = request.getParameter("cid");
        Category child = categoryService.load(cid);
        request.setAttribute("child", child);
        request.setAttribute("parents",categoryService.findParents());
        return "f:/adminjsps/admin/category/edit2.jsp";
    }

    /**
     * 修改二级分类：第二步
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String editChild(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.封装表单数据到Category中
        //1.1把表单中的pid封装到child...
        //2.调用Service的edit()方法完成修改
        //3.调用findAll()，返回list.jsp显示所有分类
        Category child = CommonUtils.mapToBean(request.getParameterMap(), Category.class);
        String pid = request.getParameter("pid");
        Category parent = new Category();
        parent.setCid(pid);
        child.setParent(parent);

        categoryService.edit(child);
        return findAll(request, response);
    }

    /**
     * 删除一级分类
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String deleteParent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.获取链接参数cid，它是一个一级分类的id
        //2.通过cid，查看该分类下子分类的个数
        //3.如果大于0，说明还有子分类，不能删除。保存错误信息，转发到msg.jsp
        //4.如果等于零，删除之，返回到list.jsp
        String cid = request.getParameter("cid");
        int count = categoryService.findChildrenCountByParent(cid);
        if (count > 0)
        {
            request.setAttribute("code","error"); //这句代码可以不加，因为我们没有这个页面
            request.setAttribute("msg","该分类下还有子分类，不能删除!");
            return "f:/adminjsps/msg.jsp";
        }else
        {
            categoryService.delete(cid);
            return findAll(request, response);
        }
    }

    /**
     * 删除二级分类
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String deleteChild(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.获取cid，即2级分类id
        //2.获取该分类下的图书个数
        //3.如果大于零，保存错误信息，转发到msg.jsp
        //4.如果等于零，删除之，返回到list.jsp
        String cid = request.getParameter("cid");
        int count = bookService.findBookCountByCategory(cid);
        if (count > 0)
        {
            request.setAttribute("code","error"); //这句代码可以不加，因为我们没有这个页面
            request.setAttribute("msg","该分类下还有图书，不能删除!");
            return "f:/adminjsps/msg.jsp";
        }else
        {
            categoryService.delete(cid);
            return findAll(request, response);
        }
    }

    /**
     * 查询所有分类
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String findAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        request.setAttribute("parents",categoryService.findAll());
        return "f:/adminjsps/admin/category/list.jsp";
    }
}