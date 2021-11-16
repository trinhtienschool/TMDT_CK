package vn.thegioicaycanh.controller.admin_page;

import vn.thegioicaycanh.model.blog.Blog;
import vn.thegioicaycanh.model.blog.Blog_Con_DB;
import vn.thegioicaycanh.model.header_footer.Category;
import vn.thegioicaycanh.model.header_footer.Load_Category;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/admin_page/blog-admin")
public class Blog_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "blog");

        String name = "%";
        String from_date = "20190101";
        String to_date = Util.dateFormat(new Date());

        if(request.getParameter("blog-name")!=null)
            name = request.getParameter("blog-name").isEmpty() ? "%" : request.getParameter("blog-name");
        if(request.getParameter("from-date")!=null)
            from_date = request.getParameter("from-date").isEmpty() ? "20190101" : Util.revertDate(request.getParameter("from-date"));
        if(request.getParameter("to-date")!=null)
            to_date = request.getParameter("to-date").isEmpty() ? Util.dateFormat(new Date()) : Util.revertDate(request.getParameter("to-date"));

        List<Blog>blogs = Blog_Con_DB.loadBlogBy(name,from_date,to_date);
        request.setAttribute("blog",blogs);
        request.getRequestDispatcher("blog.jsp").forward(request,response);
    }
}
