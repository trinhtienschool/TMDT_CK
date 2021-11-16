package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.order.Load_Order;
import vn.thegioicaycanh.model.order.Order;
import vn.thegioicaycanh.model.order_product.OrderProduct;
import vn.thegioicaycanh.model.order_product.OrderProduct_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/view_order")
public class View_order_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "total-report");
        request.setAttribute("title", "Chi tiết đơn hàng");
        System.out.println("Đã vào đây");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("Đã vào");
        String status = request.getParameter("status");
        if (status != null)
            Load_Order.updateStatusById(id, status);
        System.out.println();
        Order order = Load_Order.loadOrder_view(id);
        request.setAttribute("view_order", order);
        request.setAttribute("t_p",order.getTotal_pay());
        request.setAttribute("ship",order.getShip_price());
        double total = order.getTotal_pay()+order.getShip_price();
        request.setAttribute("total",total);
        List<OrderProduct> productList = OrderProduct_Con_DB.loadOrderProductByOrderId(id);
        request.setAttribute("list_pro", productList);
        request.getRequestDispatcher("view-order.jsp").forward(request, response);

    }
}
