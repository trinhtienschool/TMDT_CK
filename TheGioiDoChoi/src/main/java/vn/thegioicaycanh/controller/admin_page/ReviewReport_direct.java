package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.rating.Rating;
import vn.thegioicaycanh.model.rating.Rating_Con_DB;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/reviewreport")
public class ReviewReport_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","review-report");
        List<Rating> ratings= Rating_Con_DB.loadRatingFormSql("select * from rating");
        request.setAttribute("ratings", ratings);
        request.getRequestDispatcher("review-reports.jsp").forward(request,response);
    }
}
