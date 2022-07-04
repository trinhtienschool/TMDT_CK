package vn.thegioidochoi.model.shopping_cart;

import vn.thegioidochoi.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Load_Shopping_Cart {
    public static boolean updateOrderActiveById( int active,int user_id){
        String sql = "UPDATE shopping_cart SET active = ? WHERE user_id = ?";
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
        updateOrderActiveById(1,2);
    }
}
