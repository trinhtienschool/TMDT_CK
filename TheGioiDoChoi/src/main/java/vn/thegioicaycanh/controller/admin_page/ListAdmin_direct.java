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
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/list-admin")
public class ListAdmin_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("role_id")==null){

            System.out.println("Url: "+request.getRequestURL());
            System.out.println("query: "+request.getQueryString());
            response.sendRedirect("../handle-login?logout=true");
            return;
        }
        if((int)session.getAttribute("role_id")!=3){
            response.sendRedirect("../handle-login?logout=true");
            return;
        }
        request.setAttribute("current_page","admin-list");
        List<User> admins = LoadUser.loadUserFromSQL("select * from user where role_id>1");
        request.setAttribute("admins",admins);
        request.getRequestDispatcher("list-admin.jsp").forward(request,response);
    }
}
