package vn.thegioicaycanh.model.shipment;

import java.util.Date;

public class Shipment {
    private int id;
    private int order_id;
    private double price;
    private int type_weight;
    private Date date_created;

    public Shipment() {
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getType_weight() {
        return type_weight;
    }

    public void setType_weight(int type_weight) {
        this.type_weight = type_weight;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }
}
