package vn.thegioidochoi.Dao;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.rating.Rating;
import vn.thegioidochoi.model.rating_type.Rating_Type;
import vn.thegioidochoi.model.user.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Rating_Con_DB {
    public static List<Rating> loadRatingFormSql(String sql){
        List<Rating>list = new ArrayList<Rating>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getRating(resultSet));
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
    public static Rating getRating(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        Rating rating = new Rating();
        try {
            rating.setId(resultSet.getInt(1));
            rating.setUser_id(resultSet.getInt(2));
            rating.setPro_id(resultSet.getInt(3));
            rating.setComment(resultSet.getString(4));
            rating.setRating_type_id(resultSet.getInt(5));
            rating.setDate_created(resultSet.getDate(6));
            return rating;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static String getNameUserById(int id){
        List<User> users= LoadUser.loadUserFormSql("select * from user");
        for(User u:users){
            if(u.getId()==id){
                return u.getName();
            }
        }
        return null;
    }
    public static String getNameRatingTypeById(int id){
        List<Rating_Type> rating_types= Rating_Type_Con_DB.loadrating_typeFormSql("select * from rating_type");
        for(Rating_Type r:rating_types){
            if(r.getId()==id){
                return r.getName();
            }
        }
        return null;
    }
    public static String getImgaeUserById(int id){
        List<User> users= LoadUser.loadUserFormSql("select * from user");
        for(User u:users){
            if(u.getId()==id){
                return u.getAvatar();
            }
        }
        return null;
    }
    public static boolean updateRatingActiveById( int active,int user_id){
        String sql = "UPDATE rating SET active = ? WHERE user_id = ?";
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
//        System.out.println(loadRatingFormSql("select * from rating"));
//        System.out.println(getNameUserById(1));
//        System.out.println(getNameRatingTypeById(2));
        updateRatingActiveById(1,125);
    }
}
