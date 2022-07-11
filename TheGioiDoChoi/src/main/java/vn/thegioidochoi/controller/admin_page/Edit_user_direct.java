package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.Dao.ProductEntity;
import vn.thegioidochoi.Dao.Load_Order;
import vn.thegioidochoi.model.order.Order;
import vn.thegioidochoi.Dao.LoadUser;
import vn.thegioidochoi.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
        if (editUser(request, response, type)) return;
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String sex=request.getParameter("sex");
        long password=Long.parseLong(request.getParameter("password"));
        String birthday=request.getParameter("birthday");
        String createddate=request.getParameter("createddate");
        int active = request.getParameter("activeuser")==null?0:1;

        if(type.equalsIgnoreCase("edit")){
            int id = Integer.parseInt(request.getParameter("usercode"));
            request.setAttribute("type", "edit");
            request.setAttribute("title","Sửa thông tin người dùng");
            request.setAttribute("id",id);
//            boolean isUpdate=Rating_Type_Con_DB.updateRating_Type(id,name,active);
            boolean isUpdate=LoadUser.updateUserInAdimin(id,email,password,name,sex,createddate,address,createddate,active);
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

    private boolean editUser(HttpServletRequest request, HttpServletResponse response, String type) throws ServletException, IOException {
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
            return true;
        }
        return false;
    }
}
