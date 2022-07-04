package vn.thegioidochoi.model.order_product;

public class OrderDetailPayPal {
    private String productName;
    private float subtotal;
    private float shipping;
    private float tax;
    private float total;
    public OrderDetailPayPal(String productName, String subtotal,
                             String shipping, String tax, String total) {
        this.productName = productName;
        this.subtotal = Float.parseFloat(subtotal);
        this.shipping = Float.parseFloat(shipping);
        this.tax = Float.parseFloat(tax);
        this.total = Float.parseFloat(total);
    }
    public String getProductName() {
        return productName;
    }

    public String getSubtotal() {
        return String.format("%.0f", subtotal);
    }

    public String getShipping() {
        return String.format("%.0f", shipping);
    }

    public String getTax() {
        return String.format("%.0f", tax);
    }

    public String getTotal() {
        return String.format("%.0f", total);
    }
}
