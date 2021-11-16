package vn.thegioicaycanh.model.Product;

import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class Product {
    private int id;
    private String name;
    private double price;
    private String img;
    private String description;
    private String content;
    private int supplier_id;
    private byte type_weight;
    private boolean active;
    private byte percent_sale;
    private double price_sale;
    private int category_id;
    private int quantity;
    private boolean is_sale;
    private Date date_start_sale;
    private Date date_end_sale;
    private String slug;
    private Date date_created;
    private int percent_sale_past;
    private int dayRest;
    private int countstar;
    private int contcomment;
    private double avgstar;


    public Product() {
    }

    public int getContcomment() {
        return contcomment;
    }

    public void setContcomment(int contcomment) {
        this.contcomment = contcomment;
    }

    public double getAvgstar() {
        return avgstar;
    }

    public void setAvgstar(double avgstar) {
        this.avgstar = avgstar;
    }

    public int getCountstar() {
        return countstar;
    }

    public void setCountstar(int countstar) {
        this.countstar = countstar;
    }

    public int percent_sale_past(){
        long diffInMillies = Math.abs(date_start_sale.getTime() - date_end_sale.getTime());
        long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
        Date now = Calendar.getInstance().getTime();
        long timePast = TimeUnit.DAYS.convert(now.getTime()-date_start_sale.getTime(),TimeUnit.MILLISECONDS);
        diff=diff==0?1:diff;
        return (int)(timePast*100/diff);
    }
    public int dayRest(){
        Date now = Calendar.getInstance().getTime();
        long dateRest = TimeUnit.DAYS.convert(date_end_sale.getTime()-now.getTime(),TimeUnit.MILLISECONDS);

        return (int)dateRest;
    }
//    public static int percent(Date start,Date end){
//        long diffInMillies = Math.abs(start.getTime() - end.getTime());
//        long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
//        Date now = Calendar.getInstance().getTime();
//        long timePast = TimeUnit.DAYS.convert(now.getTime()-start.getTime(),TimeUnit.MILLISECONDS);
//        return (int)(timePast*100/diff);
//    }
    public static void main(String[] args) {
//        Calendar c = Calendar.getInstance();
//        c.set(2020,11,28);
//        Date d = c.getTime();
//        Date now = Calendar.getInstance().getTime();
//        System.out.println(now);
//        System.out.println(d);
//        long dateRest = TimeUnit.DAYS.convert(now.getTime()-d.getTime(),TimeUnit.MILLISECONDS);
//        System.out.println(dateRest);
//        Date s = c.getTime();
//        c.set(2021,0,10);
//        Date e =c.getTime();
//        System.out.println(percent(s,e));
    }
    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getPercent_sale_past() {
        return percent_sale_past;
    }

    public void setPercent_sale_past(int percent_sale_past) {
        this.percent_sale_past = percent_sale_past;
    }

    public int getDayRest() {
        return dayRest;
    }

    public void setDayRest(int dayRest) {
        this.dayRest = dayRest;
    }

    public Date getDate_start_sale() {
        return date_start_sale;
    }

    public void setDate_start_sale(Date date_start_sale) {
        this.date_start_sale = date_start_sale;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public byte getType_weight() {
        return type_weight;
    }

    public void setType_weight(byte type_weight) {
        this.type_weight = type_weight;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public byte getPercent_sale() {
        return percent_sale;
    }

    public void setPercent_sale(byte percent_sale) {
        this.percent_sale = percent_sale;
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

    public boolean isIs_sale() {
        return is_sale;
    }

    public void setIs_sale(boolean is_sale) {
        this.is_sale = is_sale;
    }

    public Date getDate_end_sale() {
        return date_end_sale;
    }

    public void setDate_end_sale(Date date_end_sale) {
        this.date_end_sale = date_end_sale;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", img='" + img + '\'' +
                ", description='" + description + '\'' +
                ", content='" + content + '\'' +
                ", supplier_id=" + supplier_id +
                ", type_weight=" + type_weight +
                ", active=" + active +
                ", percent_sale=" + percent_sale +
                ", price_sale=" + price_sale +
                ", category='" + category_id + '\'' +
                ", quantity=" + quantity +
                ", is_sale=" + is_sale +
                ", date_end_sale=" + date_end_sale +
                ", slug='" + slug + '\'' +
                ", date_created=" + date_created +
                '}';
    }
}
