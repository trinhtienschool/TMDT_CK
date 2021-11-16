package vn.thegioicaycanh.model.home_page;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

public class Home_page {
    private String wel_img;
    private String mes_1;
    private String mes_2;
    private String mes_3;
    private String[] mes_sep;
    private String sep_img;
    private String sep_img2;

    public Home_page(){
        loadHome_page();
    }
    public void loadHome_page(){
        try {
            Statement statement = DBCPDataSource.getConnection().createStatement();
            synchronized (statement){
                ResultSet re = statement.executeQuery("select * from home_page");
                re.next();
                this.wel_img = re.getString(2);
                this.mes_1 = re.getString(3);
                this.mes_2 = re.getString(4);
                this.mes_3 = re.getString(5);
                this.mes_sep = re.getString(6).split(",");
                this.sep_img = re.getString(7);
                this.sep_img2 = re.getString(8);
                re.close();
            }
            statement.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public String toString() {
        return "Home_page{" +
                "wel_img='" + wel_img + '\'' +
                ", mes_1='" + mes_1 + '\'' +
                ", mes_2='" + mes_2 + '\'' +
                ", mes_3='" + mes_3 + '\'' +
                ", mes_sep=" + Arrays.toString(mes_sep) +
                ", sep_img='" + sep_img + '\'' +
                ", sep_img2='" + sep_img2 + '\'' +
                '}';
    }

    public String getWel_img() {
        return wel_img;
    }

    public void setWel_img(String wel_img) {
        this.wel_img = wel_img;
    }

    public String getMes_1() {
        return mes_1;
    }

    public void setMes_1(String mes_1) {
        this.mes_1 = mes_1;
    }

    public String getMes_2() {
        return mes_2;
    }

    public void setMes_2(String mes_2) {
        this.mes_2 = mes_2;
    }

    public String getMes_3() {
        return mes_3;
    }

    public void setMes_3(String mes_3) {
        this.mes_3 = mes_3;
    }

    public String[] getMes_sep() {
        return mes_sep;
    }

    public void setMes_sep(String[] mes_sep) {
        this.mes_sep = mes_sep;
    }

    public String getSep_img() {
        return sep_img;
    }

    public void setSep_img(String sep_img) {
        this.sep_img = sep_img;
    }

    public String getSep_img2() {
        return sep_img2;
    }

    public void setSep_img2(String sep_img2) {
        this.sep_img2 = sep_img2;
    }
}
