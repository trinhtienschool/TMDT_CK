package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;
import vn.thegioicaycanh.model.util.Util;

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
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("page_menu","login");
        request.setAttribute("title","Đăng kí");

        //Khi moi vao sign-up
        if(request.getParameter("name")==null){
            request.setAttribute("status",1);
            request.setAttribute("status_content","");
            request.getRequestDispatcher("user_page/sign-up.jsp").forward(request,response);
            return;
        }
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
            request.getRequestDispatcher("user_page/sign-up.jsp").forward(request,response);
            return;
        }

        boolean isSaved=LoadUser.insertUser(name,email,password,phone,1,"20000101",address,1,1, Util.dateFormat(new Date()));
        if(isSaved){

            request.getRequestDispatcher("handle-login?login=user").forward(request,response);

        }else{
            request.setAttribute("status",2);
            request.setAttribute("status_content","Xảy ra lỗi, vui lòng thử lại");
            request.getRequestDispatcher("user_page/sign-up.jsp").forward(request,response);

        }

    }
}
