package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.coupon_code.Coupon_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/coupon_code")
public class Coupon_code_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "coupon-code");
        request.setAttribute("title","Mã giảm giá");
        List<CouponCode> couponCodes = Coupon_Con_DB.loadCouponCode_view();
        request.setAttribute("coupon", couponCodes);
        request.getRequestDispatcher("coupon-code.jsp").forward(request,response);

    }
}
