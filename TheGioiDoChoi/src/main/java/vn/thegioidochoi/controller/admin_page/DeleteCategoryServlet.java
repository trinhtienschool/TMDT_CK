package vn.thegioidochoi.controller.admin_page;


import vn.thegioidochoi.Dao.Notification_Con_DB;
import vn.thegioidochoi.Dao.ProductEntity;
import vn.thegioidochoi.Dao.Load_Category;


import vn.thegioidochoi.model.header_footer.Category;
import vn.thegioidochoi.model.util.Util;


import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebServlet(urlPatterns = "/admin_page/delete-category")
public class DeleteCategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("type");

        HttpSession session = request.getSession();

        if(type != null){
            if(type.equalsIgnoreCase("sub")){
                boolean isUpdate = ProductEntity.updateCategoryId(17,id);
                boolean isDelete = Load_Category.deleteCategory(id);
                System.out.println("is delete "+ isDelete);
                if(isDelete) {
                    Category category=Load_Category.loadCategoryById(id);
                    int user_id= (int) session.getAttribute("user_id");
                    System.out.println("gia tri cua id la"+id);
                    Notification_Con_DB.addNotification("Xóa category",category.getName()+"đã bị xóa và chuyển sang danh mục khác", Util.dateFormat(new Date()),user_id,user_id,user_id,1);
                    System.out.println("Da vao delete category");
                    response.sendRedirect("category");
                }
            } else if(type.equalsIgnoreCase("parent")){
                boolean isUpdate = Load_Category.updateMasterId(id);
                boolean isDelete = Load_Category.deleteCategory(id);
                System.out.println("is delete "+ isDelete);
                if(isDelete) {
                    Category category=Load_Category.loadCategoryById(id);
                    int user_id= (int) session.getAttribute("user_id");
                    System.out.println("gia tri cua id la"+id);
                    Notification_Con_DB.addNotification("Xóa category",category.getName()+"đã bị xóa và chuyển sang danh mục khác", Util.dateFormat(new Date()),user_id,user_id,user_id,1);

                    System.out.println("Da vao delete category");
                    response.sendRedirect("category");
                }
            }
        }

    }
}

