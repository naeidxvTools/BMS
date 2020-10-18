package net.imwork.zhanlong.bms.book.service;

import net.imwork.zhanlong.bms.book.dao.BookDao;
import net.imwork.zhanlong.bms.book.domain.Book;
import net.imwork.zhanlong.bms.pager.PageBean;

import java.sql.SQLException;

/**
 * 图书模块的业务层
 */
public class BookService
{
    private BookDao bookDao = new BookDao();

    /**
     * 修改图书
     * @param bid
     */
    public void delete(String bid)
    {
        try
        {
            bookDao.delete(bid);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * 修改图书
     * @param book
     */
    public void edit(Book book)
    {
        try
        {
            bookDao.edit(book);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * 查询指定当前分类下的图书的个数
     * @param cid
     * @return
     */
    public int findBookCountByCategory(String cid)
    {
        try
        {
            return bookDao.findBookCountByCategory(cid);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * 加载图书
     * @param bid
     * @return
     */
    public Book load(String bid)
    {
        try
        {
            return bookDao.findByBid(bid);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * 按分类查询
     * @param cid
     * @param pc
     * @return
     */
    public PageBean<Book> findByCategory(String cid, int pc)
    {
        try
        {
            return bookDao.findByCategory(cid, pc);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * 按书名查询
     * @param bname
     * @param pc
     * @return
     */
    public PageBean<Book> findByBname(String bname, int pc)
    {
        try
        {
            return bookDao.findByBname(bname, pc);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * 按作者查询
     * @param author
     * @param pc
     * @return
     */
    public PageBean<Book> findByAuthor(String author, int pc)
    {
        try
        {
            return bookDao.findByAuthor(author, pc);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * 按出版社查询
     * @param press
     * @param pc
     * @return
     */
    public PageBean<Book> findByPress(String press, int pc)
    {
        try
        {
            return bookDao.findByPress(press, pc);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * 多条件组合查询
     * @param criteria
     * @param pc
     * @return
     */
    public PageBean<Book> findByCombination(Book criteria, int pc)
    {
        try
        {
            return bookDao.findByCombination(criteria, pc);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * 添加图书
     * @param book
     */
    public void add(Book book)
    {
        try
        {
            bookDao.add(book);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

    }

    public String queryBorrow(String no)
    {
        try
        {
            return bookDao.queryBorrow(no);
        } catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }
}
