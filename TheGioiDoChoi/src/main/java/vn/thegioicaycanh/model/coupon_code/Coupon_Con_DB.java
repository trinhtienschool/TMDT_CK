package vn.thegioicaycanh.model.coupon_code;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Coupon_Con_DB {


    public static List<CouponCode> loadCouponCodeByCoponCodeTypeID(int id) {
        String sql = "SELECT * from coupon_code where coupon_code_type_id =" + id;
        return loadCouponCodeFormSql(sql);
    }

    public static List<CouponCode> loadCouponCodeLimit(int start, int num) {
        String sql = "SELECT * from coupon_code where coupon_code_type_id limit" + start + "," + num;
        return loadCouponCodeFormSql(sql);
    }

    public static String getImageLink(int id) {
        return Coupon_Con_DB.getImageLink(id);
    }

    public static List<CouponCode> loadAllCouponCode() {
        String sql = "SELECT * from coupon_code";
        return loadCouponCodeFormSql(sql);
    }

    public static List<CouponCode> loadCouponCodeFormSql(String sql) {
        List<CouponCode> list = new ArrayList<CouponCode>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    list.add(getCouponCode(resultSet));
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

    // Load coupon code by user_id
    public static List<CouponCode> loadCouponCodeByUser(int user_id) {
        String sql = "SELECT * FROM coupon_code\n" +
                "WHERE id IN (SELECT uc.coupon_code_id FROM user_code uc JOIN `user` u ON uc.user_id=u.id WHERE uc.user_id = " + user_id + ")";
        return loadCouponCodeFormSql(sql);
    }

    public static CouponCode getCouponCode(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        CouponCode couponcode = new CouponCode();
        try {
            couponcode.setId(resultSet.getInt(1));
            couponcode.setName(resultSet.getString(2));
            couponcode.setCoupon_code_type_id(resultSet.getInt(3));
            couponcode.setPercent(resultSet.getInt(4));
            couponcode.setDescription(resultSet.getString(5));
            couponcode.setCode(resultSet.getString(6));
            couponcode.setDate_end(resultSet.getDate(7));
            couponcode.setDate_start(resultSet.getDate(8));
            return couponcode;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static List<CouponCode> loadCouponCodeByUserId(int user_id) {
        List<CouponCode> list = new ArrayList<>();
        String sql = "SELECT c.name, DATEDIFF(c.date_end,CURRENT_DATE), ct.`name`,c.code,c.percent " +
                "FROM user u INNER JOIN user_code uc ON u.id = uc.user_id " +
                "INNER JOIN coupon_code c ON uc.coupon_code_id = c.id " +
                "INNER JOIN coupon_code_type ct ON ct.id = c.coupon_code_type_id " +
                "WHERE u.id = ?";
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,user_id);
            synchronized (preparedStatement) {
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    list.add(getCouponCodeType(resultSet));
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public static CouponCode getCouponCodeType(ResultSet resultSet) {
        CouponCode couponCode = new CouponCode();
        try {
            couponCode.setName(resultSet.getString(1));
            couponCode.setDate_number(resultSet.getInt(2));
            couponCode.setCoupon_code_type_name(resultSet.getString(3));
            couponCode.setCode(resultSet.getString(4));
            couponCode.setPercent(resultSet.getInt(5));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return couponCode;
    }

    public static List<CouponCode> loadCouponCode_view(){
        List<CouponCode> couponCodes = new ArrayList<>();
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery("SELECT cp.id, cp.`name`, ct.`name`, cp.percent, cp.date_end FROM coupon_code cp JOIN coupon_code_type ct ON cp.coupon_code_type_id = ct.id");
                while(resultSet.next()){
                    CouponCode couponCode = new CouponCode();
                    couponCode.setId(resultSet.getInt(1));
                    couponCode.setName(resultSet.getString(2));
                    couponCode.setCoupon_code_type_name(resultSet.getString(3));
                    couponCode.setPercent(resultSet.getInt(4));
                    couponCode.setDate_end(resultSet.getDate(5));
                    couponCodes.add(couponCode);
                }
                resultSet.close();
            }
            statement.close();
            return couponCodes;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return couponCodes;
    }
    // Load ma giam gia bang ID
    public static CouponCode loadCouponCodeById(int coupon_id){
        CouponCode couponCode = new CouponCode();
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT * FROM coupon_code WHERE id = ?");
            preparedStatement.setInt(1,coupon_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    couponCode.setId(resultSet.getInt(1));
                    couponCode.setName(resultSet.getString(2));
                    couponCode.setCoupon_code_type_id(resultSet.getInt(3));
                    couponCode.setPercent(resultSet.getInt(4));
                    couponCode.setDescription(resultSet.getString(5));
                    couponCode.setCode(resultSet.getString(6));
                    couponCode.setDate_start(resultSet.getDate(7));
                    couponCode.setDate_end(resultSet.getDate(8));
                }
                resultSet.close();
            }
            preparedStatement.close();
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return couponCode;
    }
    // Them ma giam gia o trang admin
    public static boolean insertCouponCode(String name,int coupon_code_type_id, int percent, String description, String code, String date_start, String date_end){
        String sql = "INSERT INTO coupon_code(`name`,coupon_code_type_id, percent, description, code, date_start, date_end) VALUES (?,?,?,?,?,?,?)";
        int update=0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, coupon_code_type_id);
            preparedStatement.setInt(3, percent);
            preparedStatement.setString(4,description);
            preparedStatement.setString(5, code);
            preparedStatement.setString(6,date_start);
            preparedStatement.setString(7, date_end);
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
    // Sua ma giam gia
    public static boolean updateCouponCode(int id, String name, int coupon_code_type_id, int percent, String description, String code, String date_start, String date_end){
        String sql = "UPDATE coupon_code SET name = ?, coupon_code_type_id = ?, percent = ?, description = ?, code = ?, date_start = ?, date_end = ? WHERE id = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, coupon_code_type_id);
            preparedStatement.setInt(3, percent);
            preparedStatement.setString(4,description);
            preparedStatement.setString(5, code);
            preparedStatement.setString(6,date_start);
            preparedStatement.setString(7, date_end);
            preparedStatement.setInt(8, id);
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
        System.out.println(loadCouponCodeById(1));
    }

    public static int[] checkSubMoney(int user_id, String code,int coupon_code_type_id) {
        int[] checkCouponcode = null ;//0:percent,1:coupon_code_id;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select c.percent,c.id from coupon_code c join user_code u on  c.id = u.coupon_code_id where c.CODE=? and c.coupon_code_type_id=? and u.user_id =?");
            pe.setString(1,code);
            pe.setInt(2,coupon_code_type_id);
            pe.setInt(3,user_id);
            System.out.println("Cau query: "+pe.toString());
            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                if(rs.next()) {
                    checkCouponcode=new int[2];
                    checkCouponcode[0] = rs.getInt(1);
                    checkCouponcode[1] = rs.getInt(2);
                }
            }
            pe.close();
            return checkCouponcode;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    return checkCouponcode;
    }

    public static void deleteCouponCode(int user_id, int coupon_code_id) {
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("delete from user_code where user_id=? and coupon_code_id=?");
            pe.setInt(1,user_id);
            pe.setInt(2,coupon_code_id);
            synchronized (pe){
                pe.executeUpdate();
            }
            pe.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
