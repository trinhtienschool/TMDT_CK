package vn.thegioicaycanh.model.user;

public class Cart_item {
    private int id;
    private String img;
    private String name;
    private double price;
    private double price_sale;
    private int quantity;
    private boolean sale;
    private int type_weight;
    private double totalPrice;

    public Cart_item(int id, String img, String name, double price, double price_sale, int quantity,boolean sale,int type_weight) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.price = price;
        this.price_sale = price_sale;
        this.quantity = quantity;
        this.sale=sale;
        this.type_weight=type_weight;
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

    public int getType_weight() {
        return type_weight;
    }

    public void setType_weight(int type_weight) {
        this.type_weight = type_weight;
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
                ", totalPrice=" + totalPrice +
                '}';
    }
}
