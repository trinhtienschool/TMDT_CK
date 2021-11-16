package vn.thegioicaycanh.controller.admin_page;

import com.google.gson.annotations.Until;
import vn.thegioicaycanh.model.header_footer.Category;
import vn.thegioicaycanh.model.header_footer.Load_Category;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/category")
public class Category_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "category");
        request.setAttribute("title", "Danh mục");
        String type = request.getParameter("type");
        if(type ==null){
            type ="1";
        }
        if(Integer.parseInt(type) == 1){
            List<Category>categories_view = Load_Category.loadCategory_view();
            request.setAttribute("c_view",categories_view);
            request.getRequestDispatcher("categories.jsp").forward(request,response);
        }else if(Integer.parseInt(type) == 2) {
            int id = Integer.parseInt(request.getParameter("id"));

        }
    }
}
