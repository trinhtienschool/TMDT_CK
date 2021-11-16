package vn.thegioicaycanh.model.header_footer;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Social_media {
    private String fb;
    private String in;
    private String tw;
    private String pi;

    public Social_media(){
        load();
    }

    public static boolean update(String fb, String tw, String in, String pi) {
        int updated=0;
        String sql = "update social_media set facebook=?,intagram=?,twitter=?,pinterest=? where id=1";
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setString(1,fb);
            pe.setString(2,in);
            pe.setString(3,tw);
            pe.setString(4,pi);
            synchronized (pe){
               updated = pe.executeUpdate();
            }
            pe.close();
            return updated==1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public void load(){
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet rs = statement.executeQuery("Select * from social_media");
                if(rs.next()) {
                    this.fb = rs.getString(2);
                    this.in = rs.getString(3);
                    this.tw = rs.getString(4);
                    this.pi = rs.getString(5);
                }
                rs.close();
            }
            statement.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public String getFb() {
        return fb;
    }

    public void setFb(String fb) {
        this.fb = fb;
    }

    public String getIn() {
        return in;
    }

    public void setIn(String in) {
        this.in = in;
    }

    public String getTw() {
        return tw;
    }

    public void setTw(String tw) {
        this.tw = tw;
    }

    public String getPi() {
        return pi;
    }

    public void setPi(String pi) {
        this.pi = pi;
    }

}
