package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.favorist_list.Favorist_list_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/DeleteFavorist_list_direct")
public class DeleteFavorist_list_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("user_id")!=null && request.getParameter("pro_id")!=null){
            HttpSession session = request.getSession();
            int user_id = (int)session.getAttribute("user_id");
            int pro_id=Integer.parseInt(request.getParameter("pro_id"));
            Favorist_list_Con_DB.deleteFavoristList(user_id,pro_id);
        }
    }
}
