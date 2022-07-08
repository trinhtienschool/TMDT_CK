package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.header_footer.Load_Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin_page/delete-category")
public class DeleteCategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("type");
        if(type != null){
            if(type.equalsIgnoreCase("sub")){
                boolean isUpdate = ProductEntity.updateCategoryId(17,id);
                boolean isDelete = Load_Category.deleteCategory(id);
                System.out.println("is delete "+ isDelete);
                if(isDelete) {
                    System.out.println("Da vao delete category");
                    response.sendRedirect("category");
                }
            } else if(type.equalsIgnoreCase("parent")){
                boolean isUpdate = Load_Category.updateMasterId(id);
                boolean isDelete = Load_Category.deleteCategory(id);
                System.out.println("is delete "+ isDelete);
                if(isDelete) {
                    System.out.println("Da vao delete category");
                    response.sendRedirect("category");
                }
            }
        }

    }
}
