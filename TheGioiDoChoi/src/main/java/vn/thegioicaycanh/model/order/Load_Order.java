
package vn.thegioicaycanh.model.order;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.rating.Rating;
import vn.thegioicaycanh.model.shipment.Load_Shipment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Load_Order {
    public static List<Order> loadOderByUserId(int user_id){
        List<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM `order` WHERE user_id = ?";
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,user_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    orderList.add(getOrder(resultSet));
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return orderList;
    }
    public static List<Order> loadOrderFormSql(String sql){
        List<Order>list = new ArrayList<Order>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getOrder(resultSet));
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
    private static Order getOrder(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        Order order = new Order();
        try{
            order.setId(resultSet.getInt(1));
            order.setUser_id(resultSet.getInt(2));
            order.setSale_id(resultSet.getInt(3));
            order.setShip_id(resultSet.getInt(4));
            order.setPayment(resultSet.getInt(5) == 1 ? true : false);
            order.setNote(resultSet.getString(6));
            order.setPhone(resultSet.getInt(7));
            order.setAddress(resultSet.getString(8));
            order.setStatus(resultSet.getInt(9));
            order.setDate_created(resultSet.getDate(10));
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return order;
    }

    // Load lên dashboard
    public static List<Order> loadOrderNear(int limit){
        List<Order> list = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT o.id, o.date_created, u.name, o.`status`, (sum(p.price * op.quantity) + s.price) AS total FROM `order` o JOIN order_product op ON o.id = op.order_id JOIN product p ON op.pro_id=p.id JOIN shipment s ON s.id=o.ship_id JOIN `user` u ON u.id = o.user_id " +
                    "GROUP BY o.id, o.date_created, u.name, o.`status` " +
                    "ORDER BY date_created " +
                    "LIMIT ?");
            preparedStatement.setInt(1,limit);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    Order order = new Order();
                    order.setId(resultSet.getInt(1));
                    order.setDate_created(resultSet.getDate(2));
                    order.setUser_name(resultSet.getString(3));
                    order.setStatus(resultSet.getInt(4));
                    order.setTotal_pay(resultSet.getDouble(5));
                    list.add(order);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return list;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return list;
    }
    // load lên trang chi tiết đơn hàng
    public static Order loadOrder_view(int order_id){
        Order order = new Order();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT o.id, o.date_created, u.id, o.`status`, (sum(p.price * op.quantity) + s.price) AS total, o.payment, o.address, o.phone, o.note, u.`name`, s.price " +
                    "FROM `order` o JOIN order_product op ON o.id = op.order_id JOIN product p ON op.pro_id=p.id JOIN shipment s ON s.id=o.ship_id JOIN `user` u ON u.id = o.user_id " +
                    "WHERE o.id = ?");
            preparedStatement.setInt(1,order_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    order.setId(resultSet.getInt(1));
                    order.setDate_created(resultSet.getDate(2));
                    order.setUser_id(resultSet.getInt(3));
                    order.setStatus(resultSet.getInt(4));
                    order.setTotal_pay(resultSet.getDouble(5));
                    order.setPayment(resultSet.getInt(6)==1 ? true: false);
                    order.setAddress(resultSet.getString(7));
                    order.setPhone(resultSet.getInt(8));
                    order.setNote(resultSet.getString(9));
                    order.setUser_name(resultSet.getString(10));
                    order.setShip_price(resultSet.getDouble(11));
                }
                resultSet.close();
            }
            preparedStatement.close();
            return order;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return order;
    }
    // load trang danh sach don hang theo tinh trang (status=1..6) trong trang danh sach don hang
    public static List<Order> loadOrderByStatus(String status, String from_date, String to_date){
        List<Order> orderList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT o.id, o.date_created, u.name, o.`status`, (sum(p.price * op.quantity) + s.price) AS total, count(o.id) AS countOr " +
                    "FROM `order` o JOIN order_product op ON o.id = op.order_id JOIN product p ON op.pro_id=p.id JOIN shipment s ON s.id=o.ship_id JOIN `user` u ON u.id = o.user_id " +
                    "WHERE o.`status` like ? and o.date_created between ? and ? " +
                    "GROUP BY o.id, o.date_created, u.name, o.`status`");
            preparedStatement.setString(1, status);
            preparedStatement.setString(2, from_date);
            preparedStatement.setString(3, to_date);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    Order order = new Order();
                    order.setId(resultSet.getInt(1));
                    order.setDate_created(resultSet.getDate(2));
                    order.setUser_name(resultSet.getString(3));
                    order.setStatus(resultSet.getInt(4));
                    order.setTotal_pay(resultSet.getDouble(5));
                    order.setCount_id(resultSet.getInt(6));
                    orderList.add(order);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return orderList;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return orderList;
    }
    // load trang danh sach don hang theo tinh trang (status=1..6) trong trang danh sach don hang
    public static List<Order> loadOrderByIdUser(int idUser){
        List<Order> orderList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("select DISTINCT op.order_id id,p.`name`,od.date_created,sum(op.quantity) soluong FROM order_product op JOIN product p ON op.pro_id=p.id  JOIN `order` od on od.id=op.order_id JOIN `user` us on us.id=od.user_id WHERE us.id=? GROUP BY p.`name`,op.order_id,od.date_created");
            preparedStatement.setString(1, String.valueOf(idUser));
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    Order order = new Order();
                    order.setId(resultSet.getInt(1));
                    order.setName_product(resultSet.getString(2));
                    order.setDate_created(resultSet.getDate(3));
                    order.setNumber_product(resultSet.getInt(4));
                    orderList.add(order);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return orderList;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return orderList;
    }
    public static List<Order> loadOrderStatusByIdUser(int idUser){
        List<Order> orderList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT p.id,p.name,o.`status`,(sum(p.price * op.quantity)) AS total, o.date_created FROM \n" +
                    "product p JOIN order_product op on p.id=op.pro_id JOIN `order` o on o.id=op.order_id JOIN `user` u on u.id=o.user_id\n" +
                    "WHERE u.id=?");
            preparedStatement.setString(1, String.valueOf(idUser));
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    Order order = new Order();
                    order.setId(resultSet.getInt(1));
                    order.setName_product(resultSet.getString(2));
                    order.setStatus(resultSet.getInt(3));
                    order.setTotal_pay(resultSet.getDouble(4));
                    order.setDate_created(resultSet.getDate(5));
                    orderList.add(order);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return orderList;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return orderList;
    }
    // Update tình trạng đơn hàng
    public  static boolean updateStatus(int id, String status){
        String sql = "UPDATE `order` SET `status` = ? WHERE id = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, id);
            synchronized (preparedStatement) {
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return false;
    }
    // Load don hang tren trang user bang user_id
    public static List<Order> loadOrderByUserId(int user_id){
        List<Order> orderList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT o.id, o.date_created, u.name, o.`status`, (sum(p.price * op.quantity) + s.price) AS total " +
                    "FROM `order` o JOIN order_product op ON o.id = op.order_id JOIN product p ON op.pro_id=p.id JOIN shipment s ON s.id=o.ship_id JOIN `user` u ON u.id = o.user_id  " +
                    "WHERE u.id = ? " +
                    "GROUP BY o.id, o.date_created, u.name, o.`status`");
            preparedStatement.setInt(1, user_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    Order order = new Order();
                    order.setId(resultSet.getInt(1));
                    order.setDate_created(resultSet.getDate(2));
                    order.setUser_name(resultSet.getString(3));
                    order.setStatus(resultSet.getInt(4));
                    order.setTotal_pay(resultSet.getDouble(5));
                    orderList.add(order);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return orderList;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return orderList;
    }
    // Update status của order bang id
    public static boolean updateStatusById(int order_id, String status){
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("UPDATE `order` SET `status` = ? WHERE id=?");
            preparedStatement.setString(1,status);
            preparedStatement.setInt(2,order_id);
            synchronized (preparedStatement){
                preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return true;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return false;
    }
    public static void main(String[] args) {
//        System.out.println(loadOrderFormSql("SELECT * FROM `order` "));
//        System.out.println(loadOderByUserId(5));
//        System.out.println(loadOrder_view(2));
//        System.out.println(loadOrderByStatus("2","2019-01-01","2020-05-08"));
    }
    public static int addOrder(int user_id, int coupon_code_id, int type_weight, String note, String phone, String address, int status, String date_created, double total_price) {
        int shipment_id= Load_Shipment.addShipment(type_weight);
        int updated=0;
        int id = getNextOrderId();
        String sql = "insert into `order`(user_id,ship_id,payment,note,phone,address,status,date_created,total_price,id ";
        if(coupon_code_id!=0)
            sql+=" , sale_id) values(?,?,?,?,?,?,?,?,?,?,?)";
        else sql+=") values(?,?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setInt(1,user_id);
            pe.setInt(2,shipment_id);
            pe.setInt(3,0);
            pe.setString(4,note);
            pe.setString(5,phone);
            pe.setString(6,address);
            pe.setInt(7,status);
            pe.setString(8,date_created);
            pe.setDouble(9,total_price);
            pe.setInt(10,id);
            if(coupon_code_id!=0)
                pe.setInt(11,coupon_code_id);
            System.out.println(pe.toString());
            synchronized (pe){
                updated=pe.executeUpdate();
            }
            pe.close();
            if(updated==1)
                return id ;
            else return 0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public static int getNextOrderId(){
        int result=0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select max(id) from `order`");
            synchronized (pe){
                ResultSet re = pe.executeQuery();
                if(re.next())
                    result=re.getInt(1)+1;
                re.close();
            }
            pe.close();
            return result;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  result;
    }
}

