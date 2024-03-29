
package vn.thegioidochoi.controller.user_page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/warranty")
public class Warranty_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("title","Bảo hành");
        int order_id = Integer.parseInt(request.getParameter("order_id"));
        int user_id = (int) session.getAttribute("user_id");
        int pro_id = Integer.parseInt(request.getParameter("pro_id"));
        System.out.println("order_id: "+ order_id +", user_id: " + user_id + ", pro_id: " + pro_id);
//        boolean isInsert = LoadWarranty.insertWarranty(order_id,user_id,pro_id);
        request.getRequestDispatcher("user_page/warranty.jsp").forward(request,response);
    }
}

