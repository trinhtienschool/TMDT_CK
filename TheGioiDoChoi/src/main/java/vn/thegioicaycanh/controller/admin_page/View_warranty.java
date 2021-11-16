package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.warranty.LoadWarranty;
import vn.thegioicaycanh.model.warranty.Warranty;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin_page/edit-warranty")
public class View_warranty extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","warranty");
        String type =request.getParameter("type");
        System.out.println("Da vao servlet view warranty");
        if(type !=null){
            int id = Integer.parseInt(request.getParameter("id"));

             if(type.equalsIgnoreCase("edit")){

                int status = Integer.parseInt(request.getParameter("status"));
                request.setAttribute("type","edit");
                boolean isUpdate = LoadWarranty.updateWarranty(id,status);

            }
             request.setAttribute("type","edit");
            Warranty warranty = LoadWarranty.loadWarrantyBy(id);
            request.setAttribute("warranty", warranty);
            request.getRequestDispatcher("view-warranty.jsp").forward(request, response);
        }

    }
}
