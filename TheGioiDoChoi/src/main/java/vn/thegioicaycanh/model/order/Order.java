package vn.thegioicaycanh.model.order;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.order_product.OrderProduct;
import vn.thegioicaycanh.model.order_product.OrderProduct_Con_DB;
import vn.thegioicaycanh.model.rating.Rating;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;

import java.sql.Date;
import java.util.List;

public class Order {
    private int id;
    private int user_id;
    private String user_name;
    private int sale_id;
    private int ship_id;
    private boolean payment;
    private String note;
    private long phone;
    private String address;
    private int status;
    private Date date_created;
    private double total_pay;
    private int count_id;
    private double ship_price;
    private String name_product;
    private int number_product;
    public Order() {
    }
    public String getName_product() {
        return name_product;
    }

    public void setName_product(String name_product) {
        this.name_product = name_product;
    }

    public int getNumber_product() {
        return number_product;
    }

    public void setNumber_product(int number_product) {
        this.number_product = number_product;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getSale_id() {
        return sale_id;
    }

    public void setSale_id(int sale_id) {
        this.sale_id = sale_id;
    }

    public int getShip_id() {
        return ship_id;
    }

    public void setShip_id(int ship_id) {
        this.ship_id = ship_id;
    }

    public boolean isPayment() {
        return payment;
    }

    public void setPayment(boolean payment) {
        this.payment = payment;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int isStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }
    public static String getNameUserById(int id){
        return new Rating().getNameById(new Order().getUser_id());
    }
    public static String getNameProductByOrderId(int id){
        List<OrderProduct> orderProducts= OrderProduct_Con_DB.loadOrderProductFormSql("select * from order_product");
        for(OrderProduct o:orderProducts){
            if(o.getOrder_id()==id){
                return OrderProduct_Con_DB.getNameProductById(o.getPro_id());
            }
        }
        return null;
    }
    public static String getNameUserByUserId(int id){
        return new Rating().getNameById(id);
    }
    public static double getPriceByOrderId(int id){
        List<OrderProduct> orderProducts= OrderProduct_Con_DB.loadOrderProductFormSql("select * from order_product");
        for(OrderProduct o:orderProducts){
            if(o.getOrder_id()==id){
                return OrderProduct_Con_DB.getPriceProductById(o.getPro_id());
            }
        }
        return 0.0;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getStatus() {
        return status;
    }

    public Double getTotal_pay() {
        return total_pay;
    }

    public void setTotal_pay(Double total_pay) {
        this.total_pay = total_pay;
    }

    public static void main(String[] args) {
        System.out.println(getPriceByOrderId(3));
    }

    public int getCount_id() {
        return count_id;
    }

    public void setCount_id(int count_id) {
        this.count_id = count_id;
    }

    public void setTotal_pay(double total_pay) {
        this.total_pay = total_pay;
    }

    public double getShip_price() {
        return ship_price;
    }

    public void setShip_price(double ship_price) {
        this.ship_price = ship_price;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", sale_id=" + sale_id +
                ", ship_id=" + ship_id +
                ", payment=" + payment +
                ", note='" + note + '\'' +
                ", phone=" + phone +
                ", address='" + address + '\'' +
                ", status=" + status +
                ", date_created=" + date_created +
                ", total_pay=" + total_pay +
                '}';
    }
}
