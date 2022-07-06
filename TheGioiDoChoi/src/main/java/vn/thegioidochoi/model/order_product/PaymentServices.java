package vn.thegioidochoi.model.order_product;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.user.Cart;
import vn.thegioidochoi.model.user.Cart_item;
import vn.thegioidochoi.model.util.Util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class PaymentServices {
    private static final String CLIENT_ID = "AerVTnGhWHCTgLz6HhpNswvOXcSa8WXMMQfQZrhpmb2FCWeujgbqlTtD9DETnXDiQ9R3Q_BBOSmNdO2-";
    private static final String CLIENT_SECRET = "EM7tUyASTJMpE9EupVIdQC98_ExXDARr8rkJ4GDr8LpVZ8M2QV39oD-wrlZWcsTMBRAdeMoDuoJ89cHI";
    private static final String MODE = "sandbox";

    public String authorizePayment(OrderDetail orderDetail, String name,String province,String district,String detail_address,String email)
            throws PayPalRESTException, IOException {

        Payer payer = getPayerInformation(name,province,district,detail_address,email);
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment approvedPayment = requestPayment.create(apiContext);

        return getApprovalLink(approvedPayment);

    }

    private Payer getPayerInformation(String name,String province,String district,String detail_address,String email) {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
        Address address = new Address();
        address.setCity(district);
//        address.setState(district);
        address.setLine1(detail_address);
        address.setCountryCode("VN");
        address.setPostalCode("700000");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName(name)
                .setEmail(email)
                .setCountryCode("VN")


                        .setBillingAddress(address);


        payer.setPayerInfo(payerInfo);

        return payer;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8082/CancelPayPal_direct");
        redirectUrls.setReturnUrl("http://localhost:8082/authorize_payment");

        return redirectUrls;
    }

    private List<Transaction> getTransactionInformation(OrderDetail orderDetail) throws IOException {
        Details details = new Details();
        details.setShipping(orderDetail.getFee_ship());
        details.setSubtotal(orderDetail.getSubtotal());
        details.setTax(Util.formatNumber(0.0));

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(orderDetail.getTotal());
//        amount.setTotal(String.valueOf(Math.round(cart.getTotalPrice()+fee_ship)));
        amount.setDetails(details);


        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(orderDetail.getNote());

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
        double totalPrice = 0;
        for(Product product:orderDetail.getProducts()) {
            Item item = new Item();
            item.setCurrency("USD");
            item.setName(product.getName());
            item.setPrice(Util.formatNumber(product.getPriceSaleOrPrice()));
            
//            item.setPrice(String.valueOf(Math.round(cart_item.getPriceForCal())));
            item.setTax(Util.formatNumber(0.0));
//            item.setTax(String.valueOf(Math.round(0.0)));
            item.setQuantity(String.valueOf(product.getQuantity()));
            items.add(item);
        }
        itemList.setItems(items);
        transaction.setItemList(itemList);



        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;
    }
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }
    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }

        return approvalLink;
    }
    public Payment executePayment(String paymentId, String payerId)
            throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        Payment payment = new Payment().setId(paymentId);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        return payment.execute(apiContext, paymentExecution);
    }
}
