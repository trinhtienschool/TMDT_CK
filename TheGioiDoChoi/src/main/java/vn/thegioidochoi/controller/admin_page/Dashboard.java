package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.order.Load_Order;
import vn.thegioidochoi.model.order.Order;
import vn.thegioidochoi.model.supplier.Load_Supplier;
import vn.thegioidochoi.model.user.LoadUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin_page/dashboard","/vendor_page/dashboard"})
public class Dashboard extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "dashboard");
        request.setAttribute("title", "Dashboard");
        // total user
        HttpSession session = request.getSession();
        System.out.println("Dang o ngoai if dashboardddddddddddddddddddd");
        if(session.getAttribute("role_id") !=null){
            System.out.println("Dang trong ngoai if dashboardddddddddddddddddddd");
            int role_id = (int)session.getAttribute("role_id");
            if(role_id ==3 || role_id ==4) {
                int countUser = LoadUser.loadSumOfUser("select count(id) from user");
                request.setAttribute("c_user", countUser);
                // total product
                int countProduct = ProductEntity.sumOfProduct("select count(id) from product");
                request.setAttribute("c_product", countProduct);
                // total supplier
                int countSupplier = Load_Supplier.sumOf("select count(id) from supplier");
                request.setAttribute("c_supplier", countSupplier);
                // cac don dat hang gan nhat
                List<Order> orderList = Load_Order.loadOrderNear(0,5);
                request.setAttribute("orderlist", orderList);
                System.out.println("Dang o dashboardddddddddddddddddddd");
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            }else if(role_id ==2){
                int supplier_id = (int)session.getAttribute("supplier_id");
                int no_order = Load_Supplier.sumOf("select count(*) from `order` where supplier_id = "+supplier_id+ " and month(date_created)=month(curdate())");
                request.setAttribute("no_order", no_order);
                // total product
                int countProduct = ProductEntity.sumOfProduct("select count(*) from product where supplier_id= "+supplier_id);
                request.setAttribute("c_product", countProduct);
                // total supplier
                int countRevenue = Load_Supplier.sumOf("select SUM((o.total_price)*(100-s.commission_rate)/100) from `order` o join supplier s on o.supplier_id = s.id where supplier_id= "+supplier_id+" and Month(o.date_created) = Month(CurDate())");
                request.setAttribute("c_revenue", countRevenue);
                int currentTop = Load_Supplier.sumOf("select sup_rank.rank from supplier s join (\n" +
                        "select r.supplier_id as sup_id, sum(r.total_price*(100-s.commission_rate)/100) as total, DENSE_RANK() OVER (ORDER BY total desc) as rank\n" +
                        "from `order` r JOIN supplier s on r.supplier_id = s.id where month(r.date_created) = month(curdate() - interval 1 month) and year(r.date_created)= year(curdate()) GROUP BY r.supplier_id, s.logo, s.company_name\n" +
                        "ORDER BY total DESC) as sup_rank on s.id = sup_rank.sup_id where s.id = "+supplier_id);
                request.setAttribute("currenttop", currentTop);
                // cac don dat hang gan nhat
                List<Order> orderList = Load_Order.loadOrderNear(supplier_id,5);
                request.setAttribute("orderlist", orderList);
                request.setAttribute("top3bestsup",Load_Supplier.loadTopSupplierWithOderTable(3));
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            }
        }


    }
}
