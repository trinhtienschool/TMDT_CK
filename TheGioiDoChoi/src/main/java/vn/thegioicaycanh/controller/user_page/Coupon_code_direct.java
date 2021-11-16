package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.coupon_code.Coupon_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/coupon_code")
public class Coupon_code_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleParameter(request,response);
        request.setAttribute("type_page","coupon_code");
        request.setAttribute("page_menu","discount");
        request.setAttribute("title","Mã giảm giá");

//        request.setAttribute("coupon_code_data", Coupon_Con_DB.loadAllCouponCode());
        request.getRequestDispatcher("user_page/coupon-code.jsp").forward(request,response);


    }
    private void handleParameter(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        byte cat_id = 0;
        byte sortedprice_id = 0;
        byte sorteddate_id = 0;
        byte new_code=0;
        String sql = "select * from coupon_code";
        String url = "";
        String sqlCondition = "";
        if (request.getParameter("sorteddate_id") != null) {
            sorteddate_id = Byte.parseByte(request.getParameter("sorteddate_id"));
            url += "&date_id=" + sorteddate_id;
            System.out.println(url);
            if (sorteddate_id == 1) {
                sqlCondition = sqlCondition.isEmpty() ? "  DATEDIFF (date_end,CURRENT_DATE) =0" : " where " + sqlCondition + "  DATEDIFF (date_end,CURRENT_DATE) 1";
                System.out.println(sqlCondition);

            } else if (sorteddate_id == 2) {
                sqlCondition = sqlCondition.isEmpty() ? "  DATEDIFF (date_end,CURRENT_DATE) >=1" : " where " + sqlCondition + "having DATEDIFF (date_end,CURRENT_DATE) >=1";
            } else if (sorteddate_id == 3) {
                sqlCondition = sqlCondition.isEmpty() ? "  DATEDIFF (date_end,CURRENT_DATE) >=7" : " where " + sqlCondition + "DATEDIFF (date_end,CURRENT_DATE) >=7 ";
            } else if (sorteddate_id == 4) {
                sqlCondition = sqlCondition.isEmpty() ? " DATEDIFF (date_end,CURRENT_DATE) >=14" : " where " + sqlCondition + "DATEDIFF (date_end,CURRENT_DATE) >=14";
            } else {
                sqlCondition = sqlCondition.isEmpty() ? "  DATEDIFF (date_end,CURRENT_DATE) >=30" : " where " + sqlCondition + "and DATEDIFF (date_end,CURRENT_DATE) >=30 ";
            }
        }
        //sortd for price
        if (request.getParameter("sortedprice_id") != null) {
            sortedprice_id = Byte.parseByte(request.getParameter("sortedprice_id"));
            url += "&sortedprice_id=" + sortedprice_id;
            if(request.getParameter("new_code") !=null)
                new_code = 1;
            else new_code = 0;
            System.out.println(url);
            if (sortedprice_id == 1) {
                sqlCondition = sqlCondition.isEmpty() ? " order by percent desc"+(new_code==1?",date_start desc,":"") : " where " + sqlCondition + " order by percent desc"+(new_code==1?",date_start desc,":"");
            } else {
                sqlCondition = sqlCondition.isEmpty() ? " order by percent asc"+(new_code==1?",date_start desc,":"") : " where " + sqlCondition + " order by percent asc"+(new_code==1?",date_start desc,":"");
            }
        } else {
            sqlCondition = sqlCondition.isEmpty() ? "" : " where " + sqlCondition;

        }
        //cat_id handle
        if (request.getParameter("cat_id") != null) {
            cat_id = Byte.parseByte(request.getParameter("cat_id"));
            url += "&cat_id=" + cat_id;
            if (cat_id == 1) {
                response.sendRedirect("http://localhost:8080/thegioicaycanh.vn/blog.html");
            }

        }


        //Load discount thoa dieu kien
        System.out.println(sql + sqlCondition);
        List<CouponCode> dataCouponCode = Coupon_Con_DB.loadCouponCodeFormSql(sql + sqlCondition);
        request.setAttribute("coupon_code_data", dataCouponCode);
        request.setAttribute("url", url);
        System.out.println(url);
        request.setAttribute("sort_id", sortedprice_id);
        request.setAttribute("cat_id", cat_id);
        request.setAttribute("sortedprice_id", sortedprice_id);
        request.setAttribute("sorteddate_id", sorteddate_id);
    }
}
