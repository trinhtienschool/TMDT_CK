package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.favorist_list.Favorist_list_Con_DB;
import vn.thegioidochoi.model.order.Load_Order;
import vn.thegioidochoi.model.rating.Rating_Con_DB;
import vn.thegioidochoi.model.shopping_cart.Load_Shopping_Cart;
import vn.thegioidochoi.model.user.LoadUser;
import vn.thegioidochoi.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/users")
public class Users_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("active")!=null&&request.getParameter("user_id")!=null){
            int active=Integer.parseInt(request.getParameter("active"));
            int user_id=Integer.parseInt(request.getParameter("user_id"));
                LoadUser.updateUserActiveById(active,user_id);
                Rating_Con_DB.updateRatingActiveById(active,user_id);
                Favorist_list_Con_DB.updateFavoristlistActiveById(active,user_id);
                Load_Order.updateOrderActiveById(active,user_id);
                Load_Shopping_Cart.updateOrderActiveById(active,user_id);
        }

        request.setAttribute("current_page","user");
        List<User> users=LoadUser.loadUserFormSql("select * from user WHERE (active = 1)\n" +
                "OR (active = 0)");
        request.setAttribute("users", users);
        request.getRequestDispatcher("users.jsp").forward(request,response);
    }
}
