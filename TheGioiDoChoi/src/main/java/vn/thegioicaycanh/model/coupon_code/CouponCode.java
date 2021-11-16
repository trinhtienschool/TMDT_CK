package vn.thegioicaycanh.model.coupon_code;

import vn.thegioicaycanh.model.coupon_code_type.CouponCodeType_Con_DB;

import java.util.Date;

public class CouponCode {
    private int id;
    private String name;
    private int coupon_code_type_id;
    private String coupon_code_type_name;
    private int percent;
    private String description;
    private String code;
    private Date date_start;
    private Date date_end;
    private int date_number; // so ngay giam gia con lai



    private int tongsongay;
    public int getTongsongay() {
        return tongsongay;
    }

    public void setTongsongay(int tongsongay) {
        this.tongsongay = tongsongay;
    }
    public CouponCode() {
    }
    public static String getLinkImage(int id){
        return CouponCodeType_Con_DB.getLinkImageFromCouponType(id);
        }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCoupon_code_type_id() {
        return coupon_code_type_id;
    }

    public void setCoupon_code_type_id(int coupon_code_type_id) {
        this.coupon_code_type_id = coupon_code_type_id;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getDate_start() {
        return date_start;
    }

    public void setDate_start(Date date_start) {
        this.date_start = date_start;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }

    public static void main(String[] args) {
        System.out.println(getLinkImage(3));
    }

    public String getCoupon_code_type_name() {
        return coupon_code_type_name;
    }

    public void setCoupon_code_type_name(String coupon_code_type_name) {
        this.coupon_code_type_name = coupon_code_type_name;
    }

    public int getDate_number() {
        return date_number;
    }

    public void setDate_number(int date_number) {
        this.date_number = date_number;
    }
    //con lai
    public int daysBetween(){
        Date d3=new java.util.Date();
        return (int)( ( date_end.getTime()-d3.getTime()) / (1000 * 60 * 60 * 24));
    }
    //tong so ngay
    public int daysB(){
        return  (int)( (date_end.getTime() - date_start.getTime()) / (1000 * 60 * 60 * 24));
    }
    public double getpecent(){
        return (daysBetween()*100/daysB());
    }

    @Override
    public String toString() {
        return "CouponCode{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", coupon_code_type_id=" + coupon_code_type_id +
                ", coupon_code_type_name='" + coupon_code_type_name + '\'' +
                ", percent=" + percent +
                ", description='" + description + '\'' +
                ", code='" + code + '\'' +
                ", date_start=" + date_start +
                ", date_end=" + date_end +
                ", date_number=" + date_number +
                '}';
    }

}
