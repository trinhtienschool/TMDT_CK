package vn.thegioidochoi.Dao;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.image.Image;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LoadImage {
    public static List<Image> loadListImage(int id){
        List<Image> images = new ArrayList<>();
        String sql = "SELECT src,pro_id FROM images WHERE pro_id=" + id;
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    images.add(getImage(resultSet));
                }
                resultSet.close();
            }
            statement.close();
            return images;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    private static Image getImage(ResultSet resultSet) {
        if(resultSet == null)
            return null;
        Image image = new Image();
        try{
            image.setUrl(resultSet.getString(1));
            image.setPro_id(resultSet.getInt(2));
            return image;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        for (Image i: loadListImage(1)
             ) {
            System.out.println(i);
        }
    }
}
