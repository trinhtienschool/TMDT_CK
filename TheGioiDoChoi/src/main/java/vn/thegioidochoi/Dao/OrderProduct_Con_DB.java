
package vn.thegioidochoi.Dao;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.order_product.OrderProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderProduct_Con_DB {
    public static List<Integer>loadAllOrderProductId(){
        List<Integer> order_ids = new ArrayList<Integer>();
        String sql = "select order_id from `order_product` ORDER BY order_id asc";
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    order_ids.add(resultSet.getInt(1));
                }
                resultSet.close();
            }
            statement.close();
            return order_ids;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static List<OrderProduct> loadOrderProductFormSql(String sql){
        List<OrderProduct>list = new ArrayList<OrderProduct>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getOrderProduct(resultSet));
                }
                resultSet.close();
            }
            statement.close();
            return list;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static OrderProduct getOrderProduct(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        OrderProduct orderProduct = new OrderProduct();
        try {
            orderProduct.setOrder_id(resultSet.getInt(1));
            orderProduct.setPro_id(resultSet.getInt(2));
            orderProduct.setQuantity(resultSet.getInt(3));
            orderProduct.setPrice(resultSet.getDouble(4));
            return orderProduct;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static String getNameProductById(int proid){
        return new ProductEntity().getNameProductById(proid);
    }
    public static double getPriceProductById(int proid){
        return new ProductEntity().getPriceProductById(proid);
    }
    // Load san pham trong trang chi tiet don hang o admin
    public static List<OrderProduct> loadOrderProductByOrderId(int order_id){
        List<OrderProduct> productList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT p.id, p.`name`, op.quantity, p.price, p.slug ,o.id, o.date_created, u.id, o.`status`, (sum(p.price * op.quantity) + o.shipment) AS total, o.payment, o.address, o.phone, o.note, u.`name`, o.shipment , p.percent_sale, p.img " +
                    "FROM `order` o JOIN order_product op ON o.id = op.order_id JOIN product p ON op.pro_id=p.id JOIN `user` u ON u.id = o.user_id " +
                    "WHERE o.id = ? " +
                    "GROUP BY o.id, o.date_created, u.name, o.`status`, o.payment, o.address, o.phone, o.note, u.`name`, o.shipment, p.id, p.`name`, op.quantity, p.price, p.percent_sale, p.img");
            preparedStatement.setInt(1,order_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    OrderProduct orderProduct = new OrderProduct();
                    orderProduct.setPro_id(resultSet.getInt(1));
                    orderProduct.setPro_name(resultSet.getString(2));
                    orderProduct.setQuantity(resultSet.getInt(3));
                    orderProduct.setPrice(resultSet.getDouble(4));
                    orderProduct.setPro_slug(resultSet.getString(5));
                    orderProduct.setPercent(resultSet.getInt(17));
                    orderProduct.setImg(resultSet.getString(18));
                    orderProduct.setSale(resultSet.getDouble(4),resultSet.getInt(17),resultSet.getInt(3));
                    orderProduct.setTotal(resultSet.getDouble(4),resultSet.getInt(17),resultSet.getInt(3));
                    productList.add(orderProduct);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return productList;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return productList;
    }

    public static void main(String[] args) {
        System.out.println(loadOrderProductByOrderId(1924));
    }
    public static void deleteOrderWithProductId(int id) throws SQLException {
        PreparedStatement pe = DBCPDataSource.preparedStatement("delete from order where pro_id=?");
        pe.setInt(1,id);
        synchronized (pe){
            pe.executeUpdate();

        }
        pe.close();
    }
    public static int addOrderProduct(int idSaved, int id, int quantity, double price, int i, double totalPrice) {
        int updated=0;
        String sql="insert into order_product(order_id,pro_id,quantity,price,status,total_price) value(?,?,?,?,?,?)";
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setInt(1,idSaved);
            pe.setInt(2,id);
            pe.setInt(3,quantity);
            pe.setDouble(4,price);
            pe.setInt(5,i);
            pe.setDouble(6,totalPrice);
            synchronized (pe){
                updated=pe.executeUpdate();
            }
            return updated;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return updated;

    }
}

