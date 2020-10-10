package net.imwork.zhanlong.bms.cart.domain;

import net.imwork.zhanlong.bms.book.domain.Book;
import net.imwork.zhanlong.bms.user.domain.User;

import java.math.BigDecimal;

public class CartItem
{
    private String cartItemId;//主键
    private int quantity;//数量
    private Book book;//条目对应的图书
    private User user;//所属用户

    public CartItem()
    {
    }

    @Override
    public String toString()
    {
        return "CartItem{" +
                "cartItemId='" + cartItemId + '\'' +
                ", quantity=" + quantity +
                ", book=" + book +
                ", user=" + user +
                '}';
    }

    public CartItem(String cartItemId, int quantity, Book book, User user)
    {
        this.cartItemId = cartItemId;
        this.quantity = quantity;
        this.book = book;
        this.user = user;
    }

    //添加小计方法
    public double getSubtotal()
    {
        //使用BigDecimal不会有误差
        //要求必须使用String类型的构造器
        BigDecimal b1 = new BigDecimal(book.getCurrPrice() + "");
        BigDecimal b2 = new BigDecimal(quantity + "");
        BigDecimal multiply = b1.multiply(b2);
        return multiply.doubleValue();
    }

    public static void main(String[] args)
    {
        System.out.println(2.0-1.1); //0.8999999999999999

        BigDecimal b1 = new BigDecimal(2.0 + "");
        BigDecimal b2 = new BigDecimal(1.1 + "");
        BigDecimal b3 = b1.subtract(b2);
        System.out.println(b3.doubleValue()); //0.9
    }

    public String getCartItemId()
    {
        return cartItemId;
    }

    public void setCartItemId(String cartItemId)
    {
        this.cartItemId = cartItemId;
    }

    public int getQuantity()
    {
        return quantity;
    }

    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }

    public Book getBook()
    {
        return book;
    }

    public void setBook(Book book)
    {
        this.book = book;
    }

    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
    }
}
