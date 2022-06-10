package vn.thegioidochoi.model.supplier;

import vn.thegioidochoi.model.database.connection_pool.DBCPDataSource;

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
                    supplier.setAddress(resultSet.getString(3));
                    supplier.setPhone(resultSet.getString(4));
                    supplier.setEmail(resultSet.getString(5));
                    supplier.setCompany_name(resultSet.getString(9));

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
    public static List<Supplier> loadBestSupplier(int nos){
        List<Supplier>suppliers = new ArrayList<Supplier>();
        String sql = "select r.supplier_id, s.logo, s.company_name, sum(r.real_revenue) as total\n" +
                "from revenue_by_products r JOIN supplier s on r.supplier_id = s.id\n" +
                "where MONTH(r.date)=11 and YEAR(r.date)=2021\n" +
                "GROUP BY r.supplier_id, s.logo, s.company_name\n" +
                "ORDER BY total DESC\n" +
                "LIMIT "+nos;
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()){
                    Supplier supplier = new Supplier();
                    supplier.setId(resultSet.getInt(1));
                    supplier.setLogo(resultSet.getString(2));
                    supplier.setCompany_name(resultSet.getString(3));
                    supplier.setRevenue(resultSet.getDouble(4));

                    suppliers.add(supplier);
                }
                resultSet.close();
            }
            statement.close();
            return suppliers;
        } catch(SQLException throwables){
            throwables.printStackTrace();
        }
        return null;
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
            supplier.setAddress(resultSet.getString(3));
            supplier.setPhone(resultSet.getString(4));
            supplier.setEmail(resultSet.getString(5));
            supplier.setDescription(resultSet.getString(6));
            supplier.setCommission_rate(resultSet.getInt(7));
            supplier.setUser_id(resultSet.getInt(8));
            supplier.setCompany_name(resultSet.getString(9));
            supplier.setWebsite(resultSet.getString(10));
            supplier.setDate(resultSet.getDate(11));
            return supplier;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  null;

    }
    public static Supplier loadSupplierById(int id){
        Supplier supplier = new Supplier();
        String sql = "SELECT s.id, s.company_name, s.logo, s.description, COUNT(p.supplier_id) AS total_product\n" +
                "FROM supplier s JOIN product p ON s.id = p.supplier_id\n" +
                "WHERE supplier_id = " + id;
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    supplier.setCompany_name(resultSet.getString(2));
                    supplier.setLogo(resultSet.getString(3));
                    supplier.setDescription(resultSet.getString(4));
                    supplier.setTotal_product(resultSet.getInt(5));
                }
                resultSet.close();
            }
            statement.close();
            return supplier;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
//        for(Supplier s: loadSupplier_view()){
//            System.out.println(s.getName());
//        }
//        System.out.println(sumOfSupplier("select count(id) from supplier"));
//        System.out.println(insertSupplier("Trần Thị Lan","152/63 Lý Chính Thắng P.7 Q.3",87979,"yuknp22@gmail.com"));
//        System.out.println(updateSupplier(302,"Trần Thị Lan","152/63 Lý Chính Thắng P.7 Q.3",8797955,"yuknp22@gmail.com"));
//        System.out.println(loadSupplier(302).getAddress());
        System.out.println(loadSupplier(1));
    }
}
