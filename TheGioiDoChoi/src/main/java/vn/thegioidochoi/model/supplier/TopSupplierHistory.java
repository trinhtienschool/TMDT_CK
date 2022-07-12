package vn.thegioidochoi.model.supplier;

import java.util.Date;

public class TopSupplierHistory {
    private int id;
    private int supplier_id;
    private Date date_created;
    private int commission_rate;

    public TopSupplierHistory(int id, int supplier_id, Date date_created, int commission_rate) {
        this.id = id;
        this.supplier_id = supplier_id;
        this.date_created = date_created;
        this.commission_rate = commission_rate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }

    public int getCommission_rate() {
        return commission_rate;
    }

    public void setCommission_rate(int commission_rate) {
        this.commission_rate = commission_rate;
    }
}
