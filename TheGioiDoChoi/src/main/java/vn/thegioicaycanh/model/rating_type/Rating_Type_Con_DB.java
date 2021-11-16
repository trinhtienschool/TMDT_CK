package vn.thegioicaycanh.model.rating_type;


import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.header_footer.Category;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class Rating_Type_Con_DB {

    public static List<Rating_Type> loadrating_typeFormSql(String sql) {
        List<Rating_Type> list = new ArrayList<Rating_Type>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    list.add(getRatingType(resultSet));
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
    public static Rating_Type getRatingType(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        Rating_Type rating_type = new Rating_Type();
        try {
            rating_type.setId(resultSet.getInt(1));
            rating_type.setName(resultSet.getString(2));
            rating_type.setStatus(resultSet.getInt(3));
            return rating_type ;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static Rating_Type loadRating_TypeById(int Rating_Type_id){
        Rating_Type rating_type = new Rating_Type();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT id, name, status from rating_type WHERE id = ?");
            preparedStatement.setInt(1,Rating_Type_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    rating_type.setId(resultSet.getInt(1));
                    rating_type.setName(resultSet.getString(2));
                    rating_type.setStatus(resultSet.getInt(3));
                }
                resultSet.close();
            }
            preparedStatement.close();

        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return rating_type;
    }
    public static boolean insertRating_Type(String name, int status){
        String sql = "INSERT INTO rating_type(name,status) value (?,?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, status);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return false;
    }
    public  static boolean updateRating_Type(int id, String name, int status){
        String sql = "UPDATE rating_type SET name = ?, status = ? WHERE id = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, status);
            preparedStatement.setInt(3,id);
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
    public static boolean deleteRating_Type(int id){
        String sql = "DELETE FROM rating_type WHERE id=?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, id);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return false;
    }
    public static void main(String[] args) {
//        for(Rating_Type a:loadrating_typeFormSql("select * from rating_type")){
//            System.out.println(a.getId()+"/"+a.getName()+"/"+a.getStatus());
//        }
        System.out.println(loadRating_TypeById(6));
//        insertRating_Type("ok",1);
//        updateRating_Type(6,"okla",1);
        System.out.println(deleteRating_Type(14));
    }
}
