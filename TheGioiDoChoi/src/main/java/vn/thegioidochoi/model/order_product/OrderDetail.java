package vn.thegioidochoi.model.order_product;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.util.Util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetail {
    private List<Product> products;
    private double fee_ship;
    private String note;
    private double subtotal;
    private double total;
    public OrderDetail(double fee_ship, String note) throws IOException {
        products = new ArrayList<Product>();
        this.fee_ship = Util.convertCurrentVNDtoUSD(fee_ship);
        this.note = note;
    }

    public String getSubtotal() {
        calSubTotalPrice();
        return Util.formatNumber(subtotal);
    }
    public String getTotal(){
        total = subtotal+fee_ship;
        return Util.formatNumber(total);
    }
    public String getFee_ship(){
        return Util.formatNumber(fee_ship);
    }

    public void calSubTotalPrice(){
        for(Product product:products){
            subtotal += product.getPriceSaleOrPrice()*product.getQuantity();
        }
        subtotal= Math.ceil(subtotal*100)/100;
    }
    public void addProduct(String name, double price_sale,double price, int quantity) throws IOException {
        Product product = new Product();
        product.setName(name);
        product.setPrice_sale(Util.convertCurrentVNDtoUSD(price_sale));
        product.setPrice(Util.convertCurrentVNDtoUSD(price));
        product.setQuantity(quantity);
        products.add(product);
    }
    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }



    public void setFee_ship(double fee_ship) {
        this.fee_ship = fee_ship;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
