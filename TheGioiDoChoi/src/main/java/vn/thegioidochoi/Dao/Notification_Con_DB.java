package vn.thegioidochoi.Dao;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.notifications.Notifications;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Notification_Con_DB {
//    public static String getStringsNotifications(){
//        String sql="select * from notifications";
//        String result="";
//        List<Notifications> listNod=loadNotificationsFormSql(sql);
//        for(Notifications a:listNod){
////            result+=a.getEmail()+",";
//        }
//        return result;
//    }
    public static List<Notifications> loadNotificationsFormSql(String sql){
        List<Notifications>list = new ArrayList<Notifications>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getNotifications(resultSet));
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
    public static Notifications getNotifications(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        Notifications notifications = new Notifications();
        try {
            notifications.setId(resultSet.getInt(1));
            notifications.setTitle(resultSet.getString(2));
            notifications.setContent(resultSet.getString(3));
            notifications.setDate_created(resultSet.getDate(4));
            notifications.setUser_id(resultSet.getInt(5));
            notifications.setAdmin_id(resultSet.getInt(6));
            notifications.setSupplier_id(resultSet.getInt(7));
            notifications.setType(resultSet.getInt(8));
            return notifications;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    // Insert email of footer in database
    public static boolean insertEmail(String email, int status){
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("INSERT INTO notifications(email,`status`) VALUES (?, ?)");
            preparedStatement.setString(1,email);
            preparedStatement.setInt(2,status);
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
//        System.out.println(loadNotificationsFormSql("select * from notifications"));
        for(Notifications a:loadNotificationsFormSql("select * from notifications where supplier_id=1")){
            System.out.println(a.getContent());
        }
//        System.out.println(insertEmail("sylvietran12@gmail.com",1));
    }
}