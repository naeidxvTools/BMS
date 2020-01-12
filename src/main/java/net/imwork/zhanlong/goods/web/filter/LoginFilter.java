package net.imwork.zhanlong.goods.web.filter;

import net.imwork.zhanlong.goods.user.domain.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter
{
    public void destroy()
    {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws ServletException, IOException
    {
        //1.获取session中的user
        //2.判断是否为null
        //   如果为null，保存错误信息，转发到msg.jsp
        //   如果不为null，放行。
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        User user = (User)request.getSession().getAttribute("sessionUser");

        if (user == null)
        {
            request.setAttribute("code","error");
            request.setAttribute("msg","您还没有登录，不要访问本资源!");
            request.getRequestDispatcher("/jsps/msg.jsp").forward(request,response);
        }else
        {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException
    {

    }

}
