package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.header_footer.Category;
import vn.thegioidochoi.model.supplier.Load_Supplier;
import vn.thegioidochoi.model.supplier.Supplier;
import vn.thegioidochoi.model.util.Util;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/admin_page/product","/vendor_page/product"})
public class Product_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","product");

        String product_id = "%";
        String product_name ="%";
        String category="%";
        String supplier = "%";
        String from_date = "20190101";
        String to_date = Util.dateFormat(new Date());

        List<Supplier> suppliers = Load_Supplier.loadSupplier_view();
        request.setAttribute("suppliers", suppliers);

        if(request.getParameter("product-id") !=null)
            product_id = request.getParameter("product-id").isEmpty()?product_id:request.getParameter("product-id");
        if(request.getParameter("product-name")!=null)
            product_name = request.getParameter("product-name").isEmpty()?product_name:request.getParameter("product-name");
        if(request.getParameter("category")!=null)
            category=request.getParameter("category");
        if(request.getParameter("supplier")!=null)
            supplier=request.getParameter("supplier");
        if(request.getParameter("from-date")!=null)
            from_date= request.getParameter("from-date").isEmpty()?from_date:Util.revertDate(request.getParameter("from-date"));
        if(request.getParameter("to-date")!=null)
            to_date= request.getParameter("to-date").isEmpty()?to_date:Util.revertDate(request.getParameter("to-date"));


        ServletContext context = getServletContext();
        List<Category> categories = (List<Category>) context.getAttribute("category");
        for(Category cate: categories){
            if(cate.getSlug().equalsIgnoreCase(category)){
                category = cate.getId()+"";
                break;
            }
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("role_id") == null){
            response.sendRedirect("../home");
            return;
        }
        int role_id = (int) session.getAttribute("role_id");

        List<Product> products = new ArrayList<>();
        if(role_id ==3 || role_id == 4) {
            products = ProductEntity.loadProductBy(supplier,product_id, product_name, category, from_date, to_date);

        }else if(role_id==2){
            int supplier_id = (int) session.getAttribute("supplier_id");
            products = ProductEntity.loadProductBy(supplier_id+"",product_id, product_name, category, from_date, to_date);
            System.out.println("Dang vao products role_id = 222222222222222");
        }else{
            response.sendRedirect("../home");
            return;
        }
        System.out.println(products);
        request.setAttribute("product",products);
        request.getRequestDispatcher("product.jsp").forward(request,response);
    }
}
