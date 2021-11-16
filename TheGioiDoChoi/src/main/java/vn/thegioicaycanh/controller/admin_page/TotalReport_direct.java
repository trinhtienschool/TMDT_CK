package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.notifications.Notification_Con_DB;
import vn.thegioicaycanh.model.order.Load_Order;
import vn.thegioicaycanh.model.order.Order;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/total_report")
public class TotalReport_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "total-report");
        // Khoi tao gia tri mac dinh cho bien view = 1..6
        int type_view = 0;
        String status = "%";
        String from_date = "20190101";
        String to_date = Util.dateFormat(new Date());

        if(request.getParameter("from-date")!=null)
            from_date= request.getParameter("from-date").isEmpty()?from_date:Util.revertDate(request.getParameter("from-date"));
        if(request.getParameter("to-date")!=null)
            to_date= request.getParameter("to-date").isEmpty()?to_date:Util.revertDate(request.getParameter("to-date"));
        if(request.getParameter("type_view") != null){
            type_view = Integer.parseInt(request.getParameter("type_view"));
        }
        if(type_view == 1){
            status = "1";
        } else if(type_view == 2){
            status = "2";
        }else if(type_view == 3){
            status = "3";
        }else if(type_view == 4){
            status = "4";
        }else if(type_view == 5){
            status = "5";
        }else if(type_view == 6){
            status = "6";
        }
        System.out.println(type_view);
        System.out.println(status);
        request.setAttribute("type_view",type_view);
        List<Order> orderList = Load_Order.loadOrderByStatus(status,from_date,to_date);
        request.setAttribute("total_report", orderList);
        request.setAttribute("title", "Danh sách đặt hàng");
        request.getRequestDispatcher("total-report.jsp").forward(request, response);
    }
}