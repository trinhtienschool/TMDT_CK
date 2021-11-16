package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.order.Load_Order;
import vn.thegioicaycanh.model.order.Order;
import vn.thegioicaycanh.model.rating_type.Rating_Type;
import vn.thegioicaycanh.model.rating_type.Rating_Type_Con_DB;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/edit_user")
public class Edit_user_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println(request.getRequestURL().toString());
//        System.out.println(request.getQueryString());

        request.setAttribute("current_page", "user");
        request.setAttribute("title", "Sửa thông tin người dùng");
        String type = request.getParameter("type");
        if (type.equalsIgnoreCase("enteredit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            User user = LoadUser.loadUserById(id);
            List<Order> order= Load_Order.loadOrderByIdUser(id);
            List<Product> fproduct= ProductEntity.loadFavorateByIdUser(id);
            List<Order> ordproduct= Load_Order.loadOrderStatusByIdUser(id);
            request.setAttribute("user", user);
            request.setAttribute("productadd",order);
            request.setAttribute("favproduct",fproduct);
            request.setAttribute("ordproduct",ordproduct);
            request.getRequestDispatcher("edit-users.jsp").forward(request, response);
            return;
        }
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String sex=request.getParameter("sex");
        long password=Long.parseLong(request.getParameter("password"));
        String birthday=request.getParameter("birthday");
        String createddate=request.getParameter("createddate");

        if(type.equalsIgnoreCase("edit")){
            int id = Integer.parseInt(request.getParameter("usercode"));
            request.setAttribute("type", "edit");
            request.setAttribute("title","Sửa thông tin người dùng");
            request.setAttribute("id",id);
//            boolean isUpdate=Rating_Type_Con_DB.updateRating_Type(id,name,active);
            boolean isUpdate=LoadUser.updateUserInAdimin(id,email,password,name,sex,createddate,address,createddate);
//            Rating_Type rating_type= Rating_Type_Con_DB.loadRating_TypeById(id);
//            request.setAttribute("ratingstype", rating_type);
//            request.getRequestDispatcher("add-ratingstype.jsp").forward(request, response);
            User user = LoadUser.loadUserById(id);
            List<Order> order= Load_Order.loadOrderByIdUser(id);
            List<Product> fproduct= ProductEntity.loadFavorateByIdUser(id);
            List<Order> ordproduct= Load_Order.loadOrderStatusByIdUser(id);
            request.setAttribute("user", user);
            request.setAttribute("productadd",order);
            request.setAttribute("favproduct",fproduct);
            request.setAttribute("ordproduct",ordproduct);
            System.out.println(email+name+address+sex+password+birthday+createddate);
            request.getRequestDispatcher("edit-users.jsp").forward(request, response);

        }
    }
}
