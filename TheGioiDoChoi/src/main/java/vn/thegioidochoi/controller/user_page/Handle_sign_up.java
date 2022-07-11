package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.model.mail.Mail;
import vn.thegioidochoi.model.user.EmailConfirm;
import vn.thegioidochoi.Dao.LoadUser;
import vn.thegioidochoi.model.user.User;
import vn.thegioidochoi.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(urlPatterns = "/handle-sign-up")
public class Handle_sign_up extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page_menu","login");
        request.setAttribute("title","Đăng kí");
        int user_role = 1;
        if(request.getParameter("vendor-sign-up") != null){
            user_role = 2;
        }
        if(request.getParameter("confirm") !=null){
            confirmEmail(request, response, user_role);
            return;
        }

        //Khi moi vao sign-up
        if(request.getParameter("name")==null){
            enterSignUp(request, response);
            return;
        }
        signUp(request, response, user_role);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void signUp(HttpServletRequest request, HttpServletResponse response, int user_role) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String warm = request.getParameter("warm");
        String address = request.getParameter("address");
        String password = request.getParameter("new-pass");
        address +=","+warm+","+district+","+city;

        User user = LoadUser.loadAUserByEmail(email);
        if(user!=null){
            request.setAttribute("status",2);
            request.setAttribute("status_content","Email đã được đăng kí trước đó, vui lòng đăng kí bằng email khác");
            request.getRequestDispatcher("user_page/sign-up.jsp").forward(request, response);
            return;
        }

        boolean isSaved=LoadUser.insertUser(name,email,password,phone,1,"20000101",address,0, user_role, Util.dateFormat(new Date()));
        if(isSaved){
            int code_key = (int) ((Math.random() * (999999 - 111111)) + 111111);
            LoadUser.saveEmailConfirm(email,name, code_key);
            String content = "Xin chào bạn "+name+",<br>\n" +
                    "Cảm ơn bạn đã đăng kí tài khoản tại Thegioidochoi<br>\n" +
                    "Mã xác nhận email của bạn là: "+code_key+" mã có hiệu lực trong 5 phút<br>\n" +
                    "Trân trọng,<br>\n" +
                    "Thegioidochoi";
            Mail.sendMail(content,"Xác nhận email",email);
            request.setAttribute("email",email);
            if(user_role ==2){
                request.setAttribute("vendor_sign_up",true);
            }
            request.setAttribute("status",3);
            request.getRequestDispatcher("user_page/sign-up.jsp").forward(request, response);
        }else{
            request.setAttribute("status",2);
            request.setAttribute("status_content","Xảy ra lỗi, vui lòng thử lại");
            request.getRequestDispatcher("user_page/sign-up.jsp").forward(request, response);

        }
    }

    private void enterSignUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("status",1);
        request.setAttribute("status_content","");
        if(request.getParameter("vendor-sign-up") !=null)
            request.setAttribute("vendor_sign_up",true);
        request.getRequestDispatcher("user_page/sign-up.jsp").forward(request, response);
    }

    private void confirmEmail(HttpServletRequest request, HttpServletResponse response, int user_role) throws ServletException, IOException {
        String email_confirm = request.getParameter("email");
        String code = request.getParameter("code").trim();
        EmailConfirm emailConfirm= LoadUser.loadEmailConfirm(email_confirm);
        if(emailConfirm != null) {
            if (System.currentTimeMillis() - emailConfirm.getTime_created() > 1000*60*5) {
                request.setAttribute("status", 2);
                request.setAttribute("message", "Mã xác nhận đã hết hạn, vui lòng đăng ký lại");
                LoadUser.deleteUser(emailConfirm.getEmail());
                request.getRequestDispatcher("user_page/sign-up.jsp").forward(request, response);
            }
            else if (emailConfirm.getCode() == Integer.parseInt(code) ) {
                boolean status = LoadUser.updateActiveEmail(email_confirm);
                LoadUser.deleteEmailConfirm(email_confirm);
                if (status) {
                    if(user_role ==1) {
                        request.setAttribute("status", 2);
                        request.setAttribute("status_content", "Đăng ký tài khoản thành công, vui lòng đăng nhập");
                        request.getRequestDispatcher("user_page/Login.jsp").forward(request, response);
                    }else{
                        User user = LoadUser.loadAUserByEmail(email_confirm);
                        request.setAttribute("status", 2);
                        request.setAttribute("status_content", "Đăng ký tài khoản thành công, vui lòng đăng ký thông tin cửa hàng");
                        request.setAttribute("user_id", user.getId());
                        request.getRequestDispatcher("user_page/vendor-sign-up.jsp").forward(request, response);
                    }

                }
            } else {
                request.setAttribute("message", "Mã xác nhận không đúng, vui lòng thử lại");
                request.setAttribute("email", email_confirm);
                request.setAttribute("status", 3);
                request.getRequestDispatcher("user_page/sign-up.jsp").forward(request, response);
            }

        }
    }
}
