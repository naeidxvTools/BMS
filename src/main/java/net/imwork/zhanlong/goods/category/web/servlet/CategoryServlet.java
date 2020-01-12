package net.imwork.zhanlong.goods.category.web.servlet;

import net.imwork.zhanlong.goods.category.domain.Category;
import net.imwork.zhanlong.goods.category.service.CategoryService;
import net.imwork.zhanlong.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet",urlPatterns = "/CategoryServlet")
public class CategoryServlet extends BaseServlet
{
    private CategoryService categoryService = new CategoryService();

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
        //1.通过service得到所有的分类
        //2.保存request中，转发到left.jsp
        List<Category> parents = categoryService.findAll();

        request.setAttribute("parents",parents);

        return "f:/jsps/left.jsp";
    }


}
