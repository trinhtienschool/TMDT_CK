package vn.thegioicaycanh.controller.admin_page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/nhan")
public class Receive extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        if(request.getParameter("date")!=null)
//            System.out.println("day la date: "+request.getParameter("date"));
//        else System.out.println("khong co tham so editor");
        if(request.getParameter("checkbox")!=null){
            System.out.println(request.getParameter("checkbox"));
        }else System.out.println("Khong co");
    }
}
