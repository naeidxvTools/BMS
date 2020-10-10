package net.imwork.zhanlong.bms.admin.web.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminLoginFilter implements Filter
{
    public void destroy()
    {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws ServletException, IOException
    {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        Object admin = request.getSession().getAttribute("admin");
        if (admin == null)
        {
            request.setAttribute("msg","您还没有登录，不要瞎溜达!");
            request.getRequestDispatcher("/adminjsps/login.jsp").forward(request,response);

        }else
        {
            chain.doFilter(req, resp);

        }
    }

    public void init(FilterConfig config) throws ServletException
    {

    }

}
