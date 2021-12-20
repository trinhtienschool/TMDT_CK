package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.model.Product.ProductEntity;

import vn.thegioidochoi.model.header_footer.LoadHeaderFooter;
import vn.thegioidochoi.model.header_footer.Social_media;
import vn.thegioidochoi.model.home_page.Home_page;
import vn.thegioidochoi.model.user.Cart;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/home")
public class Home_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        initAttr();
        System.out.println("Day la trong home, da vo trang home");
        HttpSession session = request.getSession(false);
        if(session==null)
        {
            session = request.getSession();
            session.setAttribute("cart",new Cart());
        }
        if(request.getSession().getAttribute("user_id")!=null){
            System.out.println("Day la user_id: "+request.getSession().getAttribute("user_id"));
        }
        request.setAttribute("page_menu","home");
        request.setAttribute("title","Trang chủ");
//        request.setAttribute("home_page_data",new Home_page());
//        request.setAttribute("discount_pros",ProductEntity.loadDiscountProducts(8));
//        request.setAttribute("hight_light_pros",ProductEntity.loadHightLightProducts());
//        request.setAttribute("most_rating",ProductEntity.loadMostRating(9));
//        request.setAttribute("new_pros",ProductEntity.loadNewProducts(9));
//        request.setAttribute("for_you",ProductEntity.loadFirstPros(9));
        request.getRequestDispatcher("user_page/home.jsp").forward(request,response);
    }
    protected void initAttr(){
        ServletContext context = getServletContext();

        if(context.getAttribute("header") == null) {
            context.setAttribute("header",LoadHeaderFooter.loadHeader());
            context.setAttribute("category",LoadHeaderFooter.loadCategories());
        }
        if(context.getAttribute("address") == null){
            context.setAttribute("address",LoadHeaderFooter.loadAdress());
        }
        if(context.getAttribute("social_media") == null){
            context.setAttribute("social_media",new Social_media());
        }
    }
}
