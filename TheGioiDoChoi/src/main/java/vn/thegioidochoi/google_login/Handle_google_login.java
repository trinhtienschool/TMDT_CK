package vn.thegioidochoi.google_login;


import vn.thegioidochoi.controller.user_page.Login_handle;
import vn.thegioidochoi.model.user.LoadUser;
import vn.thegioidochoi.model.user.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/handle-google-login")
public class Handle_google_login extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String id = request.getParameter("id");
        System.out.println("Co vao handle-gg-loginnnnnnnnnnnnnnnnn");
        User user_same_email = LoadUser.loadAUserByEmailGG_FB(email,id);

        //Kiem tra xem email da duoc dang ki chua
        if(user_same_email !=null){
            Login_handle.deleteAvailableSession(request);
           Login_handle.successLogin(request,response,user_same_email);
        }
        else if(LoadUser.loadAUserByEmail(email)!=null){
            Login_handle.notifyError(2,"Email đã được đăng kí trước đó, vui lòng đăng nhập",request,response);
        }
        else {
            //neu email chua duoc dang ki, luu email
            boolean isSaved = LoadUser.saveUserLoginByFb_GG(email, name,id);
            if (isSaved) {
                Login_handle.deleteAvailableSession(request);
                User user = LoadUser.loadAUserByEmail(email);
                Login_handle.successLogin(request, response, user);
            } else {
                Login_handle.notifyError(2, "Đã xảy ra lỗi, vui lòng đăng nhập lại!", request, response);
            }
        }

    }
}
