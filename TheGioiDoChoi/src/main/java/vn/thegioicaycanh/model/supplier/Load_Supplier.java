package vn.thegioicaycanh.model.supplier;

import vn.thegioicaycanh.model.blog.Blog;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Load_Supplier {
    public static List<Supplier> loadSupplier_view(){
        List<Supplier> supplierList = new ArrayList<>();
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery("SELECT * FROM supplier");
                while (resultSet.next()){
                    Supplier supplier = new Supplier();
                    supplier.setId(resultSet.getInt(1));
                    supplier.setLogo(resultSet.getString(2));
                    supplier.setName(resultSet.getString(3));
                    supplier.setAddress(resultSet.getString(4));
                    supplier.setPhone(resultSet.getString(5));
                    supplier.setEmail(resultSet.getString(6));
                    supplierList.add(supplier);
                }
                resultSet.close();
            }
            statement.close();
            return supplierList;
        } catch(SQLException throwables){
            throwables.printStackTrace();
        }
        return supplierList;
    }

    public static int sumOfSupplier(String sql){
        int sum = 0;
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet rs = statement.executeQuery(sql);
                if(rs.next()){
                    sum = rs.getInt(1);
                }
                rs.close();
            }
            statement.close();
            return sum;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    private static void peSetAttribute(PreparedStatement pe, String logo,String name, String address, int phone, String email) {
        try {
            pe.setString(1, logo);
            pe.setString(2, name);
            pe.setString(3, address);
            pe.setInt(4, phone);
            pe.setString(5, email);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static boolean insertSupplier(String name, String address, int phone, String email) {
        String sql = "insert into supplier(logo,name,address,phone,email) values(?,?,?,?,?)";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setString(1,"imgs/default");
            pe.setString(2, name);
            pe.setString(3, address);
            pe.setInt(4, phone);
            pe.setString(5, email);
            System.out.println(pe.toString());
            synchronized (pe) {
                update = pe.executeUpdate();
            }
            pe.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean updateSupplier(int id,String name, String address, int phone, String email) {
        String sql = "update supplier set name=?,address=?,phone=?,email=? where id= ?";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setString(1, name);
            pe.setString(2, address);
            pe.setInt(3, phone);
            pe.setString(4, email);
            pe.setInt(5,id);
            System.out.println(pe.toString());
            synchronized (pe) {
                update = pe.executeUpdate();
            }
            pe.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static Supplier loadSupplier(int id){
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from supplier where id=?");
            pe.setInt(1,id);
            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                Supplier supplier = null;
                if(rs.next()) {
                    supplier = getSupplier(rs);
                }
                rs.close();
                pe.close();
                return supplier;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static Supplier getSupplier(ResultSet resultSet){
        if(resultSet == null)
            return null;
        Supplier supplier = new Supplier();
        try {
            supplier.setId(resultSet.getInt(1));
            supplier.setLogo(resultSet.getString(2));
            supplier.setName(resultSet.getString(3));
            supplier.setAddress(resultSet.getString(4));
            supplier.setPhone(resultSet.getString(5));
            supplier.setEmail(resultSet.getString(6));
            return supplier;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  null;

    }
    public static void main(String[] args) {
//        for(Supplier s: loadSupplier_view()){
//            System.out.println(s.getName());
//        }
//        System.out.println(sumOfSupplier("select count(id) from supplier"));
        System.out.println(insertSupplier("Trần Thị Lan","152/63 Lý Chính Thắng P.7 Q.3",87979,"yuknp22@gmail.com"));
//        System.out.println(updateSupplier(302,"Trần Thị Lan","152/63 Lý Chính Thắng P.7 Q.3",8797955,"yuknp22@gmail.com"));
//        System.out.println(loadSupplier(302).getAddress());
    }
}
