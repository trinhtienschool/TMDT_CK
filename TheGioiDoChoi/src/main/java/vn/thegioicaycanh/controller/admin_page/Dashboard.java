package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.order.Load_Order;
import vn.thegioicaycanh.model.order.Order;
import vn.thegioicaycanh.model.supplier.Load_Supplier;
import vn.thegioicaycanh.model.user.LoadUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/dashboard")
public class Dashboard extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "dashboard");
        request.setAttribute("title", "Dashboard");
        // total user
        int countUser = LoadUser.sumOfUser("select count(id) from user");
        request.setAttribute("c_user", countUser);
        // total product
        int countProduct = ProductEntity.sumOfProduct("select count(id) from product");
        request.setAttribute("c_product", countProduct);
        // total supplier
        int countSupplier = Load_Supplier.sumOfSupplier("select count(id) from supplier");
        request.setAttribute("c_supplier", countSupplier);
        // cac don dat hang gan nhat
        List<Order> orderList = Load_Order.loadOrderNear(5);
        request.setAttribute("orderlist", orderList);
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
