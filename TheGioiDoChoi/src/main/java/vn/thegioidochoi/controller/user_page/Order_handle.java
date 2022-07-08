package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.coupon_code.Coupon_Con_DB;
import vn.thegioidochoi.model.order.Load_Order;
import vn.thegioidochoi.model.order_product.OrderProduct_Con_DB;
import vn.thegioidochoi.model.supplier.Load_Supplier;
import vn.thegioidochoi.model.supplier.Supplier;
import vn.thegioidochoi.model.user.Cart;
import vn.thegioidochoi.model.user.Cart_item;
import vn.thegioidochoi.model.user.LoadUser;
import vn.thegioidochoi.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet(urlPatterns = "/order-handle")
public class Order_handle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Xu li neu nguoi dung da dang nhap
        HttpSession session = request.getSession();
        String payment_method = "cash";
        if (request.getParameter("status_order") !=null && request.getParameter("status_order").equalsIgnoreCase("enter_order")) {
            if (request.getParameter("paypal_payment") != null)
                payment_method = "paypal";
            if (request.getParameter("cash_payment") != null)
                payment_method = "cash";
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


            session.setAttribute("order_name", name);
            session.setAttribute("order_phone", phone);
            session.setAttribute("order_email", email);
            session.setAttribute("order_province", province);
            session.setAttribute("order_district", district);
            session.setAttribute("order_detail_address",da+" , "+sd);
            session.setAttribute("order_address", address);
            session.setAttribute("order_note", note);


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
            session.setAttribute("order_user_id", user_id);
        }

        if (payment_method.equalsIgnoreCase("paypal")) {
            request.getRequestDispatcher("authorize_payment").forward(request, response);
            return;
        }

        String name = (String) session.getAttribute("order_name");
        String phone = (String) session.getAttribute("order_phone");
        String email = (String) session.getAttribute("order_email");
        String address = (String) session.getAttribute("order_address");
        String note = (String) session.getAttribute("order_note");
        int user_id = (int) session.getAttribute("order_user_id");


        if (session.getAttribute("fast-checkout") == null) {
            Cart cart = (Cart) session.getAttribute("cart");
            Collection<Cart_item> cart_items = cart.getProducts().values();
            Map<Integer, List<Cart_item>> orders = new HashMap<Integer, List<Cart_item>>();
            for (Cart_item cart_item : cart_items) {
                if (orders.keySet().contains(cart_item.getVendor_id()))
                    orders.get(cart_item.getVendor_id()).add(cart_item);
                else {
                    List<Cart_item> list = new ArrayList<Cart_item>();
                    list.add(cart_item);
                    orders.put(cart_item.getVendor_id(), list);
                }
            }
            boolean isFalse = false;
            for (int vendor_id : orders.keySet()) {
                System.out.println("vendor_idddddddd: " + vendor_id);
                List<Cart_item> order = orders.get(vendor_id);
                double total_price = 0;
                for (Cart_item cart_item : order) {
                    total_price += cart_item.getTotalPrice();
                }
                int coupon_code_id = cart.getCoupon_code_id();
                Supplier supplier_ = Load_Supplier.loadSupplierById(vendor_id);
                int idSaved = Load_Order.addOrder(user_id, coupon_code_id, note, phone, address, 3, Util.dateFormat(new Date()), total_price + 20000, vendor_id,supplier_.getCommission_rate());
                System.out.println("idSaved: " + idSaved);


                if (idSaved == 0) {
                    request.setAttribute("type", "err");
                    request.getRequestDispatcher("user_page/checkout.jsp").forward(request, response);
                    return;
                }
                if (idSaved != 0) {
                    for (Cart_item ci : order) {
                        int saved = OrderProduct_Con_DB.addOrderProduct(idSaved, ci.getId(), ci.getQuantity(), ci.getPriceForCal(), 1, ci.getTotalPrice());
                        if (saved == 0) {
                            isFalse = true;
                            break;
                        }
                        Coupon_Con_DB.deleteCouponCode(user_id, coupon_code_id);
                    }

                }
            }
            if (!isFalse) {
                request.setAttribute("type", "suc");
                cart.refeshCart(user_id);
                cart = new Cart(user_id);
                session.setAttribute("cart", cart);
            } else {
                request.setAttribute("type", "err");
            }
            if (session.getAttribute("total-price") != null)
                session.removeAttribute("total-price");

        } else {
            double total_price = (double) session.getAttribute("total-price");

            int pro_id = (int) session.getAttribute("pro_id");
            Product product = ProductEntity.loadProductById(pro_id);
            double pro_price = (double) session.getAttribute("price");
            int supplier = product.getSupplier_id();
            Supplier supplier_ = Load_Supplier.loadSupplierById(supplier);
            int idSaved = Load_Order.addOrder(user_id, 0, note, phone, address, 3, Util.dateFormat(new Date()), total_price + 20000, product.getSupplier_id(),supplier_.getCommission_rate());
            System.out.println("idSaved: " + idSaved);
            int count = 0;
            if (idSaved != 0) {
                count = OrderProduct_Con_DB.addOrderProduct(idSaved, pro_id, 1, pro_price, 1, pro_price);
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
