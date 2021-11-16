package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.mail.Mail;
import vn.thegioicaycanh.model.notifications.Notifications;
import vn.thegioicaycanh.model.user.ForgetPass;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.Load_ForgetPass;
import vn.thegioicaycanh.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/Notification_direct")
public class Notification_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("type")!=null){
            String type= request.getParameter("type");
            String listEmail= new Notifications().getListEmail();
                if(type.equalsIgnoreCase("coupon_code")){
                    String link = "http://localhost:8080/thegioicaycanh.vn/coupon_code?new_code=1";
                    String subject="Thông báo mới từ thế giới cây cảnh";
                    String content= "Chào bạn"
                            + "\n Đây là link mã khuyến mãi mới nhất. Bấm vào để đến mã khuyến mãi mới nhất\n"
                            +link;

                    Mail.sendMail(content,subject,listEmail);
                    System.out.println(listEmail);

                }else if(type.equalsIgnoreCase("shopping_sale")){
                    String link = "http://localhost:8080/thegioicaycanh.vn/shopping_sale?new_sale=1";
                    String subject="Thông báo mới từ thế giới cây cảnh";
                    String content= "Chào bạn"
                            + "\n Đây là link sản phẩm giảm giá mới nhất. Bấm vào để đến sản phẩm giảm giá mới nhất\n"
                            +link;

                    Mail.sendMail(content,subject,listEmail);
                    System.out.println(listEmail);
            }

        }
    }
}
