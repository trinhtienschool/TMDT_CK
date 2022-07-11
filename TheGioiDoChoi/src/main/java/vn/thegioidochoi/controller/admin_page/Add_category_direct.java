package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.header_footer.Category;
import vn.thegioidochoi.Dao.Load_Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/add-category")
public class Add_category_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "category");
        String type = request.getParameter("type");
        List<Category> parentCategories = Load_Category.loadParentCategories();
        System.out.println("Danh sách danh mục cha: " + parentCategories);

        if(type != null){
            if(type.equalsIgnoreCase("enterAdd")){
                request.setAttribute("type","add");
                request.setAttribute("title","Thêm danh mục");
                request.setAttribute("parentlist", parentCategories);
                request.getRequestDispatcher("add-category.jsp").forward(request,response);
                return;
            } else if(type.equalsIgnoreCase("enterEdit")){
                request.setAttribute("type","edit");
                request.setAttribute("title","Chỉnh sửa danh mục");
                request.setAttribute("parentlist", parentCategories);
                int id = Integer.parseInt(request.getParameter("id"));
                Category category = Load_Category.loadCategoryById(id);
                request.setAttribute("category", category);
                request.getRequestDispatcher("add-category.jsp").forward(request, response);
                return;
            }
        }
        String name = request.getParameter("name");
        int active = request.getParameter("active")==null ? 0 : 1;
        String slug= request.getParameter("slug");

        if(type.equalsIgnoreCase("add")){
            request.setAttribute("type", "add");
            request.setAttribute("title", "Thêm danh mục");
            boolean isUpdate=false;
            if(active==1) {
                boolean isInsert = Load_Category.insertCategory(name, active, slug, 0);
                int new_id = Load_Category.loadNewIdOfCategory();
                isUpdate = Load_Category.updateMasterIdCategory(new_id);
            } else if (active==0){
                int master_id = Integer.parseInt(request.getParameter("list_cate"));
                isUpdate = Load_Category.insertCategory(name, active, slug, master_id);
            }
            if(isUpdate){
                System.out.println("Đã thực hiện câu lệnh sql");
                request.getRequestDispatcher("add-category.jsp").forward(request, response);
            }
        } else if(type.equalsIgnoreCase("edit")){
            int id = Integer.parseInt(request.getParameter("id"));
            int master_id = Integer.parseInt(request.getParameter("list_cate"));
            request.setAttribute("type", "edit");
            request.setAttribute("title","Chỉnh sửa danh mục");
            System.out.println("da vao edit danh muc");
            boolean isUpdate = Load_Category.updateCategory(id,name,active,slug,master_id);
            Category category = Load_Category.loadCategoryById(id);
            request.setAttribute("category", category);
            request.getRequestDispatcher("add-category.jsp").forward(request, response);
        }
    }
}
