package net.imwork.zhanlong.bms.order.dao;

import net.imwork.zhanlong.commons.CommonUtils;
import net.imwork.zhanlong.bms.book.domain.Book;
import net.imwork.zhanlong.bms.order.domain.Order;
import net.imwork.zhanlong.bms.order.domain.OrderItem;
import net.imwork.zhanlong.bms.pager.Expression;
import net.imwork.zhanlong.bms.pager.PageBean;
import net.imwork.zhanlong.bms.pager.PageConstants;
import net.imwork.zhanlong.jdbc.TxQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrderDao
{
    private QueryRunner queryRunner = new TxQueryRunner();

    /**
     * 查询订单状态
     * @param oid
     * @return
     */
    public int findStatus(String oid) throws SQLException
    {
        String sql = "select status from t_order where oid=?";
        Number number = (Number) queryRunner.query(sql, new ScalarHandler(),oid);
        return number.intValue();
    }

    /**
     * 修改订单状态
     * @param oid
     * @param status
     */
    public void updateStatus(String oid,int status) throws SQLException
    {
        String sql = "update t_order set status=? where oid=?";
        queryRunner.update(sql, status, oid);
    }

    /**
     * 加载订单
     * @param oid
     * @return
     * @throws SQLException
     */
    public Order load(String oid) throws SQLException
    {
        String sql = "select * from t_order where oid=?";
        Order order = queryRunner.query(sql, new BeanHandler<>(Order.class), oid);
        loadOrderItem(order); //为当前订单加载他的所有订单条目
        return order;
    }

    /**
     * 生成订单
     * @param order
     */
    public void add(Order order) throws SQLException
    {
        //1.插入订单
        String sql = "insert into t_order values (?,?,?,?,?,?)";
        Object[] params = {order.getOid(),order.getOrdertime(),order.getTotal(),
                order.getStatus(),order.getAddress(),order.getOwner().getUid()};
        queryRunner.update(sql, params);

        //2.循环遍历订单的所有条目，让每个条目生成一个Object[]
        //多个条目对应Object[][]
        //执行批处理，完成插入订单条目
        sql = "insert into t_orderitem values (?,?,?,?,?,?,?,?,?)";
        int len = order.getOrderItemList().size();
        Object[][] objs = new Object[len][];
        for (int i = 0; i < len; i++)
        {
            OrderItem item = order.getOrderItemList().get(i);
            objs[i] = new Object[]{item.getOrderItemId(),item.getQuantity(),item.getSubtotal(),
                    item.getBook().getBid(),item.getBook().getBname(),item.getBook().getRegistrationNumber(),item.getBook().getCurrPrice(),
                    item.getBook().getImage_b(),order.getOid()};
        }
        queryRunner.batch(sql, objs);
    }

    /**
     * 按用户查询订单
     * @param uid
     * @param pc
     * @return
     * @throws SQLException
     */
    public PageBean<Order> findByUser(String uid, int pc) throws SQLException
    {
        List<Expression> expressions = new ArrayList<>();
        expressions.add(new Expression("uid", "=", uid));
        PageBean<Order> orderPageBean = findByCriteria(expressions, pc);
        return orderPageBean;
    }

    /**
     * 按状态查询
     * @param status
     * @param pc
     * @return
     * @throws SQLException
     */
    public PageBean<Order> findByStatus(int status, int pc) throws SQLException
    {
        List<Expression> expressions = new ArrayList<>();
        expressions.add(new Expression("status", "=", status + ""));
        return findByCriteria(expressions, pc);
    }


    /**
     * 查询所有
     * @param pc
     * @return
     * @throws SQLException
     */
    public PageBean<Order> findAll(int pc) throws SQLException
    {
        List<Expression> expressions = new ArrayList<>();
        return findByCriteria(expressions, pc);
    }

    /**
     * 通用的查询方法
     * @param expressions
     * @param pc
     * @return
     */
    private PageBean<Order> findByCriteria(List<Expression> expressions, int pc) throws SQLException
    {
        /*
        1.得到ps
        2.得到tr
        3.得到beanList
        4.创建PageBean，返回
         */

        /*
        1.得到ps
         */
        int ps = PageConstants.ORDER_PAGE_SIZE; //每页记录数
        /*
        2.通过expressions来生成where子句
         */
        StringBuilder whereSql = new StringBuilder(" where 1=1");
        List<Object> params = new ArrayList<>(); //sql中问号，它是对应问号的值
        for (Expression expression : expressions)
        {
            whereSql.append(" and " + expression.getName() + " " + expression.getOperator() + " ");

            if (!expression.getOperator().equals("is null"))
            {
                whereSql.append("?");
                params.add(expression.getValue());
            }
        }
        /*
        3.得到tr总记录数
         */
        String sql = "select count(*) from t_order" + whereSql;
        Number number = (Number)queryRunner.query(sql, new ScalarHandler(), params.toArray());
        int tr = number.intValue();

        /*
        4.得到beanList，即当前页记录
         */
        sql = "select * from t_order" + whereSql + " order by ordertime desc limit ?, ?";

        params.add((pc - 1) * ps);
        params.add(ps);
        List<Order> beanList = queryRunner.query(sql, new BeanListHandler<>(Order.class), params.toArray());
        //虽然已经获得所有的订单，但是每个订单中并没有订单条目
        //遍历每个订单，为其添加所有订单
        for (Order order : beanList)
        {
            loadOrderItem(order);
        }

        /*
        5.创建PageBean，设置参数
         */
        PageBean<Order> pb = new PageBean<>();
        pb.setBeanList(beanList);
        pb.setPc(pc);
        pb.setPs(ps);
        pb.setTr(tr);

        return pb;
    }

    /*
     * 为指定的order加载他的所有OrderItem
     */
    private void loadOrderItem(Order order) throws SQLException
    {
        //1.给出sql语句select * from t_orderitem where oid=?
        //2.执行之，得到List<OrderItem>
        //3.设置给Order对象
        String sql = "select * from t_orderitem where oid=?";
        List<Map<String, Object>> mapList = queryRunner.query(sql, new MapListHandler(), order.getOid());

        List<OrderItem> orderItemList = toOrderItemList(mapList);

        order.setOrderItemList(orderItemList);
    }

    /*
     * 把多个map转换成多个OrderItem
     */
    private List<OrderItem> toOrderItemList(List<Map<String, Object>> mapList)
    {
        List<OrderItem> orderItemList = new ArrayList<>();
        for (Map<String, Object> map : mapList)
        {
            OrderItem orderItem = toOrderItem(map);
            orderItemList.add(orderItem);
        }
        return orderItemList;
    }

    /*
     * 把一个map转换成一个OrderItem
     */
    private OrderItem toOrderItem(Map<String, Object> map)
    {
        OrderItem orderItem = CommonUtils.mapToBean(map, OrderItem.class);
        Book book = CommonUtils.mapToBean(map, Book.class);
        orderItem.setBook(book);
        return orderItem;
    }

    public void remove(String bid) throws SQLException
    {
        String sql = "delete from t_orderitem where bid=?";
        queryRunner.update(sql, bid);
    }

    public void batchDelete(String oid) throws SQLException
    {
        queryRunner.update("delete from t_orderitem where oid = " + oid);
        queryRunner.update("delete from t_order where oid = " + oid);
    }

    @Test
    public void method() throws SQLException
    {
        batchDelete("'1F8D1FFC67F141B0B653BD19321F8543'");
    }
}
