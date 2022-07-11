package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.rating_type.Rating_Type;
import vn.thegioidochoi.Dao.Rating_Type_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/ratingstype")
public class RatingsType_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","rating-type");
        List<Rating_Type> ratingtypes=Rating_Type_Con_DB.loadrating_typeFormSql("select * from rating_type");
        request.setAttribute("ratingtype", ratingtypes);
        System.out.println(request.getAttribute("ratingtype"));
        request.getRequestDispatcher("ratingstype.jsp").forward(request,response);

    }
}
