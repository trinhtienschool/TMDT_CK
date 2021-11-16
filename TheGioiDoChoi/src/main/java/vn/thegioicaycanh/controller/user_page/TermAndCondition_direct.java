package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.term_and_condition.TermAndCondition_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/TermAndCondition_direct")
public class TermAndCondition_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("type_page","home");
        request.setAttribute("page_menu","home");
        request.setAttribute("data", TermAndCondition_Con_DB.loadTermAndCondition(1).getText());
        request.setAttribute("title","Điều khoản và điều kiện");
        request.getRequestDispatcher("user_page/term-and-condition.jsp").forward(request,response);
    }
}
