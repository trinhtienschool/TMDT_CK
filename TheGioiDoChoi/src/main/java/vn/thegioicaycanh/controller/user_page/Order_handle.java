package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.coupon_code.Coupon_Con_DB;
import vn.thegioicaycanh.model.order.Load_Order;
import vn.thegioicaycanh.model.order_product.OrderProduct;
import vn.thegioicaycanh.model.order_product.OrderProduct_Con_DB;
import vn.thegioicaycanh.model.user.Cart;
import vn.thegioicaycanh.model.user.Cart_item;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collection;
import java.util.Date;

@WebServlet(urlPatterns = "/order-handle")
public class Order_handle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Xu li neu nguoi dung da dang nhap
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String sd = request.getParameter("sub-district");
        String da = request.getParameter("d-address");
        String address = da + "," + sd + "," + district + "," + province;
        String password = "";
        if (request.getParameter("password") != null)
            password = request.getParameter("password");

        String note = request.getParameter("note");
        HttpSession session = request.getSession();


        int user_id = 0;
        if (session.getAttribute("user_id") != null) {
            user_id = (int) session.getAttribute("user_id");
        } else {
            boolean createNewUser = LoadUser.insertUser(name, email, password, phone, 1, "20000101", address, 1, 1, Util.dateFormat(new Date()));
            if (!createNewUser) {
                request.setAttribute("type", "err");
                request.getRequestDispatcher("user_page/checkout.jsp").forward(request, response);
                return;
            }
            user_id = LoadUser.getMaxUserId();
        }

        if(session.getAttribute("fast-checkout")==null) {
            Cart cart = (Cart) session.getAttribute("cart");
            Collection<Cart_item> cart_items = cart.getProducts().values();
            double total_price = cart.getTotalPriceCheckout();
            int coupon_code_id = cart.getCoupon_code_id();

            int idSaved = Load_Order.addOrder(user_id, coupon_code_id, cart.getMaxTypeWeight(), note, phone, address, 3, Util.dateFormat(new Date()), total_price);
            System.out.println("idSaved: " + idSaved);
            int count = 0;
            if (idSaved != 0) {

                for (Cart_item ci : cart_items) {
                    count += OrderProduct_Con_DB.addOrderProduct(idSaved, ci.getId(), ci.getQuantity(), ci.getPrice(), 1, ci.getTotalPrice());
                }
            }
            if (idSaved != 0 && count != 0) {
                request.setAttribute("type", "suc");
                Coupon_Con_DB.deleteCouponCode(user_id, coupon_code_id);
                cart.refeshCart(user_id);
                cart = new Cart(user_id);
                session.setAttribute("cart", cart);
            } else {
                request.setAttribute("type", "err");
            }
            if(session.getAttribute("total-price")!=null)
                session.removeAttribute("total-price");
        }else{
            double total_price = (double)session.getAttribute("total-price");
            int type_weight= (int)session.getAttribute("type_weight");
            int pro_id = (int) session.getAttribute("pro_id");
            double pro_price = (double) session.getAttribute("price");
            int idSaved = Load_Order.addOrder(user_id, 0, type_weight, note, phone, address, 3, Util.dateFormat(new Date()), total_price);
            System.out.println("idSaved: " + idSaved);
            int count = 0;
            if (idSaved != 0) {
                count = OrderProduct_Con_DB.addOrderProduct(idSaved, pro_id, 1, pro_price, 1,pro_price);
            }
            if (idSaved != 0 && count != 0) {
                request.setAttribute("type", "suc");
            } else {
                request.setAttribute("type", "err");
            }
            session.removeAttribute("total-price");
            session.removeAttribute("fast-checkout");
            session.removeAttribute("type_weight");
            session.removeAttribute("pro_id");
            session.removeAttribute("price");

        }
        System.out.println("Xuong toi day");
        request.getRequestDispatcher("checkout").forward(request, response);


    }

}
