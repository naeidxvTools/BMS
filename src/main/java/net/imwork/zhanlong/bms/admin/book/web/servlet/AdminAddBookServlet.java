package net.imwork.zhanlong.bms.admin.book.web.servlet;

import net.imwork.zhanlong.commons.CommonUtils;
import net.imwork.zhanlong.bms.book.domain.Book;
import net.imwork.zhanlong.bms.book.service.BookService;
import net.imwork.zhanlong.bms.category.domain.Category;
import net.imwork.zhanlong.bms.category.service.CategoryService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminAddBookServlet",urlPatterns = "/admin/AdminAddBookServlet")
public class AdminAddBookServlet extends HttpServlet
{
    private BookService bookService = new BookService();
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //1.commons-fileupload的上传三步
        //创建工具
        FileItemFactory factory = new DiskFileItemFactory();

        //2.创建解析器对象
        ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
        servletFileUpload.setFileSizeMax(80 * 1024);

        //3.解析request得到List<FileItem>
        List<FileItem> fileItemList = null;
        try
        {
            fileItemList = servletFileUpload.parseRequest(request);
        } catch (FileUploadException e)
        {
            //如果有异常，说明单个文件大小超出80KB限制了
            error("上传的文件超出了80KB", request, response);
            return;
        }

        //4.把List<FileItem>封装到Book对象中
        //4.1首先把普通表单字段放到一个Map中，再把Map转换成Book和Category对象，再建立两者的关系
        Map<String, Object> map = new HashMap<>();
        for (FileItem fileItem : fileItemList)
        {
            if (fileItem.isFormField())//如果是普通表单字段
            {
                map.put(fileItem.getFieldName(), fileItem.getString("utf-8"));
            }
        }
        Book book = CommonUtils.mapToBean(map, Book.class);//把Map中大部分数据封装到Book对象中
        Category category = CommonUtils.mapToBean(map, Category.class);//把Map中cid封装到Category中
        book.setCategory(category);

        //4.2把上传的图片保存起来
        //获取文件名，并截取之
        //给文件添加前缀：使用uuid，为了避免文件重名
        //检验文件的扩展名：只能是jpg
        //校验图片的尺寸
        //指定图片的保存路径：需要使用ServletContext#getRealPath()
        //保存之
        //把图片的路径设置给Book对象
        FileItem fileItem = fileItemList.get(1);//获取大图
        String filename = fileItem.getName();
        int index = filename.lastIndexOf("\\");
        if (index != -1)
        {
            filename = filename.substring(index + 1);
        }
        filename = CommonUtils.uuid() + "_" + filename;

        if (!filename.toLowerCase().endsWith(".jpg"))
        {
            error("上传的文件扩展名必须是jpg", request, response);
            return;
        }

        //校验图片尺寸
        //保存上传的图片，把图片new成图片对象：Image、Icon、ImageIcon、BufferedImage、ImageIO
        //保存图片：1.获取真实路径,2.创建目标文件，3.保存文件
        String savepath = this.getServletContext().getRealPath("/book_img");
        File destFile = new File(savepath, filename);
        try
        {
            fileItem.write(destFile); //它会把临时文件重定向到指定的路径，再删除临时文件
        } catch (Exception e)
        {
            throw new RuntimeException(e);
        }

        //校验尺寸:1.使用文件路径创建ImageIcon，2.通过ImageIcon得到Image对象，3.获取宽高来进行校验
        ImageIcon icon = new ImageIcon(destFile.getAbsolutePath());
        Image image = icon.getImage();
        if (image.getWidth(null) > 500 || image.getHeight(null) > 500)
        {
            error("您上传的图片尺寸超出500*500",request,response);
            destFile.delete();//删除图片
            return;
        }

        //把图片的路径设置给Book对象
        book.setImage_w("book_img/" + filename);

        //===============================================================
        fileItem = fileItemList.get(2);//获取小图
        filename = fileItem.getName();
        index = filename.lastIndexOf("\\");
        if (index != -1)
        {
            filename = filename.substring(index + 1);
        }
        filename = CommonUtils.uuid() + "_" + filename;

        if (!filename.toLowerCase().endsWith(".jpg"))
        {
            error("上传的文件扩展名必须是jpg", request, response);
            return;
        }

        //校验图片尺寸
        //保存上传的图片，把图片new成图片对象：Image、Icon、ImageIcon、BufferedImage、ImageIO
        //保存图片：1.获取真实路径,2.创建目标文件，3.保存文件
        savepath = this.getServletContext().getRealPath("/book_img");

        destFile = new File(savepath, filename);
        try
        {
            fileItem.write(destFile); //它会把临时文件重定向到指定的路径，再删除临时文件
        } catch (Exception e)
        {
            throw new RuntimeException(e);
        }

        //校验尺寸:1.使用文件路径创建ImageIcon，2.通过ImageIcon得到Image对象，3.获取宽高来进行校验
        icon = new ImageIcon(destFile.getAbsolutePath());
        image = icon.getImage();
        if (image.getWidth(null) > 500 || image.getHeight(null) > 500)
        {
            error("您上传的图片尺寸超出500*500",request,response);
            destFile.delete();//删除图片
            return;
        }

        //把图片的路径设置给Book对象
        book.setImage_b("book_img/" + filename);

        //调用service完成保存
        book.setBid(CommonUtils.uuid());
        bookService.add(book);
        //保存成功信息转发到msg.jsp
        request.setAttribute("msg","添加图书成功!");
        request.getRequestDispatcher("/adminjsps/msg.jsp").forward(request, response);
    }

    /**
     * 保存错误信息，转发到add.jsp
     *
     * @param msg
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void error(String msg, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        request.setAttribute("msg", msg);
        request.setAttribute("parents",new CategoryService().findParents());//所有一级分类
        request.getRequestDispatcher("/adminjsps/admin/book/add.jsp").forward(request, response);
    }


}
