package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.term_and_condition.TermAndCondition;
import vn.thegioicaycanh.model.term_and_condition.TermAndCondition_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin_page/term-and-condition")
public class Term_condition_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("content")!=null){
            TermAndCondition_Con_DB.saveTerm_condition(request.getParameter("content"));
        }
        TermAndCondition tc = TermAndCondition_Con_DB.loadTermAndCondition(1);
        request.setAttribute("tc",tc.getText());
        request.getRequestDispatcher("term-and-condition.jsp").forward(request,response);
    }
}
