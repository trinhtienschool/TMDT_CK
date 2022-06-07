package vn.thegioidochoi.model.supplier;

import java.util.Date;

public class Supplier {
    private int id;
    private String logo;
    private String address;
    private String phone;
    private String email;
    private String description;
    private int commission_rate;
    private int user_id;
    private String company_name;
    private String website;
    private Date date;
    private double revenue;
    private int total_product;

    public Supplier() {
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCommission_rate() {
        return commission_rate;
    }

    public void setCommission_rate(int commission_rate) {
        this.commission_rate = commission_rate;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getTotal_product() {
        return total_product;
    }

    public void setTotal_product(int total_product) {
        this.total_product = total_product;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "id=" + id +
                ", logo='" + logo + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", description='" + description + '\'' +
                ", commission_rate=" + commission_rate +
                ", user_id=" + user_id +
                ", company_name='" + company_name + '\'' +
                ", website='" + website + '\'' +
                ", date=" + date +
                ", revenue=" + revenue +
                ", total_product=" + total_product +
                '}';
    }
}
