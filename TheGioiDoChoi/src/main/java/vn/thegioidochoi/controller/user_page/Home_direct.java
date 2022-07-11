package vn.thegioidochoi.controller.user_page;
import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.Dao.ProductEntity;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.Dao.LoadHeaderFooter;
import vn.thegioidochoi.model.header_footer.Social_media;
import vn.thegioidochoi.Dao.Load_Supplier;
import vn.thegioidochoi.model.user.Cart;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/home")
public class Home_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        initAttr();
//        System.out.println("Day la trong home, da vo trang home");
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
        request.setAttribute("best_supplier", Load_Supplier.loadBestSupplier(10));
//        request.setAttribute("home_page_data",new Home_page());
        request.setAttribute("dps",ProductEntity.loadDiscountProducts(10));
        request.setAttribute("bps",ProductEntity.loadBestSellerProducts());
        request.setAttribute("hlps",ProductEntity.loadHighLightProducts());
        request.setAttribute("sps",ProductEntity.loadSmartToys());
        request.setAttribute("cps",ProductEntity.loadCharacterToys());
        request.setAttribute("tps",ProductEntity.loadTransportationToys());
//        request.setAttribute("most_rating",ProductEntity.loadMostRating(9));
        List<Product> nps = ProductEntity.loadNewProducts(10);
        request.setAttribute("nps",nps);
        ServletContext context = getServletContext();
        context.setAttribute("nps",nps);
//        request.setAttribute("for_you",ProductEntity.loadFirstPros(9));
        System.out.println("Ac;tive:::::::::::::::::::::::::::::::::::::::::"+DBCPDataSource.getNumActive());
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
