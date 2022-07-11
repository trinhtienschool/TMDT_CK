package vn.thegioidochoi.Dao.connection_pool;
import org.apache.commons.dbcp.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;


public class DBCPDataSource {

    private static BasicDataSource ds = new BasicDataSource();
    private static Connection connection;
    static {
        ds.setDriverClassName(Config.DB_DRIVER);
        ds.setUrl(Config.CONNECTION_URL);
        ds.setUsername(Config.USER_NAME);
        ds.setPassword(Config.PASSWORD);
        ds.setMinIdle(Config.DB_MIN_CONNECTIONS); // minimum number of idle connections in the pool
        ds.setInitialSize(Config.DB_MIN_CONNECTIONS);
        ds.setMaxActive(100);
        ds.setMaxIdle(Config.DB_MAX_CONNECTIONS); // maximum number of idle connections in the pool
        ds.setMaxOpenPreparedStatements(0);
    }

    private DBCPDataSource() {
        super();
    }

    public static Connection getConnection() throws SQLException {
        if(connection == null || connection.isClosed()) {
            connection=ds.getConnection();
            return connection;
        }
        return connection;

    }
    public static Statement getStatement() throws SQLException {
        return getConnection().createStatement();
    }
    public static PreparedStatement preparedStatement(String sql) throws SQLException {
        return getConnection().prepareStatement(sql);
    }

    public static int getNumActive(){
        return ds.getNumActive();
    }

    public static int getNumIdle(){
        return ds.getNumIdle();
    }


//    private static final String DRIVER_CLASS_NAME = "com.mysql.jdbc.Driver";
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/thegioidochoi?useUnicode=yes&characterEncoding=UTF-8";
//    private static final String DB_USER = "root";
//    private static final String DB_PASSWORD = "";
//    private static final int CONN_POOL_SIZE = 5;
//
//    private BasicDataSource bds = new BasicDataSource();
//    private Connection connection;
//    private DBCPDataSource() {
//        //Set database driver name
//        bds.setDriverClassName(DRIVER_CLASS_NAME);
//        //Set database url
//        bds.setUrl(DB_URL);
//        //Set database user
//        bds.setUsername(DB_USER);
//        //Set database password
//        bds.setPassword(DB_PASSWORD);
//        //Set the connection pool size
//        bds.setInitialSize(CONN_POOL_SIZE);
//        bds.setMinIdle(5);
//        bds.setMaxIdle(10);
//        bds.setMaxOpenPreparedStatements(100);
//    }
//
//    private static class DataSourceHolder {
//        private static final DBCPDataSource INSTANCE = new DBCPDataSource();
//    }
//
//    public static DBCPDataSource getInstance() {
//        return DataSourceHolder.INSTANCE;
//    }
//
//    public BasicDataSource getBds() {
//        return bds;
//    }
//
//    public void setBds(BasicDataSource bds) {
//        this.bds = bds;
//    }
//        public static Connection getConnection() throws SQLException {
////        if(connection == null || connection.isClosed()) {
////            connection=ds.getConnection();
////            return connection;
////        }
//        return DBCPDataSource.getInstance().getBds().getConnection();
//
//    }
//    public static int getNumActive(){
//        return DBCPDataSource.getInstance().getBds().getNumActive();
//    }
//    public static Statement getStatement() throws SQLException {
//        return getConnection().createStatement();
//    }
//    public static PreparedStatement preparedStatement(String sql) throws SQLException {
//        return getConnection().prepareStatement(sql);
//    }

}
