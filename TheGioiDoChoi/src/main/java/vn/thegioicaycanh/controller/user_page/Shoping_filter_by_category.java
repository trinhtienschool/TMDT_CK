package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.home_page.Home_page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/filter-category-shopping")
public class Shoping_filter_by_category extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pages = request.getParameter("pages");
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id",id);
        request.setAttribute("pages",Integer.parseInt(pages));
        request.setAttribute("type_page","filter-category-shopping");
        request.setAttribute("numOfItemLoad",18);
        request.setAttribute("direct_to","user_page/shopping-grid.jsp");
        request.setAttribute("sql","SELECT * FROM product WHERE category_id = "+id+" LIMIT ");
        request.setAttribute("countsql","select count(*) from product WHERE category_id = "+id);
        request.setAttribute("page_menu","shopping");
        request.setAttribute("title","Mua sắm");
        request.setAttribute("home_page_data",new Home_page());
        request.setAttribute("new_pros", ProductEntity.loadNewProducts(9));
        request.getRequestDispatcher("handlePagination").forward(request,response);
    }
}
