package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.favorist_list.Favorist_list_Con_DB;
import vn.thegioidochoi.model.mail.Mail;
import vn.thegioidochoi.model.order.Load_Order;
import vn.thegioidochoi.model.order.Order;
import vn.thegioidochoi.model.rating.Rating_Con_DB;
import vn.thegioidochoi.model.shopping_cart.Load_Shopping_Cart;
import vn.thegioidochoi.model.supplier.Load_Supplier;
import vn.thegioidochoi.model.supplier.Supplier;
import vn.thegioidochoi.model.user.LoadUser;
import vn.thegioidochoi.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/supplier")
public class    Supplier_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("active")!=null&&request.getParameter("supplier_id")!=null){
            int active=Integer.parseInt(request.getParameter("active"));
            int supplier_id=Integer.parseInt(request.getParameter("supplier_id"));

            ProductEntity.updateProductActiveBySupplierId(active,supplier_id);
            Load_Supplier.updateSupplierActiveById(active,supplier_id);
//            Load_Order.updateOrderStatusBySupplierId(6,supplier_id);
           if(active==-1){

               Load_Order.updateOrderActiveBySupplierId(active,supplier_id);

               String subject="Thông báo hủy đơn hàng";
               String link="http://localhost:8080/order_detail?id=";
               Supplier supplier=Load_Supplier.loadSupplierById(supplier_id);

               List<User> listUsers= LoadUser.loadUserWithStatusOrder(5,supplier_id);
               List<Order> listOrders=Load_Order.loadOrderByStatus(5,supplier_id);

               for(int i=0;i<listUsers.size();i++){
                   System.out.println("danh sach khach hang nhan email"+listUsers.get(i).getEmail()+"\n"+
                           "order id ="+listOrders.get(i).getId());
                   String content= "Chào "+listUsers.get(i).getName()+"."
                           + "\n"+ "Đây là thông báo về việc hủy đơn hàng của bạn. Bấm vào Link bên dưới để xem thông tin đơn hàng."+"\n"
                           +link+listOrders.get(i).getId();

                   Mail.sendMail(content,subject,listUsers.get(i).getEmail());
               }
//                for(User u: LoadUser.loadUserWithStatusOrder(3)){
////                    Mail.sendMail(content,subject,u.getEmail());
//                    System.out.println("danh sach khach hang nhan email"+u.getEmail());
//                }

           }

        }
        request.setAttribute("current_page", "supplier");
        request.setAttribute("title", "Nhà cung cấp");
        List<Supplier> supplierList = Load_Supplier.loadSupplier_view();
        request.setAttribute("sup_view", supplierList);
        System.out.println(request.getAttribute("sup_view"));
        request.getRequestDispatcher("supplier.jsp").forward(request, response);
    }
}
