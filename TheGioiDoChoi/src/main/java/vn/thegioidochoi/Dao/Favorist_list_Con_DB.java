
package vn.thegioidochoi.Dao;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.favorist_list.FavoristList;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Favorist_list_Con_DB {
    public static boolean deleteFavoristList(int user_id,int pro_id){
        String sql="delete from favorist_list where user_id="+user_id+" and pro_id="+pro_id;
        return excuteSql(sql);
    }
    public static boolean excuteSql(String sql){
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
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
    public static List<FavoristList> loadFavoristListFormSql(String sql){
        List<FavoristList>list = new ArrayList<FavoristList>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getFavoristList(resultSet));
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
    public static FavoristList getFavoristList(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        FavoristList favoristList = new FavoristList();
        try {
            favoristList.setUser_id(resultSet.getInt(1));
            favoristList.setPro_id(resultSet.getInt(2));
            return favoristList;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static boolean insertFavorist(int userid,int proid){
        String sql = "insert into favorist_list VALUES (?,?)";
        int update=0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,userid );
            preparedStatement.setInt(2, proid);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean updateFavoristlistActiveById( int active,int user_id){
        String sql = "UPDATE favorist_list SET active = ? WHERE user_id = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,active);
            preparedStatement.setInt(2,user_id);
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

    public static void main(String[] args) {
//        System.out.println( deleteFavoristList(1995,156));
//        System.out.println(insertFavorist(5,6));
        updateFavoristlistActiveById(1,1);
    }
    public static boolean saveFavoristList(int user_id,int pro_id){
        int updated =0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("insert into favorist_list values(?,?)");
            pe.setInt(1,user_id);
            pe.setInt(2,pro_id);
            synchronized (pe){
                updated= pe.executeUpdate();
            }
            pe.close();
            return updated==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean deleteProductFavoristList(int user_id,int pro_id){
        int updated =0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("delete from favorist_list where user_id=? and pro_id=?");
            pe.setInt(1,user_id);
            pe.setInt(2,pro_id);
            synchronized (pe){
                updated= pe.executeUpdate();
            }
            pe.close();
            return updated==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}

