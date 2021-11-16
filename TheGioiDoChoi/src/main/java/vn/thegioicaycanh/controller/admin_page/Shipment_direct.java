package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.shipment.Load_Shipment;
import vn.thegioicaycanh.model.shipment.Shipment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/shipment")
public class Shipment_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "shipment");
        request.setAttribute("title","Vận chuyển");
        List<Shipment> shipmentList = Load_Shipment.loadShipment_view();
        request.setAttribute("s_view", shipmentList);
        request.getRequestDispatcher("shipments.jsp").forward(request, response);
    }
}
