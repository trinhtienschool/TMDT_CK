package vn.thegioicaycanh.model.database.connection_pool;
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
        ds.setMaxIdle(Config.DB_MAX_CONNECTIONS); // maximum number of idle connections in the pool
        ds.setMaxOpenPreparedStatements(100);
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

}
