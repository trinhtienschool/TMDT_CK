package vn.thegioidochoi.Dao;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.supplier.TopSupplierHistory;
import vn.thegioidochoi.model.util.Util;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LoadTopSupplierHistory {
    //insert top supplier history to database
    public static boolean insertTopSupplierHistory(int supplier_id, int commission_rate) {

            int isInserted = 0;
            String sql = "insert into top_supplier_history(supplier_id,  commission_rate) values(?,?)";
            try {

                PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
                pe.setLong(1,supplier_id);
                pe.setInt(2,commission_rate);

                synchronized (pe) {
                    isInserted = pe.executeUpdate();
                }
                pe.close();
                return isInserted == 1;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            return false;
        }

}
