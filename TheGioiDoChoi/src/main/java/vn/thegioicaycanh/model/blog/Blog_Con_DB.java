package vn.thegioicaycanh.model.blog;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Blog_Con_DB {
    public static Blog loadBlog(int id){
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from blog where id=?");
            pe.setInt(1,id);
            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                Blog blog = null;
                if(rs.next()) {
                    blog = getBlog(rs);
                }
                rs.close();
                pe.close();
                return blog;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static Blog getBlog(ResultSet rs){
        if(rs == null)
            return null;
        Blog blog = new Blog();
        try {
                blog.setId(rs.getInt(1));
                blog.setName(rs.getString(2));
                blog.setDescription(rs.getString(3));
                blog.setContent(rs.getString(4));
                blog.setActive(rs.getByte(5)==1? true : false);
                blog.setAvatar(rs.getString(6));
                blog.setDate_created(rs.getDate(7));
                blog.setSlug(rs.getString(8));
                blog.setAdmin_id(rs.getInt(9));
                blog.setNumOfRead(rs.getInt(10));
                return blog;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
       return  null;

    }
    public static List<Blog> mostReadBlogs(int num){
        List<Blog>blogList =new ArrayList<vn.thegioicaycanh.model.blog.Blog>();
        try {
            PreparedStatement pe = DBCPDataSource.getConnection().prepareStatement("select  * from blog order by numOfRead desc limit ?");
            pe.setInt(1,num);
            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                while(rs.next()){
                    blogList.add(getBlog(rs));
                }
                rs.close();
            }
            pe.close();
            return blogList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static List<Blog>loadNewBlogs(int num){
        List<Blog>blogList =new ArrayList<Blog>();
        try {
            PreparedStatement pe = DBCPDataSource.getConnection().prepareStatement("select  * from blog order by date_created desc limit ?");
            pe.setInt(1,num);

            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                while(rs.next()){
                    blogList.add(getBlog(rs));
                }
                rs.close();
            }
            pe.close();
            return blogList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static List<Blog>loadRandomBlog(int num){
        List<Blog>blogList =new ArrayList<Blog>();
        try {
            PreparedStatement pe = DBCPDataSource.getConnection().prepareStatement(" select * from blog order by Rand() limit ?");
            pe.setInt(1,num);

            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                while(rs.next()){
                    blogList.add(getBlog(rs));
                }
                rs.close();
            }
            pe.close();
            return blogList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static int sumOfBlogs(){
        int sum = 0;
        try {
            Statement statement = DBCPDataSource.getStatement();


            synchronized (statement){
                ResultSet rs = statement.executeQuery("select count(*) from blog");
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

    public static List<Blog> loadLimitBlog(int start,int num){
        List<Blog>blogList =new ArrayList<Blog>();
        try {
            PreparedStatement pe = DBCPDataSource.getConnection().prepareStatement(" select * from blog limit ?,?");
            pe.setInt(1,start);
            pe.setInt(2,num);

            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                while(rs.next()){
                    blogList.add(getBlog(rs));
                }
                rs.close();
            }
            pe.close();
            return blogList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static int getCount() {
        List<Blog> blogList = new ArrayList<Blog>();
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from blog");
            synchronized (pe) {
                ResultSet rs = pe.executeQuery();
                while (rs.next()) {
                    blogList.add(getBlog(rs));
                }
                rs.close();
            }
            pe.close();
            return blogList.size();
        }catch(SQLException throwables){
            throwables.printStackTrace();
        }
        return 0;
    }
    public static List<Blog> loadBlogFormSql(String sql){
        List<Blog>list = new ArrayList<Blog>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getBlog(resultSet));
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
    public static List<Blog> loadBlog_view(){
        List<Blog> blogList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT id, `name`, date_created, active FROM blog WHERE active=?");
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    Blog blog = new Blog();
                    blog.setId(resultSet.getInt(1));
                    blog.setName(resultSet.getString(2));
                    blog.setDate_created(resultSet.getDate(3));
                    blog.setActive(resultSet.getBoolean(4));
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return blogList;
    }

    public static List<Blog> loadBlogBy(String name, String from_date, String to_date) {
        List<Blog> blogs = new ArrayList<Blog>();

        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from blog where name like ? and date_created between ? and ?");

            pe.setString(1, name);
            pe.setString(2, from_date);
            pe.setString(3, to_date);
//            System.out.println((JDBC4PreparedStatement)pe.asSql());
            synchronized (pe) {
                ResultSet resultSet = pe.executeQuery();
                System.out.println(resultSet.getStatement().toString());
                while (resultSet.next()) blogs.add(getBlog(resultSet));
                resultSet.close();
            }
            pe.close();
            return blogs;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return blogs;
    }

    public static boolean insertBlog(String name, String description, String content, int active, String slug, String date_created, int admin_id, int numOfRead,String img) {
        String sql = "insert into blog(name,description,content,active,slug,date_created,admin_id,numOfRead,avatar) value(?,?,?,?,?,?,?,?,?)";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);

            peSetAttribute(pe, name,description, content,
                   active,slug);
            pe.setString(6, date_created);
            pe.setInt(7, admin_id);
            pe.setInt(8, numOfRead);
            pe.setString(9,img);
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

    private static void peSetAttribute(PreparedStatement pe, String name, String description, String content, int active, String slug) {
        try {
            pe.setString(1, name);
            pe.setString(2, description);
            pe.setString(3, content);
            pe.setInt(4, active);
            pe.setString(5, slug);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean updateBlog(int id, String name, String description, String content, int active, String slug, String img) {
        String sql = "update blog set name = ?,description=?,content=?,active=?,slug=? ";
        if (img == null) {
            sql += " where id = ? ";
        } else sql += " , avatar=? where id = ? ";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            peSetAttribute(pe, name,description,content,active,slug);

            if (img == null)
                pe.setInt(6, id);
            else {
                pe.setString(6, img);
                pe.setInt(7, id);
            }
            System.out.println("Day la query update: " + pe.toString());
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
}
