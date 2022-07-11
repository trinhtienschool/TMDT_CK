package vn.thegioidochoi.Dao;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.term_and_condition.TermAndCondition;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TermAndCondition_Con_DB {
    public static TermAndCondition getTermAndCondition(ResultSet rs){
        if(rs == null)
            return null;
        TermAndCondition termAndCondition = new TermAndCondition();
        try {
            termAndCondition.setId(rs.getInt(1));
            termAndCondition.setText(rs.getString(2));
            return termAndCondition;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  null;

    }
    public static TermAndCondition loadTermAndCondition(int id){
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from term_and_condition where id=?");
            pe.setInt(1,id);
            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                TermAndCondition termAndCondition = null;
                if(rs.next()) {
                    termAndCondition = getTermAndCondition(rs);
                }
                rs.close();
                pe.close();
                return termAndCondition;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static void saveTerm_condition(String content ){
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("update term_and_condition set content=? ");
            pe.setString(1,content);
            synchronized (pe){
                pe.executeUpdate();
            }
            pe.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

}
