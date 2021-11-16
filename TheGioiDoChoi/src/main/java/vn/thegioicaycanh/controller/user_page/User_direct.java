package vn.thegioicaycanh.controller.user_page;

import org.apache.http.HttpRequest;
import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.coupon_code.Coupon_Con_DB;
import vn.thegioicaycanh.model.coupon_code_type.CouponCodeType;
import vn.thegioicaycanh.model.coupon_code_type.CouponCodeType_Con_DB;
import vn.thegioicaycanh.model.favorist_list.FavoristList;
import vn.thegioicaycanh.model.favorist_list.Favorist_list_Con_DB;
import vn.thegioicaycanh.model.order.Load_Order;
import vn.thegioicaycanh.model.order.Order;
import vn.thegioicaycanh.model.order_product.OrderProduct;
import vn.thegioicaycanh.model.order_product.OrderProduct_Con_DB;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;
import vn.thegioicaycanh.model.user_code.UserCode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/user")
public class User_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
       if(request.getParameter("passwd")!=null){
           String pass= request.getParameter("passwd");
           int user_id = (int)session.getAttribute("user_id");
           LoadUser.changePassword(user_id,(String) session.getAttribute("user_email"),pass);
       }
        if(request.getAttribute("city")!=null){
            int user_id = (int)session.getAttribute("user_id");
            String name=request.getParameter("fullName");
            String birthday=request.getParameter("birthday");
            int phone= Integer.parseInt(request.getParameter("mobile"));
            String email=request.getParameter("email");
            String city=request.getParameter("city");
            String district=request.getParameter("district");
            String ward=request.getParameter("ward");
            String detailadddresss=request.getParameter("address");
            LoadUser.updateUser(name,birthday,phone,email,city,district,ward,detailadddresss,user_id);
        }
        if(session != null){
            System.out.println(LoadUser.loadAUserByEmail((String) session.getAttribute("user_mail")));
            User user = LoadUser.loadAUserByEmail((String) session.getAttribute("user_mail"));
            session.setAttribute("user_name", user.getName());
            session.setAttribute("user_birth", user.getBirthday());
            session.setAttribute("user_phone", user.getPhone());
            session.setAttribute("user_id", user.getId());
            session.setAttribute("user_email",user.getEmail());
            session.setAttribute("user_avatar",user.getAvatar());
            getDetailAddress(user.getAddress(), session);
            // Ma giam gia
            List<CouponCode> couponCodes = Coupon_Con_DB.loadCouponCodeByUserId(user.getId());
            session.setAttribute("coupon_code", couponCodes);
            for (CouponCode c : couponCodes) {
                System.out.println(c.getName());
            }
            // Don hang cua toi
            int order_id = 0;
            List<Order> orders = Load_Order.loadOderByUserId(user.getId());
            request.setAttribute("order", orders);
            // San pham yeu thich
            List<Product> favoristLists = ProductEntity.loadFavoriteProduct(user.getId());
            session.setAttribute("favorite", favoristLists);
            session.setAttribute("title", "Trang của tôi");
            request.getRequestDispatcher("user_page/user.jsp").forward(request, response);
        } else {
            System.out.println("session ko co gi het");
            request.getRequestDispatcher("user_page/Login.jsp").forward(request, response);
        }
    }

    // Tach dia chi
    protected void getDetailAddress(String address, HttpSession session) {
        String[] arr = address.split(",");
        String city = arr[arr.length - 1];
        String district = arr[arr.length - 2];
        String ward = arr[arr.length - 3];
        String detail = "";
        for (int i = 0; i < arr.length - 3; i++) {
            detail += arr[i] + " ";
        }
        session.setAttribute("city", city);
        session.setAttribute("district", district);
        session.setAttribute("ward", ward);
        session.setAttribute("detail", detail);
    }
}
