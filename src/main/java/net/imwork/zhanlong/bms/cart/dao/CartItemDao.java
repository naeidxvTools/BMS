package net.imwork.zhanlong.bms.cart.dao;

import net.imwork.zhanlong.commons.CommonUtils;
import net.imwork.zhanlong.bms.book.domain.Book;
import net.imwork.zhanlong.bms.cart.domain.CartItem;
import net.imwork.zhanlong.bms.user.domain.User;
import net.imwork.zhanlong.jdbc.TxQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CartItemDao
{
    private QueryRunner queryRunner = new TxQueryRunner();

    /**
     * 加载多个CartItem
     * @param cartItemIds
     * @return
     */
    public List<CartItem> loadCartItems(String cartItemIds) throws SQLException
    {
        Object[] cartItemIdArray = cartItemIds.split(",");
        String whereSql = toWhereSql(cartItemIdArray.length);
        String sql = "select * from t_cartitem c, t_book b where c.bid=b.bid and " + whereSql;
        return toCartItemList(queryRunner.query(sql, new MapListHandler(), cartItemIdArray));//其中cartItemIdArray必须是Object类型的数组
    }

    /**
     * 按id查询
     * @param cartItemId
     * @return
     */
    public CartItem findByCartItemId(String cartItemId) throws SQLException
    {
        String sql = "select * from t_cartItem c, t_book b where c.bid=b.bid and cartItemId=?";
        Map<String, Object> map = queryRunner.query(sql, new MapHandler(), cartItemId);

        return toCartItem(map);
    }

    /**
     * 用来生成where子句
     * @param len
     * @return
     */
    private String toWhereSql(int len)
    {
        StringBuilder sb = new StringBuilder("cartItemId in (");
        for (int i = 0; i < len; i++)
        {
            sb.append("?");
            if (i < len - 1)
            {
                sb.append(",");
            }
        }
        sb.append(")");
        return sb.toString();
    }

    /**
     *  批量删除
     * @param cartItemIds
     */
    public void batchDelete(String cartItemIds) throws SQLException
    {
        Object[] cartItemIdArray = cartItemIds.split(",");

        String whereSql = toWhereSql(cartItemIdArray.length);
        String sql = "delete from t_cartitem where " + whereSql;

        queryRunner.update(sql, cartItemIdArray);//其中cartItemIdArray必须是Object类型的数组

    }


    /**
     * 查询某个用户的某本图书在购物车中是否存在
     * @param uid
     * @param bid
     * @return
     */
    public CartItem findByUidAndBid(String uid, String bid) throws SQLException
    {
        String sql = "select * from t_cartitem where uid=? and bid=?";
        Map<String, Object> map = queryRunner.query(sql, new MapHandler(), uid, bid);
        CartItem cartItem = toCartItem(map);
        return cartItem;
    }

    /**
     * 修改指定条目的数量
     * @param cartItemId
     * @param newQuantity
     */
    public void updateQuantity(String cartItemId, int newQuantity) throws SQLException
    {
        String sql = "update t_cartitem set quantity=? where cartItemId=?";
        queryRunner.update(sql, newQuantity, cartItemId);
    }

    /**
     * 添加条目
     * @param cartItem
     */
    public void addCartItem(CartItem cartItem) throws SQLException
    {
        String sql = "insert into t_cartitem (cartItemId,quantity, bid, uid)" +
                "values (?,?,?,?)";
        Object[] params = {cartItem.getCartItemId(), cartItem.getQuantity(),
                cartItem.getBook().getBid(), cartItem.getUser().getUid()};

        queryRunner.update(sql, params);

    }

    /**
     * 把一个map映射成一个CartItem
     * @param map
     * @return
     */
    private CartItem toCartItem(Map<String, Object> map)
    {
        if(map == null || map.size() == 0) return null;
        CartItem cartItem = CommonUtils.mapToBean(map,CartItem.class);
        Book book = CommonUtils.mapToBean(map, Book.class);
        User user = CommonUtils.mapToBean(map, User.class);

        cartItem.setBook(book);
        cartItem.setUser(user);
        return cartItem;
    }

    /**
     * 把多个map(List<Map>)映射成多个CartItem(List<CartItem>)
     * @param mapList
     * @return
     */
    private List<CartItem> toCartItemList(List<Map<String, Object>> mapList)
    {
        List<CartItem> list = new ArrayList<>();

        for (Map<String, Object> map : mapList)
        {
            CartItem cartItem = toCartItem(map);
            list.add(cartItem);
        }
        return list;
    }

    /**
     * 通过用户查询购物车条目
     * @param uid
     * @return
     */
    public List<CartItem> findByUser(String uid) throws SQLException
    {
        String sql = "select * from t_cartitem c, t_book b where c.bid = b.bid and uid=? order by c.orderBy";
        List<Map<String, Object>> mapList = queryRunner.query(sql, new MapListHandler(), uid);

        List<CartItem> cartItems = toCartItemList(mapList);

        return cartItems;
    }



}
