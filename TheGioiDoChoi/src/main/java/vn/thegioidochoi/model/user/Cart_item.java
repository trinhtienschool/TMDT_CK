package vn.thegioidochoi.model.user;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Cart_item {
    private int id;
    private String img;
    private String name;
    private double price;
    private double price_sale;
    private int quantity;
    private boolean sale;

    private double totalPrice;
    private String vendor_name;
    private int vendor_id;
    private String product_slug;

    public Cart_item(int id, String img, String name, double price, double price_sale, int quantity,boolean sale,String vendor_name, String product_slug) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.price = price;
        this.price_sale = price_sale;
        this.quantity = quantity;
        this.sale=sale;
       this.vendor_name = vendor_name;
       this.product_slug = product_slug;
        calTotalPrice();
    }

    public Cart_item() {
    }
    public void addQuantity(){
        this.quantity++;
        calTotalPrice();
    }
    public void subQuantity(){
        this.quantity--;
        calTotalPrice();
    }
    public void calTotalPrice(){
        this.totalPrice = quantity*getPriceForCal();
    }
   public double getPriceForCal(){
        if(!sale)
            return this.price;
        return this.price_sale;
   }

    public boolean isSale() {
        return sale;
    }

    public void setSale(boolean sale) {
        this.sale = sale;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPrice_sale() {
        return price_sale;
    }

    public void setPrice_sale(double price_sale) {
        this.price_sale = price_sale;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getVendor_name() {
        return vendor_name;
    }

    public void setVendor_name(String vendor_name) {
        this.vendor_name = vendor_name;
    }

    public String getProduct_slug() {
        return product_slug;
    }

    public void setProduct_slug(String product_slug) {
        this.product_slug = product_slug;
    }

    public int getVendor_id() {
        return vendor_id;
    }

    public void setVendor_id(int vendor_id) {
        this.vendor_id = vendor_id;
    }

    @Override
    public String toString() {
        return "Cart_item{" +
                "id=" + id +
                ", img='" + img + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", price_sale=" + price_sale +
                ", quantity=" + quantity +
                ", isSale=" + sale +
                ", product_slug=" + product_slug +
                ", vendor_name=" + vendor_name +
                ", vendor_id=" + vendor_id +
                ", totalPrice=" + totalPrice +

                '}';
    }
    public static Cart_item loadCartItemProduct(int product_id) {
        String sql = "select p.id,p.img, p.name, p.price, p.price_sale,count(*), p.is_sale,s.name,s.id, p.slug  from product p join supplier s on p.supplier_id = s.id where p.id = ?";
        Cart_item item = new Cart_item();
        try {
            PreparedStatement pt = DBCPDataSource.preparedStatement(sql);
            pt.setInt(1, product_id);
            synchronized (pt) {
                ResultSet rs = pt.executeQuery();
                if (rs.next()) {

                    item.setId(rs.getInt(1));
                    item.setImg(rs.getString(2));
                    item.setName(rs.getString(3));
                    item.setPrice(rs.getDouble(4));
                    item.setPrice_sale(rs.getDouble(5));
                    item.setQuantity(rs.getInt(6));
                    item.setSale(rs.getInt(7)==1);
                    item.setVendor_name(rs.getString(8));
                    item.setVendor_id(rs.getInt(9));
                    item.setProduct_slug(rs.getString(10));
                    item.calTotalPrice();

                }
                rs.close();
            }
            pt.close();
            return item;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;

    }
}
