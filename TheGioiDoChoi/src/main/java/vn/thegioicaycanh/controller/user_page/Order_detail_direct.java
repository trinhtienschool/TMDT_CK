package vn.thegioicaycanh.controller.user_page;

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

@WebServlet(urlPatterns = "/order_detail")
public class Order_detail_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("title", "Chi tiết đơn hàng");
        int order_id = Integer.parseInt(request.getParameter("id"));
        Order order = Load_Order.loadOrder_view(order_id);
        request.setAttribute("order",order);
        List<OrderProduct> productList = OrderProduct_Con_DB.loadOrderProductByOrderId(order_id);
        double sum = 0;
        for (OrderProduct o: productList){
            sum += o.getTotal();
        }
        double ship = order.getShip_price();
        double total_money = sum + ship;
        request.setAttribute("sum",sum);
        request.setAttribute("ship",ship);
        request.setAttribute("total_money",total_money);
        request.setAttribute("p_list", productList);
        request.getRequestDispatcher("user_page/order-detail.jsp").forward(request,response);
    }
}
