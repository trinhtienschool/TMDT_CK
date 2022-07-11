package vn.thegioidochoi.google_login;


import vn.thegioidochoi.controller.user_page.Login_handle;
import vn.thegioidochoi.Dao.LoadUser;
import vn.thegioidochoi.model.user.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/handle-google-login")
public class HandleGoogleFacebookLogin extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String id = request.getParameter("id");
            System.out.println("Co vao handle-gg-loginnnnnnnnnnnnnnnnn");
            User user_same_email = LoadUser.loadAUserByEmailGG_FB(email,id);

            //Kiem tra xem email da duoc dang ki chua
            if(user_same_email !=null){
                loginForRegisEmailByGGFB(request, response, user_same_email);
            }
            else if(LoadUser.loadAUserByEmail(email)!=null){
                checkRegisEmailNormal(request, response);
            }
            else {
                //neu email chua duoc dang ki, luu email
                signUpEmail(request, response, name, email, id);
            }
    }

    private void signUpEmail(HttpServletRequest request, HttpServletResponse response, String name, String email, String id) throws ServletException, IOException {
        boolean isSaved = LoadUser.saveUserLoginByFb_GG(email, name, id);
        if (isSaved) {
            Login_handle.deleteAvailableSession(request);
            User user = LoadUser.loadAUserByEmail(email);
            Login_handle.successLogin(request, response, user);
        } else {
            Login_handle.notifyError(2, "Đã xảy ra lỗi, vui lòng đăng nhập lại!", request, response);
        }
    }

    private void checkRegisEmailNormal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Login_handle.notifyError(2,"Email đã được đăng kí trước đó, vui lòng đăng nhập",request,response);
    }

    private void loginForRegisEmailByGGFB(HttpServletRequest request, HttpServletResponse response, User user_same_email) throws ServletException, IOException {
        Login_handle.deleteAvailableSession(request);
        Login_handle.successLogin(request, response, user_same_email);
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);


    }
}
