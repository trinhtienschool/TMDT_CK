package vn.thegioicaycanh.controller.admin_page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin_page/admin-login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session !=null){
            if(session.getAttribute("isAdmin")!=null){
                request.setAttribute("loginedAdmin",true);
                request.setAttribute("direct-page","admin_page/setting");//TODO
                request.getRequestDispatcher("../handle-login").forward(request,response);
            }
        }

    }
}
