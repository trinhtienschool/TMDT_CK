package vn.thegioidochoi.model.supplier;

import vn.thegioidochoi.model.database.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.order.Load_Order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class Load_Supplier {
    public static String[] getYear_Quarter_Chart(int supplier_id){
        String sql = "select concat('Quý ' ,QUARTER(o.date_created)), SUM((o.total_price-o.shipment)*(100-o.commission_rate)/100) from `order` o join supplier s on o.supplier_id = s.id where supplier_id=? and Year(o.date_created)= Year(CURDATE())\n" +
                "GROUP BY QUARTER(o.date_created)";
        return convertStringArray(getMap(sql, supplier_id));
    }
    public static String[] getYear_Month_Chart(int supplier_id){
        String sql = "select concat('Tháng ', MONTH(o.date_created)), SUM((o.total_price-o.shipment)*(100-o.commission_rate)/100) from `order` o join supplier s on o.supplier_id = s.id where supplier_id=? and YEar(o.date_created) = year(CurDate())\n" +
                "GROUP BY MONTH(o.date_created)";
        return convertStringArray(getMap(sql, supplier_id));
    }
    public static String[] getMonthChart(int supplier_id){
        String sql = "select concat('Tuần ', WEEK(o.date_created)), SUM((o.total_price-o.shipment)*(100-o.commission_rate)/100) from `order` o join supplier s on o.supplier_id = s.id where supplier_id=? and Month(o.date_created) = Month(CurDate())\n" +
                "GROUP BY WEEK(o.date_created)";
        return convertStringArray(getMap(sql, supplier_id));
    }
    public static String[] getQuarterChart(int supplier_id){
        String sql = "select concat('Tháng ', MONTH(o.date_created)), SUM((o.total_price-o.shipment)*(100-o.commission_rate)/100) from `order` o join supplier s on o.supplier_id = s.id where supplier_id=? and QUARTER(o.date_created) = QUARTER(CurDate())\n" +
                "GROUP BY MONTH(o.date_created)";
        return convertStringArray(getMap(sql, supplier_id));
    }
    public static String[] getWeekChart(int supplier_id){
        String sql = "select DATE(o.date_created), SUM((o.total_price-o.shipment)*(100-o.commission_rate)/100) from `order` o join supplier s on o.supplier_id = s.id where supplier_id=? and week(o.date_created) = week(CurDate())\n" +
                "GROUP BY date(o.date_created)";
        return convertStringArray(getMap(sql, supplier_id));
    }
    public static String[] getMonthFromTo(int supplier_id,String from,String to){
        String sql = "select concat('Tháng ', MONTH(o.date_created)), SUM((o.total_price-o.shipment)*(100-o.commission_rate)/100) from `order` o join supplier s on o.supplier_id = s.id where supplier_id=? and date_created BETWEEN '"+from+"' and '"+to+"'\n" +
                "GROUP BY MONTH(o.date_created)";
        return convertStringArray(getMap(sql, supplier_id));
    }
    public static String[] getCircleCategoryChart(int supplier_id, String month){
        String sql = "select c.name,sum(op.total_price) from `order` o join order_product op on o.id = op.order_id join product p on op.pro_id=p.id join categories c on c.id = p.category_id\n" +
                "where o.supplier_id = ? and MONTH(o.date_created) = "+month+" and year(o.date_created) = year(curdate())\n" +
                "group by c.name,c.id";
        return convertStringArray(getMap(sql, supplier_id));
    }
    public static String[] convertStringArray(Map<String, Long>map){
        String[] result = new String[2];
        String s = "[";
        for(String key: map.keySet()){
            s+=" '"+key+"',";
        }
        s = s.substring(0,s.length()-1);
        s+=" ]";
        result[0] = s;
        result[1] = map.values().toString();
        return result;
    }
    public static Map<String, Long> getMap(String sql, int supplier_id) {
        Map<String, Long> map = new TreeMap<>();
        try {
            PreparedStatement statement = DBCPDataSource.getConnection().prepareStatement(sql);
            synchronized (statement) {
                statement.setInt(1, supplier_id);
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    map.put(resultSet.getString(1), Math.round(resultSet.getDouble(2)));
                }
                resultSet.close();
            }
            statement.close();
            return map;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static List<Supplier> loadSupplier_view(){
        List<Supplier> supplierList = new ArrayList<>();
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery("SELECT * FROM supplier WHERE active =1 OR active=0");
                while (resultSet.next()){
                    Supplier supplier = new Supplier();
                    supplier.setId(resultSet.getInt(1));
                    supplier.setLogo(resultSet.getString(2));
                    supplier.setAddress(resultSet.getString(3));
                    supplier.setPhone(resultSet.getString(4));
                    supplier.setEmail(resultSet.getString(5));
                    supplier.setUser_id(resultSet.getInt(8));
                    supplier.setCompany_name(resultSet.getString(9));
                    supplier.setDate(resultSet.getDate(11));
                    supplier.setName(resultSet.getString(13));
                    supplier.setChecked(resultSet.getBoolean(14));

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

    public static int sumOf(String sql){
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
    public static boolean insertSupplier(Supplier supplier){
        String sql = "insert into supplier(logo, address, email, phone, description, commission_rate, user_id, company_name, website, slug, name) \n" +
                "value(?,?,?,?,?,?,?,?,?,?,?)";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setString(1,supplier.getLogo());
            pe.setString(2, supplier.getAddress());
            pe.setString(3, supplier.getEmail());
            pe.setLong(4, Long.parseLong(supplier.getPhone()));
            pe.setString(5, supplier.getDescription());
            pe.setInt(6, supplier.getCommission_rate());
            pe.setInt(7, supplier.getUser_id());
            pe.setString(8, supplier.getCompany_name());
            pe.setString(9, supplier.getWebsite());
            pe.setString(10, supplier.getSlug());
            pe.setString(11, supplier.getName());

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
    public static boolean updateSupplierSlug(int id, String slug) {
        String sql = "update supplier set slug=? where id= ?";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setString(1,slug);
            pe.setInt(2, id);

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
    public static boolean updateSupplierName(int id, String name) {
        String sql = "update supplier set name=? where id= ?";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setString(1,name);
            pe.setInt(2, id);

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
    public static boolean updateSupplierActiveById( int active,int supplier_id){
        String sql = "UPDATE supplier SET active = ? WHERE id = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,active);
            preparedStatement.setInt(2,supplier_id);
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
    public static List<Supplier> loadBestSupplier(int nos){
        List<Supplier>suppliers = new ArrayList<Supplier>();
        String sql = "select r.supplier_id,s.name, s.logo, s.company_name,s.slug, sum(r.real_revenue) as total\n" +
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
                    supplier.setName(resultSet.getString(2));
                    supplier.setLogo(resultSet.getString(3));
                    supplier.setCompany_name(resultSet.getString(4));
                    supplier.setSlug(resultSet.getString(5));
                    supplier.setRevenue(resultSet.getDouble(6));

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
    public static List<Supplier> loadTopSupplierWithOderTable(int nos){
        List<Supplier>suppliers = new ArrayList<Supplier>();
        String sql = "select r.supplier_id, s.name, s.logo, s.company_name,s.slug, sum(r.total_price*(100-r.commission_rate)/100) as total \n" +
                "from `order` r JOIN supplier s on r.supplier_id = s.id where month(r.date_created) = month(curdate() - interval 1 month) and year(r.date_created)= year(curdate()) GROUP BY r.supplier_id, s.logo, s.company_name\n" +
                "ORDER BY total DESC\n" +
                "LIMIT "+nos;
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()){
                    Supplier supplier = new Supplier();
                    supplier.setId(resultSet.getInt(1));
                    supplier.setName(resultSet.getString(2));
                    supplier.setLogo(resultSet.getString(3));
                    supplier.setCompany_name(resultSet.getString(4));
                    supplier.setSlug(resultSet.getString(5));
                    supplier.setRevenue(resultSet.getDouble(6));

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
    public static int loadSupplierIdWithUserId(int user_id){
        String sql = "select id from supplier where user_id = ?";
        int supplier_id = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,user_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()){
                    supplier_id = resultSet.getInt(1);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return supplier_id;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return 0;
    }
    public static Supplier loadSupplier(String slug){
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from supplier where slug=?");
            pe.setString(1,slug);
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
            supplier.setSlug(resultSet.getString(12));
            supplier.setName(resultSet.getString(13));
            return supplier;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  null;

    }
    public static List<Supplier> loadSupplierByKeySearch(String key){
        List<Supplier>suppliers = new ArrayList<Supplier>();
        String sql = "select DISTINCT s.`name`, s.slug, count(p.id) from product p join supplier s on p.supplier_id = s.id where p.`name` LIKE '%"+key+"%' GROUP BY s.id ORDER BY count(p.id) desc";
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    Supplier supplier = new Supplier();
                    supplier.setName(resultSet.getString(1));
                    supplier.setSlug(resultSet.getString(2));
                    supplier.setTotal_product(resultSet.getInt(3));
                    suppliers.add(supplier);
                }
                resultSet.close();
            }
            statement.close();
            return suppliers;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static Supplier loadSupplierById(int id){
        Supplier supplier = new Supplier();
        String sql = "SELECT s.id, s.name, s.logo, s.description, COUNT(p.supplier_id) AS total_product\n" +
                "FROM supplier s JOIN product p ON s.id = p.supplier_id\n" +
                "WHERE supplier_id = " + id;
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    supplier.setName(resultSet.getString(2));
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
    public static Supplier loadSupplierSettings(int id){
        Supplier supplier = new Supplier();
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("SELECT u.`name`, s.company_name, s.website, u.phone, s.address, s.logo, s.description, s.slug FROM supplier s JOIN `user` u ON s.id=u.id WHERE s.id=?");
            pe.setInt(1,id);
            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                if(rs.next()) {
                   supplier.setName(rs.getString(1));
                   supplier.setCompany_name(rs.getString(2));
                   supplier.setWebsite(rs.getString(3));
                   supplier.setPhone(rs.getString(4));
                   supplier.setAddress(rs.getString(5));
                   supplier.setLogo(rs.getString(6));
                   supplier.setDescription(rs.getString(7));
                   supplier.setSlug(rs.getString(8));
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
    public static boolean updateSupplierSetting(String company, String website, String phone, String city, String district, String ward, String detail, String description, String logo, int id){
        String sql = "Update supplier set company_name='" + company + "', website='" + website + "', phone='" + phone + "', address='" + detail + ", " + ward + ", " + district + ", " + city + "', description='" + description + "', logo='" + logo + "' where id=" + id;
        return excuteSql(sql);
    }
    public static boolean excuteSql(String sql){
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
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
        List<Supplier> suppliers = loadTopSupplierWithOderTable(3);
//        for()
        for(Supplier s: suppliers){
            System.out.println(s);
        }
//        System.out.println(sumOfSupplier("select count(id) from supplier"));
//        System.out.println(insertSupplier("Trần Thị Lan","152/63 Lý Chính Thắng P.7 Q.3",87979,"yuknp22@gmail.com"));
//        System.out.println(updateSupplier(302,"Trần Thị Lan","152/63 Lý Chính Thắng P.7 Q.3",8797955,"yuknp22@gmail.com"));
//        System.out.println(loadSupplier(302).getAddress());
//        System.out.println(loadTopSupplierWithOderTable(3));
    }

}
