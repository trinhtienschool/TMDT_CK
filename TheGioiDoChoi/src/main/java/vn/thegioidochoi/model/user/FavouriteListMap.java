package vn.thegioidochoi.model.user;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.Dao.ProductEntity;
import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.Dao.Favorist_list_Con_DB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class FavouriteListMap {
    private Map<Integer, Product> products = new HashMap<Integer, Product>();
    public FavouriteListMap() {

    }
    public int getSize(){
        return products.size();
    }
    public FavouriteListMap(int user_id){
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from favorist_list where user_id=?");
            pe.setInt(1,user_id);
            synchronized (pe){
                ResultSet re = pe.executeQuery();
                while(re.next()){
                    products.put(re.getInt(2),ProductEntity.loadProductById(re.getInt(2)));
                }
                re.close();
            }
            pe.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
    public void addProduct(int user_id, int pro_id) {

        if (!products.containsKey(pro_id)) {
            Product product = ProductEntity.loadProductById(pro_id);
            products.put(product.getId(), product);
            Favorist_list_Con_DB.saveFavoristList(user_id,pro_id);
        }
    }

    public void subProduct(int user_id,int pro_id) {
        if (products.containsKey(pro_id)) {
            products.remove(pro_id);
            Favorist_list_Con_DB.deleteProductFavoristList(user_id,pro_id);
        }
    }
}
