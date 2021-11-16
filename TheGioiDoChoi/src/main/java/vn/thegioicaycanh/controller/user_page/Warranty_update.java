package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.warranty.LoadWarranty;
import vn.thegioicaycanh.model.warranty.Warranty;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/warrantity_update")
public class Warranty_update extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int order_id = Integer.parseInt(request.getParameter("order_id"));
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        int pro_id = Integer.parseInt(request.getParameter("pro_id"));
        String title = request.getParameter("war_title");
        String message = request.getParameter("description");
        String date_created = request.getParameter("date_created");
        int status = 0;
        String email = request.getParameter("mail");
        boolean isInsert = LoadWarranty.insertWarranty(order_id,user_id,pro_id,email,status,title,message);
        if (isInsert)
            status=1;
        request.getRequestDispatcher("user_page/warranty.jsp").forward(request,response);

    }
}
