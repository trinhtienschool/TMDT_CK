package vn.thegioicaycanh.model.rating;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.notifications.Notifications;
import vn.thegioicaycanh.model.rating_type.Rating_Type;
import vn.thegioicaycanh.model.rating_type.Rating_Type_Con_DB;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;

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
    public static void main(String[] args) {
        System.out.println(loadRatingFormSql("select * from rating"));
//        System.out.println(getNameUserById(1));
        System.out.println(getNameRatingTypeById(2));
    }
}
