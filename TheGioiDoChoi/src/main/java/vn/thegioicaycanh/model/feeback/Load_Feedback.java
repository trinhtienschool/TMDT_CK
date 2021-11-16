package vn.thegioicaycanh.model.feeback;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.user.ForgetPass;
import vn.thegioicaycanh.model.util.Util;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class Load_Feedback {
    public static boolean saveFeedback(Feedback feedback){
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                String sql = "INSERT INTO feedback(email,name,content,date_created) " +
                        "VALUES ('" + feedback.getEmail() + "','" + feedback.getName() + "','" + feedback.getContent() + "','" + Util.dateFormat(feedback.getDate_created()) + "')";
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

    public static void main(String[] args) {
        System.out.println(saveFeedback(new Feedback("342@gami.com","Thy","Tôi tên là Tiến")));
    }

}
