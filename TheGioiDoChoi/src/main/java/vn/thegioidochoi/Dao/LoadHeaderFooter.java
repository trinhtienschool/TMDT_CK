package vn.thegioidochoi.Dao;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.header_footer.Address;
import vn.thegioidochoi.model.header_footer.Category;
import vn.thegioidochoi.model.header_footer.Header;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoadHeaderFooter {
    public static List<Category>  loadCategories() {
        List<Category> categories = new ArrayList<>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet rs = statement.executeQuery("SELECT * from categories");
                while (rs.next()) {
                    Category c = new Category();
                    c.setId(rs.getInt(1));
                    c.setName(rs.getString(2));
                    c.setActive(rs.getByte(3) == 1);
                    c.setSlug(rs.getString(4));
                    c.setMaster_id(rs.getInt(5));
                    categories.add(c);
                }
                rs.close();
            }
            statement.close();

            List<Category> removeCategories = new ArrayList<Category>();
            for(Category cate: categories){
                if(cate.getId() == cate.getMaster_id()){
                    for(int i=0;i<categories.size();i++){
                        Category sub_cate = categories.get(i);
                        if(sub_cate.getMaster_id() == cate.getId() && sub_cate.getMaster_id() !=sub_cate.getId()){
                            sub_cate.setParent(2);
                            cate.getSubcategories().add(sub_cate);
                            removeCategories.add(sub_cate);
                        }
                    }
                    if(cate.getSubcategories().isEmpty()) cate.setParent(0);
                    else cate.setParent(1);
                }
            }
            for(Category category: removeCategories){
                categories.remove(category);
            }
//            System.out.println("Da ra categoriessssssssssssssssssssss");
            return categories;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;

    }

    public static Header loadHeader() {
        Header header = new Header();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet rs = statement.executeQuery("select * from header");
                if (rs.next()) {
                    header.setName(rs.getString(2));
                    header.setLogo(rs.getString(3));
                    header.setShortcut(rs.getString(4));
                }
                rs.close();
            }
            statement.close();
            return header;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static List<Address> loadAdress(){
        List<Address> adds = new ArrayList<Address>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {

                ResultSet resultSet = statement.executeQuery("Select * from address");
                while (resultSet.next()) {
                    String address = resultSet.getString(2);
                    long phone = resultSet.getLong(3);
                    String email = resultSet.getString(4);
                    String time = resultSet.getString(5);
                    String map = resultSet.getString(6);
                    adds.add(new Address(address, phone, email, time, map));
                }
                resultSet.close();
            }
            statement.close();
            return adds;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static boolean update(String name, String logo, String shortcut) {
        int updated=0;
        String sql = "update header set name =?  ";
        if(logo!=null) sql +=", logo=? ";
        if(shortcut!=null) sql +=" , shortcut=? ";
        sql+=" where id=1 ";
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setString(1,name);
            boolean isLogo =false;
            if(logo!=null) {
                pe.setString(2,logo);
                isLogo=true;
            }
            if(shortcut!=null){
                if(isLogo) pe.setString(3,shortcut);
                else pe.setString(2,shortcut);
            }
            synchronized (pe){
                updated=pe.executeUpdate();
            }
            pe.close();
            return updated==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public static boolean updateAddress(String type, String address, String phone, String email, String timeOpen, String mapAddress) {
        int updated = 0;
        String sql = "update address set address=?,phone=?,email=?,time_open=?,map=? ";
        if(type.equalsIgnoreCase("main-address")) sql+=" where id=1";
        if(type.equalsIgnoreCase("sub-address")) sql+=" where id=2";
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setString(1,address);
            pe.setString(2,phone);
            pe.setString(3,email);
            pe.setString(4,timeOpen);
            pe.setString(5,mapAddress);
            synchronized (pe){
                updated=pe.executeUpdate();
            }
            pe.close();
            return updated==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;

    }
}
