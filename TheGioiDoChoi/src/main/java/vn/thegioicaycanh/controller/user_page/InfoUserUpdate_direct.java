package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.user.LoadUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebServlet(urlPatterns = "/updateinfouser")
public class InfoUserUpdate_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int user_id = (int)session.getAttribute("user_id");
        if(request.getParameter("name")!=null && request.getParameter("email")!=null&&request.getParameter("district")!=null){
            String name=request.getParameter("name");
            String birthday=request.getParameter("birthday");
            int phone= Integer.parseInt(request.getParameter("phone"));
            String email=request.getParameter("email");
            String city=request.getParameter("city");
            String district=request.getParameter("district");
            String ward=request.getParameter("ward");
            String detailadddresss=request.getParameter("detailaddress");
            LoadUser.updateUser(name,birthday,phone,email,city,district,ward,detailadddresss,user_id);
        }
    }


}
