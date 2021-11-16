package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.feeback.Feedback;
import vn.thegioicaycanh.model.feeback.Load_Feedback;
import vn.thegioicaycanh.model.header_footer.LoadHeaderFooter;
import vn.thegioicaycanh.model.header_footer.Social_media;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Contact_direct", urlPatterns = "/contact")
public class Contact_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page_menu", "contact");
        request.setAttribute("title", "Liên hệ");
        String fullname = "";
        String emailaddress = "";
        String content = "";
        if (request.getParameter("fullname") != null && request.getParameter("emailaddress") != null && request.getParameter("content") != null) {
            fullname = request.getParameter("fullname");
            emailaddress = request.getParameter("emailaddress");
            content = request.getParameter("content");
            boolean saved = Load_Feedback.saveFeedback(new Feedback(emailaddress, fullname, content));
            if (saved) {
                //neu chua gui thi status = 0
                //neu da gui thanh cong status = 1
                request.setAttribute("status", 1);
            } else request.setAttribute("status", 0);

        }else{
            request.setAttribute("status",0);
        }
        request.getRequestDispatcher("user_page/contact.jsp").forward(request, response);
    }
}
