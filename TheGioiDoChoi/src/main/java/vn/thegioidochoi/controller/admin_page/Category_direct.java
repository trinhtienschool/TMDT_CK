package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.header_footer.Category;
import vn.thegioidochoi.model.header_footer.Load_Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/category")
public class Category_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "category");
        System.out.println("Co vao category list");
        request.setAttribute("title", "Danh mục");
        List<Category> categories = Load_Category.loadAllCategories();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("categories.jsp").forward(request, response);
    }
}
