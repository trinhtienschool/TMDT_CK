package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.header_footer.Category;
import vn.thegioicaycanh.model.header_footer.Load_Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin_page/add-category")
public class Add_category_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "category");
        String type = request.getParameter("type");
        if(type != null){
            if(type.equalsIgnoreCase("enterAdd")){
                request.setAttribute("type","add");
                request.setAttribute("title","Thêm danh mục");
                request.getRequestDispatcher("add-category.jsp").forward(request,response);
                return;
            } else if(type.equalsIgnoreCase("enterEdit")){
                request.setAttribute("type","edit");
                request.setAttribute("title","Chỉnh sửa danh mục");
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
            boolean isInsert = Load_Category.insertCategory(name,active,slug);
            if(isInsert){
                System.out.println("Đã thực hiện câu lệnh sql");
                request.getRequestDispatcher("add-category.jsp").forward(request, response);
            }
        } else if(type.equalsIgnoreCase("edit")){
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("type", "edit");
            request.setAttribute("title","Chỉnh sửa danh mục");
            System.out.println("da vao edit danh muc");
            boolean isUpdate = Load_Category.updateCategory(id,name,active,slug);
            Category category = Load_Category.loadCategoryById(id);
            request.setAttribute("category", category);
            request.getRequestDispatcher("add-category.jsp").forward(request, response);
        }
    }
}
