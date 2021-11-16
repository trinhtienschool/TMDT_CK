package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.notifications.Notification_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/email_footer")
public class Email_footer_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        System.out.println(email);
        boolean isInsert = Notification_Con_DB.insertEmail(email,1);
        request.getRequestDispatcher("home").forward(request,response);
    }
}
