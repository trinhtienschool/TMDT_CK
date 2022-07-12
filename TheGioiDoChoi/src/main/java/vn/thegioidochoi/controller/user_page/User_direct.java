package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.Dao.ProductEntity;
import vn.thegioidochoi.model.coupon_code.CouponCode;
import vn.thegioidochoi.Dao.Coupon_Con_DB;
import vn.thegioidochoi.Dao.Load_Order;
import vn.thegioidochoi.model.order.Order;
import vn.thegioidochoi.Dao.LoadUser;
import vn.thegioidochoi.model.user.User;
import vn.thegioidochoi.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/user")
public class User_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
       if(request.getParameter("passwd")!=null){
           if(session !=null){
               User user = LoadUser.loadUserById((int)session.getAttribute("user_id"));
               long pass = Util.hashPass(Util.dateFormat(user.getDate_created()),user.getEmail(),request.getParameter("passwd-old"));
               if(pass == user.getPassword()){
                   String passNew= request.getParameter("passwd");
                   int user_id = (int)session.getAttribute("user_id");
                   LoadUser.changePassword(user_id,(String) session.getAttribute("user_email"),passNew);
                   request.setAttribute("status",2);
                   request.setAttribute("status_content","Cập nhật mật khẩu thành công");

               }else{
                   request.setAttribute("status",2);
                   request.setAttribute("status_content","Sai mật khẩu cũ");

               }
           }else{
               request.setAttribute("status",2);
               request.setAttribute("status_content","Cập nhật mật khẩu thất bại");

           }

       }
        if(request.getParameter("city")!=null){
            System.out.println("Cập nhật userrrrrrrrrrrrrrrrrrrrrrrrrr");
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
            session.setAttribute("user_about", user.getAbout());
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
        if(arr.length <3){
            session.setAttribute("city", "");
            session.setAttribute("district", "");
            session.setAttribute("ward", "");
            session.setAttribute("detail", address);
            return;
        }
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
