package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.Dao.ProductEntity;
import vn.thegioidochoi.Dao.Load_Order;
import vn.thegioidochoi.model.order.Order;
import vn.thegioidochoi.Dao.Load_Supplier;
import vn.thegioidochoi.model.supplier.Supplier;
import vn.thegioidochoi.Dao.LoadUser;
import vn.thegioidochoi.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/admin_page/dashboard", "/vendor_page/dashboard"})
public class Dashboard_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "dashboard");
        request.setAttribute("title", "Dashboard");
        // total user
        HttpSession session = request.getSession();
        System.out.println("Dang o ngoai if dashboardddddddddddddddddddd");
        LocalDate currentdate = LocalDate.now();
        int currentMonth = currentdate.getMonthValue();
        List<Integer> date_range = new ArrayList<>();
        for(int i = 1; i<=currentMonth; i++){
            date_range.add(i);
        }
        request.setAttribute("date_range", date_range);
        if (session.getAttribute("role_id") != null) {
            System.out.println("Dang trong ngoai if dashboardddddddddddddddddddd");
            int role_id = (int) session.getAttribute("role_id");
            if (role_id == 3 || role_id == 4) {
                if(request.getParameter("supplier")!=null){
                    loadRevenueSupplier(request, response,session, currentMonth);
                    return;
                }
                getRevenueAdmin(request, response, currentMonth);
            } else if (role_id == 2) {
//                LocalDate currentdate = LocalDate.now();
//                int currentMonth = currentdate.getMonthValue();
//                List<Integer> date_range = new ArrayList<>();
//                for(int i = 1; i<=currentMonth; i++){
//                    date_range.add(i);
//                }
//                request.setAttribute("date_range", date_range);
                loadRevenueSupplier(request, response, session, currentMonth);
            }
        }


    }

    private void loadRevenueSupplier(HttpServletRequest request, HttpServletResponse response, HttpSession session, int currentMonth) throws ServletException, IOException {
        String supplier_id="";
        if(request.getParameter("supplier")!=null){
            supplier_id =  request.getParameter("supplier");
        }
        else supplier_id = String.valueOf((int) session.getAttribute("supplier_id"));
        if (request.getParameter("action") != null) {

            String[] array = null;
            if (request.getParameter("type-range") != null) {
                String from = request.getParameter("from")!=null? request.getParameter("from"): Util.dateFormatNoTime(new Date());
                String to = request.getParameter("to")!=null? request.getParameter("to"): Util.dateFormatNoTime(new Date());
                array = Load_Supplier.getMonthFromTo(supplier_id, from, to, false);
            } else {
                String type_revenue = request.getParameter("type-revenue");
                request.setAttribute("type_revenue", type_revenue);
                if (type_revenue.equals("month"))
                    array = Load_Supplier.getMonthChart(supplier_id,false);
                else if (type_revenue.equals("year-month"))
                    array = Load_Supplier.getYear_Month_Chart(supplier_id,false);
                else if (type_revenue.equals("year-quarter"))
                    array = Load_Supplier.getYear_Quarter_Chart(supplier_id,false);
                else if (type_revenue.equals("week"))
                    array = Load_Supplier.getWeekChart(supplier_id,false);
                else if (type_revenue.equals("quarter"))
                    array = Load_Supplier.getQuarterChart(supplier_id,false);
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
            String[] array = Load_Supplier.getWeekChart(supplier_id,false);
            request.setAttribute("labels_revenue", array[0]);
            request.setAttribute("data_revenue", array[1]);

            request.setAttribute("type_revenue_circle", currentMonth);
            String[] arr= Load_Supplier.getCircleCategoryChart(supplier_id, currentMonth +"");
            request.setAttribute("labels_circle", arr[0]);
            request.setAttribute("data_circle", arr[1]);
        }

        long no_order = Load_Supplier.sumOf("select count(*) from `order` where supplier_id = " + supplier_id + " and month(date_created)=month(curdate())");
        request.setAttribute("no_order", no_order);
        // total product
        int countProduct = ProductEntity.sumOfProduct("select count(*) from product where supplier_id= " + supplier_id);
        request.setAttribute("c_product", countProduct);
        // total supplier
        long countRevenue = Load_Supplier.sumOf("select SUM((o.total_price)*(100-o.commission_rate)/100) from `order` o join supplier s on o.supplier_id = s.id where supplier_id= " + supplier_id + " and Month(o.date_created) = Month(CurDate())");
        long commissionRevenue = Load_Supplier.sumOf("select SUM(o.total_price*o.commission_rate/100) from `order` o join supplier s on o.supplier_id = s.id where supplier_id= " + supplier_id + " and Month(o.date_created) = Month(CurDate())");

        request.setAttribute("c_revenue", countRevenue);
        long currentTop = Load_Supplier.sumOf("select sup_rank.rank from supplier s join (\n" +
                "select r.supplier_id as sup_id, sum(r.total_price*(100-r.commission_rate)/100) as total, DENSE_RANK() OVER (ORDER BY total desc) as rank\n" +
                "from `order` r JOIN supplier s on r.supplier_id = s.id where month(r.date_created) = month(curdate() - interval 1 month) and year(r.date_created)= year(curdate()) GROUP BY r.supplier_id, s.logo, s.company_name\n" +
                "ORDER BY total DESC) as sup_rank on s.id = sup_rank.sup_id where s.id = " + supplier_id);
        request.setAttribute("currenttop", currentTop);
        int supplier_id_int = Integer.parseInt(supplier_id);
        Supplier supplier = Load_Supplier.loadSupplier(supplier_id_int);
        System.out.println("Supplier id 120: " + supplier_id);
        System.out.println("supplier commission rate: " + supplier.getCommission_rate());
        request.setAttribute("commission", supplier.getCommission_rate());
        request.setAttribute("commissionRevenue", commissionRevenue);
        long countsupplier = Load_Supplier.sumOf("select count(*) from supplier");
        request.setAttribute("countsupplier",countsupplier);
        // cac don dat hang gan nhat
        List<Order> orderList = Load_Order.loadOrderNear(supplier_id_int, 5);
        request.setAttribute("orderlist", orderList);
        request.setAttribute("top3bestsup", Load_Supplier.loadTopSupplierWithOderTable(3));
        if(request.getParameter("supplier")!=null){
            request.getRequestDispatcher("dashboard_vendor.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }

    private void getRevenueAdmin(HttpServletRequest request, HttpServletResponse response, int currentMonth) throws ServletException, IOException {

        long countRevenue = Load_Supplier.sumOf("select SUM((o.total_price)*(100-o.commission_rate)/100) from `order` o join supplier s on o.supplier_id = s.id where  Month(o.date_created) = Month(CurDate())");
        long commissionRevenue = Load_Supplier.sumOf("select SUM(o.total_price*o.commission_rate/100) from `order` o join supplier s on o.supplier_id = s.id where  Month(o.date_created) = Month(CurDate())");
        request.setAttribute("c_revenue", countRevenue);
        request.setAttribute("commissionRevenue", commissionRevenue);

        int countUser = LoadUser.loadSumOfUser("select count(id) from user");
        request.setAttribute("c_user", countUser);
        int countUserThisMonth = LoadUser.loadSumOfUser("select count(*) from user where month(date_created)=month(CURDATE())");
        request.setAttribute("c_user_month", countUserThisMonth);
        // total product
        int countProduct = ProductEntity.sumOfProduct("select count(id) from product");
        request.setAttribute("c_product", countProduct);
        // total supplier
        long countSupplier = Load_Supplier.sumOf("select count(id) from supplier");
        request.setAttribute("c_supplier", countSupplier);
        // cac don dat hang gan nhat
        List<Order> orderList = Load_Order.loadOrderNear(0, 5);
        request.setAttribute("orderlist", orderList);
        request.setAttribute("top3bestsup", Load_Supplier.loadTopSupplierWithOderTable(3));

        System.out.println("Dang o dashboardddddddddddddddddddd");

        if (request.getParameter("action") != null) {

            String[] data_vendor = null;
            String[] data_commission = null;

            if (request.getParameter("type-range") != null) {
                System.out.println("Dang o type_range dashboardddddddddddddddddddd");
                System.out.println(request.getParameter("from"));
                System.out.println(request.getParameter("to"));
                String from = request.getParameter("from")!=null? request.getParameter("from"): Util.dateFormatNoTime(new Date());
                String to = request.getParameter("to")!=null? request.getParameter("to"): Util.dateFormatNoTime(new Date());
                data_commission = Load_Supplier.getMonthFromTo("%", from, to,true);
                data_vendor = Load_Supplier.getMonthFromTo("%", from, to,false);
                System.out.println(data_commission[1]);
                System.out.println(data_vendor[1]);
            } else
            {
                String type_revenue = request.getParameter("type-revenue");
                request.setAttribute("type_revenue", type_revenue);
                if (type_revenue.equals("month")) {
                    data_commission = Load_Supplier.getMonthChart("%", true);
                    data_vendor = Load_Supplier.getMonthChart("%", false);
                }else if (type_revenue.equals("year-month")) {
                    data_commission = Load_Supplier.getYear_Month_Chart("%", true);
                    data_vendor = Load_Supplier.getYear_Month_Chart("%", false);
                }else if (type_revenue.equals("year-quarter")) {
                    data_commission = Load_Supplier.getYear_Quarter_Chart("%", true);
                    data_vendor = Load_Supplier.getYear_Quarter_Chart("%", false);
                }else if (type_revenue.equals("week")) {
                    data_commission = Load_Supplier.getWeekChart("%",true);
                    data_vendor = Load_Supplier.getWeekChart("%",false);
                }else if (type_revenue.equals("quarter")) {
                    data_commission = Load_Supplier.getQuarterChart("%", true);
                    data_vendor = Load_Supplier.getQuarterChart("%", false);
                }
            }

            request.setAttribute("labels_revenue", data_commission[0]);
            request.setAttribute("data_commission", data_commission[1]);
            request.setAttribute("data_vendor", data_vendor[1]);

            String type_revenue_circle = request.getParameter("type-revenue-circle");
            request.setAttribute("type_revenue_circle", type_revenue_circle);
            System.out.println(type_revenue_circle);

            String[] arr= Load_Supplier.getCircleCategoryChart("%",type_revenue_circle);
            request.setAttribute("labels_circle", arr[0]);
            request.setAttribute("data_circle", arr[1]);
        } else {
            request.setAttribute("type_revenue", "week");
            String[] data_commission = Load_Supplier.getWeekChart("%",true);
            String[] data_vendor = Load_Supplier.getWeekChart("%",false);
            request.setAttribute("labels_revenue", data_commission[0]);
            request.setAttribute("data_commission", data_commission[1]);
            request.setAttribute("data_vendor", data_vendor[1]);
            System.out.println("Data commission: "+data_commission[1]);
            System.out.println("Data vendor: "+data_vendor[1]);
            request.setAttribute("type_revenue_circle", currentMonth);
            String[] arr= Load_Supplier.getCircleCategoryChart("%", currentMonth +"");
            System.out.println("circle category chart: "+arr[1]);
            request.setAttribute("labels_circle", arr[0]);
            request.setAttribute("data_circle", arr[1]);

            System.out.println("labels_circle: "+arr[0]);
            System.out.println("data_circle: "+arr[1]);
        }

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
