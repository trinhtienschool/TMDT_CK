package vn.thegioicaycanh.controller.vendor_page;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(urlPatterns = "/vendor_view_order")
public class Vendor_view_order_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("title","Danh sách đơn hàng");
//        boolean isInsert = LoadWarranty.insertWarranty(order_id,user_id,pro_id);
        request.getRequestDispatcher("vendor_page/vendor-view-order.jsp").forward(request,response);
    }
}
