package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.user.FavouriteListMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/add-favourist")
public class AddFavourite extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//        Cart cart = (Cart) session.getAttribute("cart");
        FavouriteListMap fl = (FavouriteListMap) session.getAttribute("favourist");
        if (request.getParameter("action") == null || request.getParameter("id") == null || request.getParameter("current-page") == null)
            return;
        //neu action = add
        //neu action = sub
        String currentPage = request.getParameter("current-page");
        int product_id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        double position = Double.parseDouble(request.getParameter("position"));
        request.setAttribute("position", position);
       request.setAttribute("position",position);

        if (session.getAttribute("user_id") != null) {
            int user_id = (int) session.getAttribute("user_id");
            if (action.equalsIgnoreCase("add"))
                fl.addProduct(user_id, product_id);
            else if (action.equalsIgnoreCase("sub"))
                fl.subProduct(user_id, product_id);
            request.getRequestDispatcher(currentPage).forward(request, response);
        }


    }
}
