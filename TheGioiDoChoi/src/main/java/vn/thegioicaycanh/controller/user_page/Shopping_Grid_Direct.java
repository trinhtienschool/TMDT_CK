package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.header_footer.LoadHeaderFooter;
import vn.thegioicaycanh.model.header_footer.Social_media;
import vn.thegioicaycanh.model.home_page.Home_page;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/shopping-grid")
public class Shopping_Grid_Direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pages =0;
        if(request.getParameter("pages") != null);
            pages = Integer.parseInt(request.getParameter("pages"));
        request.setAttribute("pages",pages);
        request.setAttribute("type_page","shopping-grid");
        request.setAttribute("numOfItemLoad",18);
        request.setAttribute("direct_to","user_page/shopping-grid.jsp");
        request.setAttribute("sql","select * from product limit ");
        request.setAttribute("countsql","select count(*) from product");
        request.setAttribute("page_menu","shopping");
        request.setAttribute("title","Mua sắm");
        request.setAttribute("home_page_data",new Home_page());
        request.setAttribute("new_pros",ProductEntity.loadNewProducts(9));
        request.getRequestDispatcher("handlePagination").forward(request,response);

    }
}
