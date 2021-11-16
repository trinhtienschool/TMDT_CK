package vn.thegioicaycanh.model.warranty;

import java.util.Date;

public class Warranty {
    private int id;
    private int order_id;
    private int user_id;
    private int pro_id;
    private String title;
    private String message;
    private String img;
    private Date date_created;
    private int status;
    private String email;
    private String user_name;
    private String product_name;
    public Warranty() {
    }

    public Warranty(int id, int order_id, int user_id, int pro_id, String title, String message, String img, int status, String email) {
        this.id = id;
        this.order_id = order_id;
        this.user_id = user_id;
        this.pro_id = pro_id;
        this.title = title;
        this.message = message;
        this.img = img;
        this.status = status;

        this.date_created = new Date();
        this.email = email;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
