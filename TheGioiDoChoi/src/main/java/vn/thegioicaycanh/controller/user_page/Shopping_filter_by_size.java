package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.home_page.Home_page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/filter-size")
public class Shopping_filter_by_size extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page_menu","shopping");
        request.setAttribute("title","Mua sắm");
        request.setAttribute("home_page_data",new Home_page());
        request.setAttribute("new_pros", ProductEntity.loadNewProducts(9));
        request.setAttribute("shop_list",ProductEntity.filterProductBySize(2,1,9));
        request.getRequestDispatcher("user_page/shopping-list.jsp").forward(request,response);
    }
}
