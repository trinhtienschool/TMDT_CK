package vn.thegioicaycanh.model.order_product;

import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderProduct {
    private int order_id;
    private int pro_id;
    private String pro_name;
    private String img;
    private int quantity;
    private double price;
    private int percent;
    private double sale;
    private double total;

    public OrderProduct() {
    }




    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    // Giảm giá
    public void setSale(double price, int percent, int quantity) {
        this.sale = price * percent * quantity/100;
    }

    public double getSale() {
        return sale;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double price, int percent, int quantity  ) {
        this.total = price * quantity - (price * percent * quantity/100);
    }

    @Override
    public String toString() {
        return "OrderProduct{" +
                "order_id=" + order_id +
                ", pro_id=" + pro_id +
                ", pro_name='" + pro_name + '\'' +
                ", img='" + img + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", percent=" + percent +
                ", sale=" + sale +
                ", total=" + total +
                '}';
    }
}
