package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.user.Load_ForgetPass;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ChangePassword_direct")
public class ChangePassword_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int user_id = (int)session.getAttribute("user_id");
        if(request.getParameter("newpassword")!=null && request.getParameter("renewpassword")!=null){
            int newpassword = Integer.parseInt(request.getParameter("newpassword"));
            Load_ForgetPass.updateNewPass(newpassword,user_id);
        }
    }
}
