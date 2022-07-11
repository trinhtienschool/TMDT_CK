package vn.thegioidochoi.Dao;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.order_progress.OrderProgress;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoadOrderProgress {
    public static List<OrderProgress> loadOrderProgressById(int order_id){
        List<OrderProgress> orderProgresses = new ArrayList<>();
        String sql = "SELECT * FROM order_progress\n" +
                "WHERE order_id = ?\n" +
                "ORDER BY `status` DESC";
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,order_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    OrderProgress progress = new OrderProgress();
                    progress.setOrder_id(resultSet.getInt(1));
                    progress.setStatus(resultSet.getInt(2));
                    progress.setDate_created(resultSet.getDate(3));
                    orderProgresses.add(progress);
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return orderProgresses;
    }
}
