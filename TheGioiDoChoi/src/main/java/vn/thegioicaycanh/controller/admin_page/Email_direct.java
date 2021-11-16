package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.notifications.Notification_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin_page/email")
public class Email_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","email");
        request.setAttribute("emails", Notification_Con_DB.loadNotificationsFormSql("select * from notifications"));
        System.out.println(request.getAttribute("emails"));
        request.getRequestDispatcher("email.jsp").forward(request,response);

    }
}
