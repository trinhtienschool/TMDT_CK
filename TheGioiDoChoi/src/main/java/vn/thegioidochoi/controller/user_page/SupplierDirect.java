package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.Dao.ProductEntity;
import vn.thegioidochoi.Dao.Load_Supplier;
import vn.thegioidochoi.model.supplier.Supplier;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = "/supplier")
public class SupplierDirect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("supplier") == null){
            response.sendRedirect("/home");
            return;
        }
        Supplier supplier = Load_Supplier.loadSupplier(request.getParameter("supplier"));
        int supplier_id = supplier.getId();
        request.setAttribute("products", ProductEntity.loadListProductBySupplierId(supplier_id));
        request.setAttribute("count", ProductEntity.loadListProductBySupplierId(supplier_id).size());
        request.setAttribute("supplier", Load_Supplier.loadSupplier(supplier_id));
        request.getRequestDispatcher("user_page/supplier.jsp").forward(request,response);
    }
}
