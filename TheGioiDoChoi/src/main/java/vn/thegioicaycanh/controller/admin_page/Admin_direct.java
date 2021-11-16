package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin_page/admin")
public class Admin_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session != null){
            User user = LoadUser.loadAUserByEmail((String) session.getAttribute("user_mail"));
            session.setAttribute("user_name", user.getName());
            session.setAttribute("user_birth", user.getBirthday());
            session.setAttribute("user_phone", user.getPhone());
            session.setAttribute("user_id", user.getId());
            getDetailAddress(user.getAddress(), session);
            session.setAttribute("current_page", "user-info");
            session.setAttribute("title", "Thông tin admin");
            request.getRequestDispatcher("admin-profile.jsp").forward(request,response);
        } else{
            System.out.println("Ban can dang nhap");
            request.getRequestDispatcher("Login.jsp");
        }

    }

    protected void getDetailAddress(String address, HttpSession session) {
        String [] arr = address.split(",");
        String city = arr[arr.length-1];
        String district = arr[arr.length-2];
        String ward = arr[arr.length-3];
        String detail = "";
        for(int i=0; i< arr.length-3;i++){
            detail += arr[i] + " ";
        }
        session.setAttribute("city", city);
        session.setAttribute("district", district);
        session.setAttribute("ward", ward);
        session.setAttribute("detail", detail);
    }
}
