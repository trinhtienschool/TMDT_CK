package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.order.Load_Order;
import vn.thegioidochoi.model.order.Order;
import vn.thegioidochoi.model.user.LoadUser;
import vn.thegioidochoi.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/vendor_page/customers")
public class CustomerListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("title","Khách hàng");
        request.setAttribute("current_page","customers");
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("supplier_id");
        List<Order> orders = Load_Order.loadOrderBySupplierId(id);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("customer-list.jsp").forward(request, response);
    }
}
