package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.supplier.Load_Supplier;
import vn.thegioicaycanh.model.supplier.Supplier;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/supplier")
public class    Supplier_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "supplier");
        request.setAttribute("title", "Nhà cung cấp");
        List<Supplier> supplierList = Load_Supplier.loadSupplier_view();
        request.setAttribute("sup_view", supplierList);
        System.out.println(request.getAttribute("sup_view"));
        request.getRequestDispatcher("supplier.jsp").forward(request, response);
    }
}
