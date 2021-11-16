package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.user.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/cart-handle")
public class Add_cart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (request.getParameter("action") == null || request.getParameter("id") == null || request.getParameter("current-page") == null)
            return;
        //neu action = add
        //neu action = sub
        int product_id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        if (session.getAttribute("user_id") != null) {
            int user_id = (int)session.getAttribute("user_id");
            if (action.equalsIgnoreCase("add"))
                cart.addProduct(product_id,user_id);
            else if (action.equalsIgnoreCase("sub"))
                cart.subProduct(product_id,user_id);
            else if(action.equalsIgnoreCase("del"))
                cart.deleteProduct(product_id,user_id);
        }else{
            if(action.equalsIgnoreCase("add")) {
                System.out.println(cart);
                cart.addProduct(product_id);
                System.out.println(session.getAttribute("cart"));
            }
            else if(action.equalsIgnoreCase("sub"))
                cart.subProduct(product_id);
            else if(action.equalsIgnoreCase("del"))
                cart.deleteProduct(product_id);
//            session.setAttribute("cart",cart);
        }
        String currentPage = request.getParameter("current-page");
        double position = 0;
        if(request.getParameter("position")!=null){
            position = Double.parseDouble(request.getParameter("position"));
            request.setAttribute("position",position);
            request.getRequestDispatcher(currentPage).forward(request,response);
        }else request.getRequestDispatcher(currentPage).forward(request,response);

    }
}
