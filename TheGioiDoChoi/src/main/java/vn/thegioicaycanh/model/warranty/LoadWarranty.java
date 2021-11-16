
package vn.thegioicaycanh.model.warranty;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.util.Util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LoadWarranty {
    // Insert warranty
    public static boolean insertWarranty(int order_id, int user_id, int pro_id, String email, int status, String title, String message){
        try {
           PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("INSERT INTO warranty(order_id, user_id, pro_id, email,`status`,title, message) VALUES (?, ?, ?, ?, ?, ?, ?)");
           preparedStatement.setInt(1,order_id);
           preparedStatement.setInt(2,user_id);
           preparedStatement.setInt(3,pro_id);
           preparedStatement.setString(4,email);
           preparedStatement.setInt(5,status);
           preparedStatement.setString(6,title);
           preparedStatement.setString(7,message);
           synchronized (preparedStatement){
               preparedStatement.executeUpdate();
           }
           preparedStatement.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    // Update warranty
    public static boolean updateWarranty(Warranty warranty){
        try{
            String sql = "UPDATE warranty " +
                    "SET order_id = ?, user_id = ?, pro_id = ?, title = ?, message = ?, img = ?, date_created = ?,`status` = ?, email = ? " +
                    "WHERE id = ?";
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,warranty.getOrder_id());
            preparedStatement.setInt(2, warranty.getUser_id());
            preparedStatement.setInt(3,warranty.getPro_id());
            preparedStatement.setString(4, warranty.getTitle());
            preparedStatement.setString(5, warranty.getMessage());
            preparedStatement.setString(6,warranty.getImg());
            preparedStatement.setString(7,Util.dateFormat(warranty.getDate_created()));
            preparedStatement.setInt(8, warranty.getStatus());
            preparedStatement.setString(9, warranty.getEmail());
            preparedStatement.setInt(10,warranty.getId());
            synchronized (preparedStatement){
                System.out.println(sql);
                preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return true;
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean saveWarranty(Warranty warranty){
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                String sql = "INSERT INTO warranty(order_id, user_id, pro_id) VALUES ("+warranty.getOrder_id() + "," +
                        warranty.getUser_id() + "," + warranty.getPro_id() + ")";
                System.out.println(sql);
                statement.executeUpdate(sql);
            }
            statement.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static List<Warranty> loadWarrantiesBy(String from_date,String to_date){
        List<Warranty>warranties = new ArrayList<Warranty>();
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select w.*, s.name,p.name  from warranty w join `user` s on w.user_id=s.id join product p on w.pro_id=p.id where w.date_created between ? and ?");
            pe.setString(1,from_date);
            pe.setString(2,to_date);
            synchronized (pe){
                ResultSet resultSet = pe.executeQuery();
                while (resultSet.next()){
                    warranties.add(getWarranty(resultSet));
                }
                resultSet.close();
            }
            pe.close();
            return warranties;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return warranties;
    }
    public static Warranty getWarranty(ResultSet resultSet){
        Warranty warranty = new Warranty();
        try {
            warranty.setId(resultSet.getInt(1));
            warranty.setOrder_id(resultSet.getInt(2));
            warranty.setUser_id(resultSet.getInt(3));
            warranty.setPro_id(resultSet.getInt(4));
            warranty.setTitle(resultSet.getString(5));
            warranty.setMessage(resultSet.getString(6));
            warranty.setImg(resultSet.getString(7));
            warranty.setDate_created(resultSet.getDate(8));
            warranty.setStatus(resultSet.getInt(9));
            warranty.setEmail(resultSet.getString(10));
            warranty.setUser_name(resultSet.getString(11));
            warranty.setProduct_name(resultSet.getString(12));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  warranty;
    }
    public static Warranty loadWarrantyBy(int id) {
        Warranty warranty = new Warranty();
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select w.*, s.name,p.name  from warranty w join `user` s on w.user_id=s.id join product p on w.pro_id=p.id where w.id=?");
            pe.setInt(1,id);
            synchronized (pe){
                ResultSet resultSet = pe.executeQuery();
                if (resultSet.next()){
                    warranty=getWarranty(resultSet);
                }
                resultSet.close();
            }
            pe.close();
            return warranty;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static boolean updateWarranty(int id, int status) {
        int isUpdate = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("update warranty set status=? where id = ?");
            pe.setInt(1,status);
            pe.setInt(2,id);
            synchronized (pe){
                isUpdate=pe.executeUpdate();
            }
            pe.close();
            return isUpdate==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;

    }
}

