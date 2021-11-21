package vn.thegioicaycanh.controller.user_page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(urlPatterns = "/aboutus")
public class Aboutus_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("title","Về chúng tôi");
//        boolean isInsert = LoadWarranty.insertWarranty(order_id,user_id,pro_id);
        request.getRequestDispatcher("user_page/aboutus.jsp").forward(request,response);
    }
}