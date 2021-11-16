package vn.thegioicaycanh.model.database.connection_pool;

public class Config {
    public static final String HOST_NAME = "localhost";
    public static final String DB_NAME = "webcaycanh";
    public static final String DB_PORT = "3306";
    public static final String USER_NAME = "root";
    public static final String PASSWORD = "";
    public static final String DB_DRIVER = "com.mysql.jdbc.Driver";
    public static final int DB_MIN_CONNECTIONS = 50;
    public static final int DB_MAX_CONNECTIONS = 100;
    // jdbc:mysql://hostname:port/dbname
    public static final String CONNECTION_URL = "jdbc:mysql://" + HOST_NAME + ":" + DB_PORT + "/" + DB_NAME+"?useUnicode=yes&characterEncoding=UTF-8";

}
