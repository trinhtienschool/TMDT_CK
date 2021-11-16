package vn.thegioicaycanh.model.user;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, Cart_item> products;
    private int size = 0;
    private double totalPrice = 0;
    private int coupon_code_id=0;
    private double priceSaled = 0;
    private double totalPriceCheckout=0;
    //Da dang nhap:
    public Cart(int user_id) {
        this.products = new HashMap<Integer, Cart_item>();
        loadCart(user_id);
        calTotalPrice_Size();
    }

    public void addProduct(int id, int user_id) {
        if (products.containsKey(id)) {
            products.get(id).addQuantity();
            updateQuantity(id, products.get(id).getQuantity(), user_id);
        } else {
            Product product = ProductEntity.loadProductById(id);
            if (product != null) {
                Cart_item cart_item = new Cart_item(product.getId(), product.getImg(), product.getName(), product.getPrice(), product.getPrice_sale(), 1,product.isIs_sale(),product.getType_weight());
                products.put(product.getId(), cart_item);
                insert(id, 1, user_id);
            }
        }
        calTotalPrice_Size();
    }


    public void subProduct(int id, int user_id) {
        if (products.containsKey(id)) {
            int currentQuantity = products.get(id).getQuantity();
            if (currentQuantity == 1) {
                products.remove(id);
                delete(id, user_id);
            } else {
                products.get(id).subQuantity();
                updateQuantity(id, products.get(id).getQuantity(), user_id);
            }
        }
        calTotalPrice_Size();
    }
    public void deleteProduct(int id,int user_id){
        if(products.containsKey(id)){
            products.remove(id);
            delete(id,user_id);
        }
    }
    //Chua dang nhap
    public Cart() {
        this.products = new HashMap<Integer, Cart_item>();
    }

    public void addProduct(int id) {
        if (products.containsKey(id)) {
            products.get(id).addQuantity();
        } else {
            Product product = ProductEntity.loadProductById(id);
            if (product != null) {
                products.put(product.getId(), new Cart_item(product.getId(), product.getImg(), product.getName(), product.getPrice(), product.getPrice_sale(), 1,product.isIs_sale(),product.getType_weight()));
            }
        }
       calTotalPrice_Size();
    }
    public void subProduct(int id) {
        if (products.containsKey(id)) {
            int currentQuantity = products.get(id).getQuantity();
            if (currentQuantity == 1) {
                products.remove(id);
            } else {
                products.get(id).subQuantity();
            }
        }
        calTotalPrice_Size();
    }
    public void deleteProduct(int id){
        if(products.containsKey(id)){
            products.remove(id);
        }
    }
    public void calTotalPrice_Size(){
        this.size=0;
        this.totalPrice = 0;
        for(Cart_item item:products.values()){
            this.size +=item.getQuantity();
            this.totalPrice +=item.getTotalPrice();
        }
    }
    public void loadCart(int user_id) {
        String sql = "select p.id,p.img,p.name,p.price,p.price_sale,s.quantity,p.is_sale,p.type_weight from shopping_cart s join product p on s.pro_id=p.id where user_id = ?";
        try {
            PreparedStatement pt = DBCPDataSource.preparedStatement(sql);
            pt.setInt(1, user_id);
            synchronized (pt) {
                ResultSet rs = pt.executeQuery();
                while (rs.next()) {
                    Cart_item item = new Cart_item();
                    item.setId(rs.getInt(1));
                    item.setImg(rs.getString(2));
                    item.setName(rs.getString(3));
                    item.setPrice(rs.getDouble(4));
                    item.setPrice_sale(rs.getDouble(5));
                    item.setQuantity(rs.getInt(6));
                    item.setSale(rs.getInt(7)==1);
                    item.setType_weight(rs.getInt(8));
                    item.calTotalPrice();
                    products.put(item.getId(), item);
                }
                rs.close();
            }
            pt.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public int getCoupon_code_id() {
        return coupon_code_id;
    }

    public void setCoupon_code_id(int coupon_code_id) {
        this.coupon_code_id = coupon_code_id;
    }

    public double getTotalPriceCheckout() {
        return totalPriceCheckout;
    }

    public void setTotalPriceCheckout(double totalPriceCheckout) {
        this.totalPriceCheckout = totalPriceCheckout;
    }

    public double getPriceSaled() {
        return priceSaled;
    }

    public void setPriceSaled(double priceSaled) {
        this.priceSaled = priceSaled;
    }

    public void updateQuantity(int pro_id, int quantity, int user_id) {
        String sql = "update shopping_cart set quantity = ? where user_id=? and pro_id=?";
        try {
            PreparedStatement pt = DBCPDataSource.preparedStatement(sql);
            pt.setInt(1, quantity);
            pt.setInt(2, user_id);
            pt.setInt(3, pro_id);
            synchronized (pt) {
                pt.executeUpdate();
            }
            pt.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void insert(int pro_id, int quantity, int user_id) {
        String sql = "insert into shopping_cart values (?,?,?)";
        try {
            PreparedStatement pt = DBCPDataSource.preparedStatement(sql);
            pt.setInt(1, user_id);
            pt.setInt(2, pro_id);
            pt.setInt(3, quantity);
            synchronized (pt) {
                pt.executeUpdate();
            }
            pt.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void delete(int pro_id, int user_id) {
        String sql = "delete from shopping_cart where user_id=? and pro_id =?";
        try {
            PreparedStatement pt = DBCPDataSource.preparedStatement(sql);
            pt.setInt(1, user_id);
            pt.setInt(2, pro_id);
            synchronized (pt) {
                pt.executeUpdate();
            }
            pt.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public int getMaxTypeWeight(){
        int typeWeight=0;
        for(Cart_item c: products.values()){
            typeWeight = Integer.max(typeWeight,c.getType_weight());
        }
        return typeWeight;
    }

    public Map<Integer, Cart_item> getProducts() {
        return products;
    }

    public void setProducts(Map<Integer, Cart_item> products) {
        this.products = products;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void refeshCart(int user_id) {

        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("delete from shopping_cart where user_id=?");
            pe.setInt(1,user_id);
            synchronized (pe){
                pe.executeUpdate();
            }
            pe.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public String toString() {
        for(int id : products.keySet()){
            System.out.println(products.get(id));
        }
        return "";
    }
}
