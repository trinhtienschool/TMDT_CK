package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.Dao.ProductEntity;
import vn.thegioidochoi.Dao.Coupon_Con_DB;
import vn.thegioidochoi.model.user.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

@WebServlet(urlPatterns = "/cart")
public class Cart_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int checkSubMoney=0;
        int couponCodeId = 0;
        System.out.println("");
        HttpSession session = request.getSession();
        if(request.getParameter("code")!=null && session.getAttribute("user_id")!=null){
            String code = request.getParameter("code");
            int user_id = (int)session.getAttribute("user_id");
            int[] checkCouponcode = Coupon_Con_DB.checkSubMoney(user_id,code,1);
            if(checkCouponcode!=null) {
                checkSubMoney=checkCouponcode[0];
                couponCodeId=checkCouponcode[1];
            }
            System.out.println("Day la checkSubMoney: "+checkSubMoney);
            System.out.println("user_id "+user_id);

        }
        request.setAttribute("title", "Giỏ hàng");
        request.setAttribute("page_menu", "null");

//        int id=Integer.parseInt(request.getParameter("id"));


        int id=(int) ((Math.random() * (267 - 1)) + 1);;
        System.out.println("id"+id);
        Product products= ProductEntity.loadProductById(id);
        int cateid=products.getCategory_id();
        List<Product> loveableproducts= ProductEntity.loadRelativeProduct(cateid,id);

        Cart cart = (Cart)session.getAttribute("cart");
        cart.setCoupon_code_id(couponCodeId);
        cart.setPriceSaled(cart.getTotalPrice()*(100-checkSubMoney)/100);
        Collection cart_items = cart.getProducts().values();
        request.setAttribute("cis",cart_items);
        System.out.println("Cart: "+request.getAttribute("cis"));
        request.setAttribute("loveableproducts",loveableproducts);
        request.setAttribute("fp_ori",cart.getTotalPrice());
        request.setAttribute("fp_sale",cart.getTotalPrice()*checkSubMoney/100);
        request.setAttribute("fp_new",cart.getTotalPrice()*(100-checkSubMoney)/100);
        request.getRequestDispatcher("user_page/shopping_cart.jsp").forward(request, response);
    }
}
