package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/shop-detail")
public class ShopDetail_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page_menu","shopping");
        request.setAttribute("title","Chi tiết sản phẩm");
        int id=Integer.parseInt(request.getParameter("id"));
        Product products= ProductEntity.loadProductById(id);
        Product prostar5=ProductEntity.loadCountStarByIdProAndIdStar(id,1);
        Product prostar4=ProductEntity.loadCountStarByIdProAndIdStar(id,2);
        Product prostar3=ProductEntity.loadCountStarByIdProAndIdStar(id,3);
        Product prostar2=ProductEntity.loadCountStarByIdProAndIdStar(id,4);
        Product prostar1=ProductEntity.loadCountStarByIdProAndIdStar(id,5);
        Product procountcomment=ProductEntity.loadCountCommentByIdPro(id);
        Product proavgstar=ProductEntity.loadCountAvgstarByIdPro(id);

        int cateid=products.getCategory_id();
        List<Product> relaproducts=ProductEntity.loadRelativeProduct(cateid,id);
        List<User> users= LoadUser.loadOrderCommentByIdUser(id);
        request.setAttribute("product",products);

        int totalratestar=prostar5.getCountstar()+prostar4.getCountstar()+prostar3.getCountstar()+prostar2.getCountstar()+prostar1.getCountstar();
        request.setAttribute("id",id);
        request.setAttribute("prostar5",prostar5);
        request.setAttribute("prostar4",prostar4);
        request.setAttribute("prostar3",prostar3);
        request.setAttribute("prostar2",prostar2);
        request.setAttribute("prostar1",prostar1);
        request.setAttribute("totalratestar",totalratestar);
        request.setAttribute("procountcomment",procountcomment);
        request.setAttribute("proavgstar",proavgstar);
        request.setAttribute("relaproducts",relaproducts);
        request.setAttribute("usercomment",users);
        request.getRequestDispatcher("user_page/shop-detail.jsp").forward(request,response);
    }
}
