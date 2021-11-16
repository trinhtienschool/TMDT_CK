package vn.thegioicaycanh.model.coupon_code_type;

import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CouponCodeType_Con_DB {
    public static List<CouponCodeType> loadAllCouponCodeType() {
        String sql = "SELECT * from coupon_code_type";
        return loadCouponCodeTypeFormSql(sql);
    }

    public static String getLinkImageFromCouponType(int id) {
        String sql = "SELECT * FROM coupon_code_type WHERE ID =" + id;
        for (CouponCodeType a : loadCouponCodeTypeFormSql(sql)) {
            return a.getAvatar();
        }
        return null;
    }
    // lay ra ten loai ma giam gia nho Id
    public static List<CouponCodeType> getNameCouponType() {
        String sql = "SELECT * FROM coupon_code_type WHERE ID =";
        return loadAllCouponCodeType();
    }
    public static List<CouponCodeType> loadCouponCodeTypeFormSql(String sql) {
        List<CouponCodeType> list = new ArrayList<CouponCodeType>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    list.add(getCouponCodeType(resultSet));
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
    public static CouponCodeType loadCouponCodeTypeBy(int id){
        CouponCodeType couponCodeType = null;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from coupon_code_type where id=?");
            pe.setInt(1,id);
            synchronized (pe){
                ResultSet resultSet = pe.executeQuery();
                if(resultSet.next())
                    couponCodeType=getCouponCodeType(resultSet);
                resultSet.close();
            }
            pe.close();
            return couponCodeType;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return couponCodeType;
    }
    public static CouponCodeType getCouponCodeType(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        CouponCodeType couponcodetype = new CouponCodeType();
        try {
            couponcodetype.setId(resultSet.getInt(1));
            couponcodetype.setName(resultSet.getString(2));
            couponcodetype.setAvatar(resultSet.getString(3));
            return couponcodetype;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(getLinkImageFromCouponType(3));
    }

    public static boolean insertCouponCodeType(String name, String img) {
        int insert = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("insert into coupon_code_type(name,avarta) values(?,?)");
            pe.setString(1,name);
            pe.setString(2,img);
            synchronized (pe){
                insert = pe.executeUpdate();
            }
            pe.close();
            return insert==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean updateCouponCodeType(int id,String name, String img) {
        int update = 0;
        String sql = "update coupon_code_type set name =? ";
        if (img == null) {
            sql += " where id = ? ";
        } else sql += ", img=? where id = ? ";
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setString(1,name);
            if (img == null)
                pe.setInt(2, id);
            else {
                pe.setString(2, img);
                pe.setInt(3, id);
            }
            synchronized (pe){
                update = pe.executeUpdate();
            }
            pe.close();
            return update==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
