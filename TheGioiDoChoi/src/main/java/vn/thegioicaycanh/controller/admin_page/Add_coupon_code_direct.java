package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.coupon_code.Coupon_Con_DB;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(urlPatterns = "/admin_page/add-coupon-code")
public class Add_coupon_code_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","coupon-code");
        String type = request.getParameter("type");
        if(type !=null) {
            if (type.equalsIgnoreCase("enterAdd")) {
                request.setAttribute("type", "add");
                request.setAttribute("title", "Thêm mã giảm giá");
                request.getRequestDispatcher("add-coupon-code.jsp").forward(request, response);
                return;
            } else if (type.equalsIgnoreCase("enterEdit")) {
                request.setAttribute("type", "edit");
                request.setAttribute("title", "Chỉnh sửa mã giảm giá");
                int id = Integer.parseInt(request.getParameter("id"));
                CouponCode couponCode = Coupon_Con_DB.loadCouponCodeById(id);
                request.setAttribute("couponcode", couponCode);
                request.getRequestDispatcher("add-coupon-code.jsp").forward(request, response);
                return;
            }
        }
        String name = request.getParameter("name");
        int coupon_code_type_id = Integer.parseInt(request.getParameter("coupon_code_type_id"));
        int percent = Integer.parseInt(request.getParameter("percent"));
        String description = request.getParameter("description");
        String code = request.getParameter("code");
        String date_start = request.getParameter("date_start");
        String date_end = request.getParameter("date_end");

        if(type.equalsIgnoreCase("add")){
            request.setAttribute("type","add");
            request.setAttribute("title","Thêm mã giảm giá");
            boolean isInsert = Coupon_Con_DB.insertCouponCode(name,coupon_code_type_id,percent,description,code,date_start,date_end);
            if(isInsert){
                request.getRequestDispatcher("add-coupon-code.jsp").forward(request, response);
            }
        } else if(type.equalsIgnoreCase("edit")){
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("type","edit");
            request.setAttribute("title","Chỉnh sửa mã giảm giá");
            System.out.println("da vao edit ma giam gia");
            boolean isUpdate = Coupon_Con_DB.updateCouponCode(id,name,coupon_code_type_id,percent,description,code,date_start,date_end);
            CouponCode couponCode = Coupon_Con_DB.loadCouponCodeById(id);
            request.setAttribute("couponcode", couponCode);
            request.getRequestDispatcher("add-coupon-code.jsp").forward(request,response);
        }
    }
}
