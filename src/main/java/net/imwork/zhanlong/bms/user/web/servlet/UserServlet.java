package net.imwork.zhanlong.bms.user.web.servlet;

import net.imwork.zhanlong.commons.CommonUtils;
import net.imwork.zhanlong.bms.user.domain.User;
import net.imwork.zhanlong.bms.user.service.UserService;
import net.imwork.zhanlong.bms.user.service.exception.UserException;
import net.imwork.zhanlong.servlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户模块WEB层
 */
@WebServlet(name = "UserServlet",urlPatterns = "/UserServlet")
public class UserServlet extends BaseServlet
{
    private UserService userService = new UserService();

    /**
     * 修改密码
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    public String updatePassword(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        //1.封装表单数据到User中
        User user = CommonUtils.mapToBean(request.getParameterMap(), User.class);
        //2.从session中获得uid
        User sessionUser = (User) request.getSession().getAttribute("sessionUser");
        if (sessionUser == null)
        {
            request.setAttribute("msg","您还没有登录!");
            return "f:/jsps/user/login.jsp";
        }
        String uid = sessionUser.getUid();

        //3.使用uid和表单中的loginpass和newpass来调用service方法
        //如果出现异常，保存异常信息到request中，转发到pwd.jsp
        try
        {
            userService.updatePassword(uid,user.getNewpass(),user.getLoginpass());
            //4.保存成功信息到request中
            request.setAttribute("msg","恭喜，您修改密码成功!");
            request.setAttribute("code", "success");
            //5.转发到msg.jsp
            return "f:/jsps/msg.jsp";

        } catch (UserException e)
        {
            request.setAttribute("msg",e.getMessage());
            request.setAttribute("user", user);
            return "f:/jsps/user/pwd.jsp";
        }
    }

    /**
     * 退出功能
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    public String quit(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        request.getSession().invalidate();
        return "r:/jsps/user/login.jsp";
    }

    /**
     * 登录功能
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    public String login(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        //1.封装表单数据到User
        User user = CommonUtils.mapToBean(request.getParameterMap(), User.class);

        //2.校验表单数据
        Map<String, String> errors = validateLogin(user, request);
        if (!errors.isEmpty())
        {
            request.setAttribute("errors", errors);
            return "f:/jsps/user/login.jsp";
        }

        //3.使用service查询得到User
        User userByFind = userService.login(user);

        //4.查看用户是否存在
        if (userByFind == null)
        {
            request.setAttribute("msg","用户名或密码错误!");
            request.setAttribute("user", user);
            return "f:/jsps/user/login.jsp";
        }else
        {
            if (userByFind.getStatus() == 0)
            {
                request.setAttribute("msg", "用户还没有激活!");
                request.setAttribute("user", user);
                return "f:/jsps/user/login.jsp";
            } else
            {
                request.getSession().setAttribute("sessionUser", userByFind);
                String loginname = userByFind.getLoginname();
                loginname = URLEncoder.encode(loginname, "utf-8");
                Cookie cookie = new Cookie("loginname", loginname);
                cookie.setMaxAge(60 * 60 * 24 * 10);
                response.addCookie(cookie);
                return "r:/index.jsp";
            }
        }
    }

    /**
     * 校验用户名是否注册
     * @param request
     * @param response
     * @return
     */
    public String ajaxValidateLoginname(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        //1.得到用户名
        String loginname = request.getParameter("loginname");

        //2.通过service得到校验结果
        boolean b = userService.ajaxValidateLoginname(loginname);

        //3.发给客户端
        response.getWriter().print(b);

        return null;
    }

    /**
     * 校验原密码是否正确
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    public String ajaxValidateLoginpass(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        //1.得到原密码
        String loginpass = request.getParameter("loginpass");

        //2.从session中获得uid
        User sessionUser = (User) request.getSession().getAttribute("sessionUser");
        if (sessionUser == null)
        {
            request.setAttribute("msg","(修改密码)您还没有登录!");
            return "f:/jsps/user/login.jsp";
        }
        String uid = sessionUser.getUid();

        //2.通过service得到校验结果
        boolean b = userService.ajaxValidateLoginpass(uid, loginpass);

        //3.发给客户端
        response.getWriter().print(b);

        return null;
    }
    private Map<String, String> validateLogin(User user, HttpServletRequest request)
    {
        Map<String, String> errors = new HashMap<>();

        return errors;
    }


    /**
     * 校验邮箱是否注册
     * @param request
     * @param response
     * @return
     */
    public String ajaxValidateEmail(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        //1.获取Email
        String email = request.getParameter("email");

        //2.通过service得到校验结果
        boolean b = userService.ajaxValidateEmail(email);

        //3.发给客户端
        response.getWriter().print(b);
        return null;
    }

    /**
     * 校验验证码是否正确
     * @param request
     * @param response
     * @return
     */
    public String ajaxValidateVerifyCode(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        //1.获取输入框的验证码
        String verifyCode = request.getParameter("verifyCode");

        //2.获取图片上真实的验证码
        String sessionVerifyCode = (String) request.getSession().getAttribute("verifyCode");

        //3.进行比较（忽略大小写）
        boolean b = sessionVerifyCode.equalsIgnoreCase(verifyCode);

        //4.发送给客户端
        response.getWriter().print(b);

        return null;
    }
    /**
     * 注册功能
     * @param request
     * @param response
     * @return
     */
    public String regist(HttpServletRequest request, HttpServletResponse response)
    {
        //1.封装表单数据到User对象
        User user = CommonUtils.mapToBean(request.getParameterMap(), User.class);

        //2.校验之，如果校验失败，保存错误信息，返回到regist.jsp显示
        Map<String, String> errors = validateRegist(user, request);
        if (!errors.isEmpty())
        {
            request.setAttribute("errors", errors);
            return "f:/jsps/user/regist.jsp";
        }

        //3.使用service完成业务
        userService.regist(user);

        //4.保存成功信息，转发到msg.jsp显示
        request.setAttribute("user", user);
        request.setAttribute("code","success");
        request.setAttribute("msg","注册成功，请马上到邮箱中激活!");
        return "f:/jsps/msg.jsp";
    }

    /**
     * 注册校验
     * @return
     */
    private Map<String, String> validateRegist(User user, HttpServletRequest request)
    {
        Map<String, String> errors = new HashMap<>();

        //1.校验用户名
        String loginname = user.getLoginname();
        if (loginname == null || loginname.trim().isEmpty())
        {
            errors.put("loginname", "用户名不能为空!");
        } else if (loginname.length() < 3 || loginname.length() > 20)
        {
            errors.put("loginname", "用户名长度必须在3-20之间!");
        } else if (!userService.ajaxValidateLoginname(loginname))
        {
            errors.put("loginname", "用户名已经注册!");
        }

        //2.校验登录密码
        String loginpass = user.getLoginpass();
        if (loginpass == null || loginpass.trim().isEmpty())
        {
            errors.put("loginpass", "密码不能为空!");
        } else if (loginpass.length() < 3 || loginpass.length() > 20)
        {
            errors.put("loginpass", "密码长度必须在3-20之间!");
        }

        //3.校验确认密码
        String reloginpass = user.getReloginpass();
        if (reloginpass == null || reloginpass.trim().isEmpty())
        {
            errors.put("reloginpass", "确认密码不能为空!");
        } else if (!reloginpass.equals(loginpass))
        {
            errors.put("reloginpass", "两次输入不一致!");
        }

        //4.校验Email
        String email = user.getEmail();
        if (email == null || email.trim().isEmpty())
        {
            errors.put("email", "email不能为空!");
        } else if (!email.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$"))
        {
            errors.put("email", "Email格式错误!");
        } else if (!userService.ajaxValidateEmail(email))
        {
            errors.put("email", "email已经注册!");
        }

        //5.校验验证码
        String verifyCode = user.getVerifyCode();
        if (verifyCode == null || verifyCode.trim().isEmpty())
        {
            errors.put("verifyCode", "验证码不能为空!");
        } else if (!((String)request.getSession().getAttribute("verifyCode")).equalsIgnoreCase(verifyCode))
        {
            errors.put("reloginpass", "验证码错误!");
        }

        return errors;
    }

    /**
     * 激活功能
     * @param request
     * @param response
     * @return
     */
    public String activation(HttpServletRequest request, HttpServletResponse response)
    {
        String activationCode = (String) request.getParameter("activationCode");
        try
        {
            userService.activation(activationCode);
            request.setAttribute("code","success");
            request.setAttribute("msg","恭喜激活成功，请马上登录!");
        } catch (UserException e)
        {
            request.setAttribute("code","error");
            request.setAttribute("msg",e.getMessage());
        }
        return "f:/jsps/msg.jsp";
    }

}
