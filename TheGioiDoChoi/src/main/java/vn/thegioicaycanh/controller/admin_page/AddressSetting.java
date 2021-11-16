package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.header_footer.Address;
import vn.thegioicaycanh.model.header_footer.LoadHeaderFooter;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/setting-address")
public class AddressSetting extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","setting");

        if(Util.hasMoreParameter(request)) {
            String type = request.getParameter("type");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String timeOpen = request.getParameter("time-open");
            String mapAddress = request.getParameter("map-address");

            boolean isUpdated = LoadHeaderFooter.updateAddress(type, address, phone, email, timeOpen, mapAddress);
            List<Address>addresses = LoadHeaderFooter.loadAdress();
            ServletContext context = getServletContext();
            context.setAttribute("address",addresses);
        }
        request.getRequestDispatcher("setting-address.jsp").forward(request,response);
    }
}
