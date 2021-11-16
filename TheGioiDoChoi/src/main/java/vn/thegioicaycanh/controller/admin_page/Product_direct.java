package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/product")
public class Product_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","product");

        String product_id = "%";
        String product_name ="%";
        String category="%";
        String from_date = "20190101";
        String to_date = Util.dateFormat(new Date());

        if(request.getParameter("product-id") !=null)
            product_id = request.getParameter("product-id").isEmpty()?product_id:request.getParameter("product-id");
        if(request.getParameter("product-name")!=null)
            product_name = request.getParameter("product-name").isEmpty()?product_name:request.getParameter("product-name");
        if(request.getParameter("category")!=null)
            category=request.getParameter("category");
        if(request.getParameter("from-date")!=null)
            from_date= request.getParameter("from-date").isEmpty()?from_date:Util.revertDate(request.getParameter("from-date"));
        if(request.getParameter("to-date")!=null)
            to_date= request.getParameter("to-date").isEmpty()?to_date:Util.revertDate(request.getParameter("to-date"));

        if(category.equalsIgnoreCase("cay-de-ban")) category = "1";
        if(category.equalsIgnoreCase("cay-day-leo")) category = "2";
        if(category.equalsIgnoreCase("cay-tet")) category = "3";
        if(category.equalsIgnoreCase("cay-thuy-sinh")) category = "4";
        if(category.equalsIgnoreCase("cay-trong-nha")) category = "5";
        if(category.equalsIgnoreCase("cay-ngoai-vuon")) category = "6";
        List<Product> products = ProductEntity.loadProductBy(product_id,product_name,category,from_date,to_date);
        request.setAttribute("product",products);
        request.getRequestDispatcher("product.jsp").forward(request,response);
    }
}
