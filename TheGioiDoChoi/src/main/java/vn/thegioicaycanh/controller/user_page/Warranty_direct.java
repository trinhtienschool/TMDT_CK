
package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.feeback.Feedback;
import vn.thegioicaycanh.model.feeback.Load_Feedback;
import vn.thegioicaycanh.model.order.Load_Order;
import vn.thegioicaycanh.model.order.Order;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;
import vn.thegioicaycanh.model.warranty.LoadWarranty;
import vn.thegioicaycanh.model.warranty.Warranty;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

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

