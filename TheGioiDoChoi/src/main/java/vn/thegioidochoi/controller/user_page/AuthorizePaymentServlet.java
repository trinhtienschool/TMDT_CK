package vn.thegioidochoi.controller.user_page;

import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;
import vn.thegioidochoi.model.order_product.OrderDetail;
import vn.thegioidochoi.model.order_product.OrderDetailPayPal;
import vn.thegioidochoi.model.order_product.PaymentServices;
import vn.thegioidochoi.model.user.Cart;
import vn.thegioidochoi.model.user.Cart_item;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.util.List;

@WebServlet(name = "AuthorizePaymentServlet", value = "/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Dang vao authorize_paymenttttttttttttttttt");
        PaymentServices paymentServices = new PaymentServices();
        if(request.getParameter("paymentId") !=null){
            String paymentId = request.getParameter("paymentId");
            String PayerID = request.getParameter("PayerID");
            try {
                Payment payment = paymentServices.executePayment(paymentId, PayerID);
                request.setAttribute("type","suc");
                response.sendRedirect("http://localhost:8082/order-handle");
            } catch (PayPalRESTException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PaymentServices paymentServices = new PaymentServices();
//        OrderDetailPayPal orderDetail = new OrderDetailPayPal(product, subtotal, shipping, tax, total);
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        double fee_ship = (double)session.getAttribute("fee_ship");
        String note = (String)session.getAttribute("order_note");
        String name = (String)session.getAttribute("order_name");
        String province = (String)session.getAttribute("order_province");
        String district = (String)session.getAttribute("order_district");
        String detail_address = (String)session.getAttribute("order_detail_address");
        String email = (String)session.getAttribute("order_email");

        OrderDetail orderDetail = new OrderDetail(fee_ship,note);
        for(Cart_item cart_item : cart.getProducts().values()){
            orderDetail.addProduct(cart_item.getName(),cart_item.getPrice_sale(),cart_item.getPrice(),cart_item.getQuantity());
        }

        try {

            String approvalLink = paymentServices.authorizePayment(orderDetail, name, province, district, detail_address,email);
            System.out.println(approvalLink);
            response.sendRedirect(approvalLink);

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("user_page/errorPayPal.jsp").forward(request, response);
        }
    }
}
