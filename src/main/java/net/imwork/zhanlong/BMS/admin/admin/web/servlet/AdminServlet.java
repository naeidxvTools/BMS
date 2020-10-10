package net.imwork.zhanlong.BMS.admin.admin.web.servlet;

import net.imwork.zhanlong.commons.CommonUtils;
import net.imwork.zhanlong.BMS.admin.admin.domain.Admin;
import net.imwork.zhanlong.BMS.admin.admin.service.AdminService;
import net.imwork.zhanlong.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminServlet",urlPatterns = "/AdminServlet")
public class AdminServlet extends BaseServlet
{
    AdminService adminService = new AdminService();

    /**
     * 登录功能
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public String login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.封装表单数据到Admin中
        Admin form = CommonUtils.mapToBean(request.getParameterMap(), Admin.class);
        Admin admin = adminService.login(form);

        if (admin == null)
        {
            request.setAttribute("msg","用户名或密码错误!");
            return "f:/adminjsps/login.jsp";
        }

        request.getSession().setAttribute("admin", admin);

        return "r:/adminjsps/admin/index.jsp";

    }


}
