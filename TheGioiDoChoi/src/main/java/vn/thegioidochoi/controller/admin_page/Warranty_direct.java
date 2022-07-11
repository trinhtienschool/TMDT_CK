package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.util.Util;
import vn.thegioidochoi.Dao.LoadWarranty;
import vn.thegioidochoi.model.warranty.Warranty;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/warranty")
public class Warranty_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","warranty");
        String from_date = "20190101";
        String to_date= Util.dateFormat(new Date());

        if(request.getParameter("from-date")!=null)
            from_date= request.getParameter("from-date").isEmpty()?from_date:Util.revertDate(request.getParameter("from-date"));
        if(request.getParameter("to-date")!=null)
            to_date= request.getParameter("to-date").isEmpty()?to_date:Util.revertDate(request.getParameter("to-date"));

        List<Warranty> warranties = LoadWarranty.loadWarrantiesBy(from_date,to_date);
        request.setAttribute("warranties",warranties);
        request.getRequestDispatcher("warranty-admin.jsp").forward(request,response);
    }
}
