package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.blog.Blog_Con_DB;
import vn.thegioicaycanh.model.header_footer.LoadHeaderFooter;
import vn.thegioicaycanh.model.header_footer.Social_media;
import vn.thegioicaycanh.model.home_page.Home_page;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/blog")
public class Blog_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pages = 1;
        String sqlCondition="";
        String url="";
        if(request.getParameter("pages") != null) {
            pages = Integer.parseInt(request.getParameter("pages"));
        }
        request.setAttribute("sql","select * from blog "+sqlCondition);
        request.setAttribute("sumOfItems_sql","select count(*) from blog "+sqlCondition);
        request.setAttribute("numOfItemLoad",10);
        request.setAttribute("page_menu","blog");
//        request.setAttribute("pages",pages);
        request.setAttribute("type_page","blog");
        request.setAttribute("direct_to","user_page/blog.jsp");
        request.setAttribute("title","Bài viết");
        request.setAttribute("home_page_data",new Home_page());
        request.setAttribute("pages",pages);
        request.setAttribute("url",url);
        request.setAttribute("newBlog",Blog_Con_DB.loadNewBlogs(12));
        request.setAttribute("mostReadBlogs",Blog_Con_DB.mostReadBlogs(12));
//        request.setAttribute("data", Blog_Con_DB.loadLimitBlog(1,10));
        request.setAttribute("newBlog",Blog_Con_DB.loadNewBlogs(12));
        request.getRequestDispatcher("handlePagination").forward(request,response);

    }
}
