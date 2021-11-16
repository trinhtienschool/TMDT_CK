package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.blog.Blog;
import vn.thegioicaycanh.model.blog.Blog_Con_DB;
import vn.thegioicaycanh.model.user.LoadUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/blog-detail")
public class Blog_detail_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=1;
        if(request.getParameter("id")!=null){
            id=Integer.parseInt(request.getParameter("id"));
        }
        Blog blog = Blog_Con_DB.loadBlog(id);
        request.setAttribute("page_menu","blog");
        request.setAttribute("title","Chi tiết bài viết");
        request.setAttribute("author", LoadUser.loadUserById(blog.getAdmin_id()));
        request.setAttribute("blog",blog);
        request.setAttribute("newBlog",Blog_Con_DB.loadNewBlogs(12));
        request.setAttribute("mostReadBlogs",Blog_Con_DB.mostReadBlogs(12));
        request.setAttribute("randomBlog",Blog_Con_DB.loadRandomBlog(3));
        request.getRequestDispatcher("user_page/blog-detail.jsp").forward(request,response);
    }
}
