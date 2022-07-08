package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.order.Load_Order;
import vn.thegioidochoi.model.order.Order;
import vn.thegioidochoi.model.supplier.Load_Supplier;
import vn.thegioidochoi.model.supplier.Supplier;
import vn.thegioidochoi.model.user.LoadUser;
import vn.thegioidochoi.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/admin_page/dashboard", "/vendor_page/dashboard"})
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
        if (session.getAttribute("role_id") != null) {
            System.out.println("Dang trong ngoai if dashboardddddddddddddddddddd");
            int role_id = (int) session.getAttribute("role_id");
            if (role_id == 3 || role_id == 4) {
                int countUser = LoadUser.loadSumOfUser("select count(id) from user");
                request.setAttribute("c_user", countUser);
                // total product
                int countProduct = ProductEntity.sumOfProduct("select count(id) from product");
                request.setAttribute("c_product", countProduct);
                // total supplier
                int countSupplier = Load_Supplier.sumOf("select count(id) from supplier");
                request.setAttribute("c_supplier", countSupplier);
                // cac don dat hang gan nhat
                List<Order> orderList = Load_Order.loadOrderNear(0, 5);
                request.setAttribute("orderlist", orderList);
                System.out.println("Dang o dashboardddddddddddddddddddd");
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            } else if (role_id == 2) {
                LocalDate currentdate = LocalDate.now();
                int currentMonth = currentdate.getMonthValue();
                List<Integer> date_range = new ArrayList<>();
                for(int i = 1; i<=currentMonth; i++){
                    date_range.add(i);
                }
                request.setAttribute("date_range", date_range);
                int supplier_id = (int) session.getAttribute("supplier_id");
                if (request.getParameter("action") != null) {

                    String[] array = null;
                    if (request.getParameter("type-range") != null) {
                        String from = request.getParameter("from")!=null?request.getParameter("from"): Util.dateFormatNoTime(new Date());
                        String to = request.getParameter("to")!=null?request.getParameter("to"): Util.dateFormatNoTime(new Date());
                        array = Load_Supplier.getMonthFromTo(supplier_id, from, to);
                    } else {
                        String type_revenue = request.getParameter("type-revenue");
                        request.setAttribute("type_revenue", type_revenue);
                        if (type_revenue.equals("month"))
                            array = Load_Supplier.getMonthChart(supplier_id);
                        else if (type_revenue.equals("year-month"))
                            array = Load_Supplier.getYear_Month_Chart(supplier_id);
                        else if (type_revenue.equals("year-quarter"))
                            array = Load_Supplier.getYear_Quarter_Chart(supplier_id);
                        else if (type_revenue.equals("week"))
                            array = Load_Supplier.getWeekChart(supplier_id);
                        else if (type_revenue.equals("quarter"))
                            array = Load_Supplier.getQuarterChart(supplier_id);
                    }

                    request.setAttribute("labels_revenue", array[0]);
                    request.setAttribute("data_revenue", array[1]);

                    String type_revenue_circle = request.getParameter("type-revenue-circle");
                    request.setAttribute("type_revenue_circle", type_revenue_circle);

                    String[] arr= Load_Supplier.getCircleCategoryChart(supplier_id,type_revenue_circle);
                    request.setAttribute("labels_circle", arr[0]);
                    request.setAttribute("data_circle", arr[1]);
                } else {
                    request.setAttribute("type_revenue", "week");
                    String[] array = Load_Supplier.getWeekChart(supplier_id);
                    request.setAttribute("labels_revenue", array[0]);
                    request.setAttribute("data_revenue", array[1]);

                    request.setAttribute("type_revenue_circle", currentMonth);
                    String[] arr= Load_Supplier.getCircleCategoryChart(supplier_id,currentMonth+"");
                    request.setAttribute("labels_circle", arr[0]);
                    request.setAttribute("data_circle", arr[1]);
                }

                int no_order = Load_Supplier.sumOf("select count(*) from `order` where supplier_id = " + supplier_id + " and month(date_created)=month(curdate())");
                request.setAttribute("no_order", no_order);
                // total product
                int countProduct = ProductEntity.sumOfProduct("select count(*) from product where supplier_id= " + supplier_id);
                request.setAttribute("c_product", countProduct);
                // total supplier
                int countRevenue = Load_Supplier.sumOf("select SUM((o.total_price)*(100-o.commission_rate)/100) from `order` o join supplier s on o.supplier_id = s.id where supplier_id= " + supplier_id + " and Month(o.date_created) = Month(CurDate())");
                request.setAttribute("c_revenue", countRevenue);
                int currentTop = Load_Supplier.sumOf("select sup_rank.rank from supplier s join (\n" +
                        "select r.supplier_id as sup_id, sum(r.total_price*(100-r.commission_rate)/100) as total, DENSE_RANK() OVER (ORDER BY total desc) as rank\n" +
                        "from `order` r JOIN supplier s on r.supplier_id = s.id where month(r.date_created) = month(curdate() - interval 1 month) and year(r.date_created)= year(curdate()) GROUP BY r.supplier_id, s.logo, s.company_name\n" +
                        "ORDER BY total DESC) as sup_rank on s.id = sup_rank.sup_id where s.id = " + supplier_id);
                request.setAttribute("currenttop", currentTop);
                Supplier supplier = Load_Supplier.loadSupplier(supplier_id);
                request.setAttribute("commission", supplier.getCommission_rate());
                int countsupplier = Load_Supplier.sumOf("select count(*) from supplier");
                request.setAttribute("countsupplier",countsupplier);
                // cac don dat hang gan nhat
                List<Order> orderList = Load_Order.loadOrderNear(supplier_id, 5);
                request.setAttribute("orderlist", orderList);
                request.setAttribute("top3bestsup", Load_Supplier.loadTopSupplierWithOderTable(3));
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            }
        }


    }
}
