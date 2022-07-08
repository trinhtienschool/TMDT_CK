package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.mail.Mail;
import vn.thegioidochoi.model.order.Load_Order;
import vn.thegioidochoi.model.order.Order;
import vn.thegioidochoi.model.order_product.OrderProduct;
import vn.thegioidochoi.model.order_product.OrderProduct_Con_DB;
import vn.thegioidochoi.model.user.LoadUser;
import vn.thegioidochoi.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/order_detail")
public class Order_detail_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        System.out.println("Gia trị session tại order_detail+"+session.getAttribute("user_id"));
        if(session.getAttribute("user_id")==null){
            request.getRequestDispatcher("admin_page/error404.jsp").forward(request,response);
        }
        request.setAttribute("title", "Chi tiết đơn hàng");
        int order_id = Integer.parseInt(request.getParameter("id"));
        if(request.getParameter("delete")!=null){
            int delete = Integer.parseInt(request.getParameter("delete"));
            if(delete==1){
                String subject="Thông báo hủy đặt hàng";

                String link="http://localhost:8080/user";

                String content= "Chào "+session.getAttribute("user_name")+"."
                        + "\n"+ "Đây là thông báo về hủy đơn hàng của bạn."+link;
                String receiveEmail= (String) session.getAttribute("user_mail");
                System.out.println("mail nhan thong bao la"+receiveEmail);
                Mail.sendMail(content,subject,receiveEmail);
                Load_Order.updateOrderStatusActiveByOrderId(-1,1,order_id);
            }
        }
        Order order = Load_Order.loadOrder_view(order_id);
        User user = LoadUser.loadUserById(order.getSupplier_id());
        System.out.println(user.getName());
        request.setAttribute("user", user);
        request.setAttribute("order",order);
        System.out.println(order.getStatus());
        List<OrderProduct> productList = OrderProduct_Con_DB.loadOrderProductByOrderId(order_id);
        for(OrderProduct op: productList){
            Product product = ProductEntity.loadProductById(op.getPro_id());
            op.setPro_slug(product.getSlug());
        }
        double sum = 0;
        for (OrderProduct o: productList){
            sum += o.getTotal();
        }
        double ship = order.getShip_price();
        double total_money = sum + ship;
        request.setAttribute("sum",sum);
        request.setAttribute("ship",ship);
        request.setAttribute("total_money",total_money);
        request.setAttribute("plist", productList);
        request.getRequestDispatcher("user_page/order-detail.jsp").forward(request,response);
    }

}
