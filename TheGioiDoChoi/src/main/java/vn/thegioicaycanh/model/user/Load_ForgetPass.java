package vn.thegioicaycanh.model.user;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.util.Util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Load_ForgetPass {
    public static boolean saveForgetPass(ForgetPass fp){
        boolean isSave = false;
        try {

            String sql = "insert into forget_pass values (?,?,?,?)";
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1,fp.getEmail());
            preparedStatement.setInt(2,fp.getUser_id());
            preparedStatement.setString(3,fp.getKey_forget());
            preparedStatement.setString(4,Util.dateFormat(fp.getDate_end()));
            synchronized (preparedStatement) {
                isSave = preparedStatement.executeUpdate()==1;
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isSave;
    }
    public static ForgetPass loadForgetPassByKey(String key){
        ForgetPass fp=null;
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("select * from forget_pass where key_forget=?");
            preparedStatement.setString(1,key);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    fp = new ForgetPass();
                    fp.setEmail(resultSet.getString(1));
                    fp.setUser_id(resultSet.getInt(2));
                    fp.setKey_forget(resultSet.getString(3));
                    fp.setDate_end(resultSet.getDate(4));
                }
                resultSet.close();
            }
            preparedStatement.close();
            return fp;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static ForgetPass loadForgetPassByEmailKey(String email,String key){
        ForgetPass fp=null;
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("select * from forget_pass where email=? and key_forget=?");
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,key);
            System.out.println(preparedStatement.toString());
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    fp = new ForgetPass();
                    fp.setEmail(resultSet.getString(1));
                    fp.setUser_id(resultSet.getInt(2));
                    fp.setKey_forget(resultSet.getString(3));
                    fp.setDate_end(resultSet.getDate(4));
                }
                resultSet.close();
            }
            preparedStatement.close();
            return fp;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static boolean deleteForgetPassByKey(String key){
        boolean isDeleted=false;
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("delete from forget_pass where key_forget=?");
            preparedStatement.setString(1,key);
            System.out.println("Delete: "+preparedStatement.toString());
            synchronized (preparedStatement){
                isDeleted = preparedStatement.executeUpdate()==1;
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isDeleted;
    }
    public static boolean updateNewPass(long np,int user_id){
        boolean isUpdate = false;
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("update user set password=? where id = ?");
            preparedStatement.setLong(1,np);
            preparedStatement.setInt(2,user_id);

            synchronized (preparedStatement) {
                isUpdate = preparedStatement.executeUpdate()==1;
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isUpdate;
    }

    public static void main(String[] args) {
//        ForgetPass fp = new ForgetPass(2,"trinhtien2212@gmail.com",677364694);
//        System.out.println(saveForgetPass(fp));
        updateNewPass(-801806291,1);

    }

    public static ForgetPass loadForgetPassByEmail(String email_forget_pass) {
        ForgetPass fp=null;
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("select * from forget_pass where email=?");
            preparedStatement.setString(1,email_forget_pass);

            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    fp = new ForgetPass();
                    fp.setEmail(resultSet.getString(1));
                    fp.setUser_id(resultSet.getInt(2));
                    fp.setKey_forget(resultSet.getString(3));
                    fp.setDate_end(resultSet.getDate(4));
                }
                resultSet.close();
            }
            preparedStatement.close();
            return fp;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
