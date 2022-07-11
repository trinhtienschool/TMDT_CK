package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.Dao.Load_Order;
import vn.thegioidochoi.model.order.Order;
import vn.thegioidochoi.Dao.LoadOrderProgress;
import vn.thegioidochoi.model.order_progress.OrderProgress;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/order_progress")
public class Oder_progress_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("title", "Theo dõi đơn hàng");
        int order_id = Integer.parseInt(request.getParameter("id"));
        Order order = Load_Order.loadOrder_view(order_id);
        List<OrderProgress> progresses = LoadOrderProgress.loadOrderProgressById(order_id);
        request.setAttribute("progress", progresses);
        request.setAttribute("order", order);
        request.getRequestDispatcher("user_page/order-progress.jsp").forward(request, response);
    }
}
