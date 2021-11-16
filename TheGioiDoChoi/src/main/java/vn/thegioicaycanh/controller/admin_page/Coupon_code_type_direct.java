package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.coupon_code_type.CouponCodeType;
import vn.thegioicaycanh.model.coupon_code_type.CouponCodeType_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/coupon-code-type")
public class Coupon_code_type_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","coupon-code-type");
        List<CouponCodeType>couponCodeTypes= CouponCodeType_Con_DB.loadAllCouponCodeType();
        request.setAttribute("ccts",couponCodeTypes);
        request.getRequestDispatcher("coupon-code-type.jsp").forward(request,response);
    }
}
