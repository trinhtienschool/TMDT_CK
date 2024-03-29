
package vn.thegioidochoi.Dao;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.user.EmailConfirm;
import vn.thegioidochoi.model.user.User;
import vn.thegioidochoi.model.util.Util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LoadUser {

    public static boolean saveUserLoginByFb_GG(String email,String name,String id){
        boolean isSaved = false;
        String sql = "insert into user(name,email,avatar,`password`,active,role_id,date_created) values(?,?,'imgs/user/default_avatar.png',?,1,1,CURRENT_DATE);";
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,email);
            preparedStatement.setLong(3,Util.hashPass("20220521",email,id));
            synchronized (preparedStatement){
                int row = preparedStatement.executeUpdate();
                if(row == 1)
                    isSaved=true;
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isSaved;
    }
    public static EmailConfirm loadEmailConfirm(String email){
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("select * from email_confirm where email=?");
            preparedStatement.setString(1,email);
            EmailConfirm emailConfirm = null;
            synchronized (preparedStatement){
                ResultSet rs = preparedStatement.executeQuery();
                if(rs.next()){
                    emailConfirm = new EmailConfirm();
                    emailConfirm.setEmail(rs.getString(1));
                    emailConfirm.setUser_name(rs.getString(2));
                    emailConfirm.setCode(rs.getInt(3));
                    emailConfirm.setTime_created(rs.getLong(4));
                }
                rs.close();
            }
            preparedStatement.close();
            return emailConfirm;
        } catch (SQLException throwables) {

            throwables.printStackTrace();

        }
        return null;
    }
    public static boolean updateActiveEmail(String email){
           String sql = "update user set `active`=? where email=?";
       boolean isSaved = false;
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,1);
            preparedStatement.setString(2,email);
            synchronized (preparedStatement){
                int row = preparedStatement.executeUpdate();
                if(row == 1)
                    isSaved=true;
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isSaved;
    }
    public static boolean saveEmailConfirm(String email,String name,int code){
        boolean isSaved = false;
        String sql="";
        if(loadEmailConfirm(email)==null) {
             sql = "insert into email_confirm(`user_name`,code,time_created,email) values(?,?,?,?)";
        }else{
             sql = "update email_confirm set `user_name`=?,code=?,time_created=? where email=?";
        }
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
//            preparedStatement.setInt(1,user_id);
            preparedStatement.setString(1,name);
            preparedStatement.setInt(2,code);
            preparedStatement.setLong(3,System.currentTimeMillis());
            preparedStatement.setString(4,email);
//            preparedStatement.setLong(3,Util.hashPass("20220521",email,id));
            synchronized (preparedStatement){
                int row = preparedStatement.executeUpdate();
                if(row == 1)
                    isSaved=true;
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isSaved;
    }
    public static User loadAUserByEmail(String email){
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("select * from user where email=?");
            preparedStatement.setString(1,email);
            User user = null;
            synchronized (preparedStatement){
                ResultSet rs = preparedStatement.executeQuery();
                if(rs.next()){
                    user = getUser(rs);
                }
                rs.close();
            }
            preparedStatement.close();
            return user;
        } catch (SQLException throwables) {

            throwables.printStackTrace();

        }
        return null;
    }
    public static User loadUserById(int id){
        List<User>list = loadUserFromSQL("select * from user where id="+id);
        if(list !=null){
            return list.get(0);
        }
        return null;

    }
    public static List<User>loadUserFromSQL(String sql){
        List<User>list = new ArrayList<User>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet rs = statement.executeQuery(sql);
                while(rs.next()){
                    list.add(getUser(rs));
                }
                rs.close();
            }
            statement.close();
            return list;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
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

//   ,
    public static boolean updateUser(String name, String birthday, int phone,String email,String city,String distric,String ward, String detailaddress,int user_id){
        String sql= "Update user set address = '"+detailaddress+","+ward+","+distric+","+city+"', name ='"+name+"', phone= "+phone+",email='"+email+"',birthday='"+birthday+"' where id="+user_id;
        return excuteSql(sql);
    }
    public static boolean updateUserVendor(String name, String phone, String city, String district, String ward, String detail, String avatar, int user_id){
        String sql = "Update user set name ='" + name +"', phone='" + phone + "', address='" + detail + ", " + ward + ", " + district + ", " + city + "', avatar='" + avatar + "' where id=" + user_id;
        return excuteSql(sql);
    }
    public  static boolean updateUserInAdimin(int id,String email,long password,String name,String sex,String birthday,String address,String datecreated, int active){
        sex = sex.equalsIgnoreCase("Nam")?"1":"0";
        String sql = "UPDATE user SET email = ?, password= ?,name=?,sex=?,birthday=?,address=?,date_created=?,active=? WHERE id = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setLong(2,password);
            preparedStatement.setString(3,name);
            preparedStatement.setString(4,sex);
            preparedStatement.setString(5,birthday);
            preparedStatement.setString(6,address);
            preparedStatement.setString(7,datecreated);
            preparedStatement.setInt(8,id);
            preparedStatement.setInt(9, active);
            synchronized (preparedStatement) {
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            System.out.println(preparedStatement.toString());
            return update == 1;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return false;
    }
    public static User getUser(ResultSet rs){
        if (rs == null)
            return null;
        User user = new User();
        try {
            user.setId(rs.getInt(1));
            user.setName(rs.getString(2));
            user.setAvatar(rs.getString(3));
            user.setPassword(rs.getLong(4));
            user.setEmail(rs.getString(5));
            user.setPhone(rs.getLong(6));
            user.setAddress(rs.getString(7));
            user.setSex(rs.getByte(8)==1?"Nam":"Nữ");
            user.setBirthday(rs.getDate(9));
            user.setActive(rs.getByte(10)==1?true:false);
            user.setAbout(rs.getString(11));
            user.setRole_id(rs.getInt(12));
            user.setDate_created(new Date(rs.getTimestamp(13).getTime()));
            return  user;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
       return null;
    }
    // Dem co bao nhieu user
    public static int loadSumOfUser(String sql){
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
    public static List<User> loadUserFormSql(String sql){
        List<User>list = new ArrayList<User>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getUser(resultSet));
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


    public static boolean updateUserById(String name, String img, String birthday, int phone,String email,String city,String distric,String ward, String detailaddress,int user_id){
        String sql = "UPDATE user SET name = ?, img = ?, birthday = ?, phone = ?, email = ?, address = ?  WHERE id = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, img);
            preparedStatement.setString(3, birthday);
            preparedStatement.setInt(4,phone);
            preparedStatement.setString(5,email);
            preparedStatement.setString(6, detailaddress + ", " + ward + ", " + distric + ", " + city);
            preparedStatement.setInt(7,user_id);
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
    public static boolean updateUserActiveById( int active,int user_id){
        String sql = "UPDATE user SET active = ? WHERE id = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,active);
            preparedStatement.setInt(2,user_id);
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
    public static List<User> loadOrderCommentByIdUser(int idUser){
        List<User> userList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT u.avatar,u.`name`,r.date_created,r.rating_type_id,r.`comment` FROM `user` u JOIN rating r on u.id=r.user_id WHERE r.pro_id=?");
            preparedStatement.setString(1, String.valueOf(idUser));
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    User user = new User();
                    user.setAvatar(resultSet.getString(1));
                    user.setName(resultSet.getString(2));
                    user.setDate_created_comment(resultSet.getDate(3));
                    user.setRating_type_id(resultSet.getInt(4));
                    user.setComment(resultSet.getString(5));
                    userList.add(user);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return userList;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return userList;
    }



    public static int getMaxUserId() {
        int id = 0;
        Statement statement = null;
        try {
            statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery("select max(id) from user");
                if (resultSet.next())
                    id = resultSet.getInt(1);
                resultSet.close();
            }
            statement.close();
            return id;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public static boolean insertUser(String name, String email, String pass, String phone, int sex, String birthday, String address, int active, int role_id, String date_created) {
        int isInserted = 0;
        String sql = "insert into user(name,email,phone,sex,birthday,address,active,role_id,password,date_created,avatar) values(?,?,?,?,?,?,?,?,?,?,?)";
        try {

            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            peSetAttribute(pe, name, email, phone, sex, birthday, address, active, role_id);
            System.out.println("Date_createdInsert: "+date_created+" : "+email+" : "+pass);
            pe.setLong(9,Util.hashPass(date_created,email,pass));
            pe.setString(10, date_created);
            pe.setString(11,"imgs/user/default_avatar.png");
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

    private static void peSetAttribute(PreparedStatement pe, String name, String email, String phone, int sex, String birthday, String address, int active, int role_id) {
        try {
            pe.setString(1, name);
            pe.setString(2, email);
            pe.setString(3, phone);
            pe.setInt(4, sex);
            pe.setString(5, birthday);
            pe.setString(6, address);
            pe.setInt(7, active);
            pe.setInt(8, role_id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public static boolean updateUser(int id, String date_created, String name, String email, String pass, String phone, int sex, String birthday, String address, int active, int role_id) {
        int updated = 0;
        String sql = "update user set name = ? , email= ? , phone= ? , sex =? , birthday =? , address = ? , active= ? , role_id = ? ";
        if(pass!=null)
            sql +=" , password = ?  where id = ?";
        else sql+=" where id = ?";
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);

            peSetAttribute(pe, name, email, phone, sex, birthday, address, active, role_id);
            if(pass !=null){
                long passkey = Util.hashPass(date_created,email,pass);
                pe.setLong(9,passkey);
                pe.setInt(10, id);
            }else{
                pe.setInt(9, id);
            }
            System.out.println("pass: "+pass);
            System.out.println(pe.toString());
            synchronized (pe) {
                updated = pe.executeUpdate();
            }
            pe.close();
            return updated == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public static void changePassword(int user_id, String email, String pass) {
        User user = LoadUser.loadUserById(user_id);
        long p = Util.hashPass(Util.dateFormat(user.getDate_created()),email,pass);
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("update user set password=? where id=?");
            pe.setLong(1,p);
            pe.setInt(2,user_id);
            synchronized (pe){
                pe.executeUpdate();
            }
            pe.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static User loadAUserByEmailGG_FB(String email,String id) {
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("select * from user where email=? and password=?");
            preparedStatement.setString(1,email);
            preparedStatement.setLong(2,Util.hashPass("20220521",email,id));
            User user = null;
            synchronized (preparedStatement){
                ResultSet rs = preparedStatement.executeQuery();
                if(rs.next()){
                    user = getUser(rs);
                }
                rs.close();
            }
            preparedStatement.close();
            return user;
        } catch (SQLException throwables) {

            throwables.printStackTrace();

        }
        return null;
    }

    public static void saveAvatar(String urlImg, int id) {
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("update user set avatar=? where id=?");
            pe.setString(1,urlImg);
            pe.setInt(2,id);
            synchronized (pe){
                pe.executeUpdate();
            }
            pe.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public static void deleteUser(String email) {
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("DELETE FROM user WHERE email = ?");
            pe.setString(1,email);

            synchronized (pe){
                pe.executeUpdate();
            }
            pe.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public static void deleteEmailConfirm(String email) {
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("DELETE FROM email_confirm WHERE email = ?");
            pe.setString(1,email);

            synchronized (pe){
                pe.executeUpdate();
            }
            pe.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public static List<User> loadUserWithStatusOrder(int status, int supplier_id){
        List<User>users = new ArrayList<User>();
        String sql = "SELECT u.id, u.`name`,u.email\n" +
                "FROM `user` u  JOIN `order` o ON u.id=o.user_id WHERE o.`status`="+status+" and o.supplier_id="+supplier_id;
        System.out.println(sql);
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()){
                    User user = new User();
                    user.setId(resultSet.getInt(1));
                    user.setName(resultSet.getString(2));
                    user.setEmail(resultSet.getString(3));


                    users.add(user);
                }
                resultSet.close();
            }
            statement.close();
            return users;
        } catch(SQLException throwables){
            throwables.printStackTrace();
        }
        return null;
    }
    public static List<User> loadUsertBy( String user_id, String user_name, String from_date, String to_date) {
        List<User> productList = new ArrayList<User>();

        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from `user` where active<>-1 and id like ? and name like ? and date_created between ? and ?");

            pe.setString(1, user_id);
            pe.setString(2, user_name);
            pe.setString(3, from_date);
            pe.setString(4, to_date);
//            System.out.println((JDBC4PreparedStatement)pe.asSql());
            synchronized (pe) {
                ResultSet resultSet = pe.executeQuery();
                System.out.println(resultSet.getStatement().toString());
                while (resultSet.next()) productList.add(getUser(resultSet));
                resultSet.close();
            }
            pe.close();
            return productList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }

    public static void main(String[] args) {
        List<User> listUsers= LoadUser.loadUserWithStatusOrder(5,41);
        System.out.println(listUsers.size());
//        System.out.println(loadUserWithStatusOrder(3).toArray().length);
    }

}

