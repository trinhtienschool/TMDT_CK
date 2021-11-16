package vn.thegioicaycanh.controller.admin_page;

import org.apache.commons.fileupload.FileItem;
import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.blog.Blog;
import vn.thegioicaycanh.model.blog.Blog_Con_DB;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@WebServlet(urlPatterns = "/admin_page/add-blog")
public class Add_blog_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","blog");
        String type = request.getParameter("type");
        if(type !=null) {
            if (type.equalsIgnoreCase("enterAdd")) {
                request.setAttribute("type", "add");
                request.setAttribute("title", "Thêm bài viết");
                request.getRequestDispatcher("add-blog.jsp").forward(request, response);
                return;
            } else if (type.equalsIgnoreCase("enterEdit")) {
                request.setAttribute("type", "edit");
                request.setAttribute("title", "Chỉnh sửa bài viết");
                int id = Integer.parseInt(request.getParameter("id"));
                Blog blog = Blog_Con_DB.loadBlog(id);
                request.setAttribute("blog", blog);
                request.getRequestDispatcher("add-blog.jsp").forward(request, response);
                return;
            }
        }
        Iterator<FileItem> i = Util.uploadFile(request,response);
        FileItem fiImg=null;
        Map<String,String> pair = new HashMap<String,String>();
        while(i.hasNext()){
            FileItem fi =i.next();
            if(fi.isFormField()){
                pair.put(fi.getFieldName(),fi.getString("UTF-8").trim());
            }
            else if(!fi.isFormField()){
                fiImg=fi;
                System.out.println("co vao fiImg");
            }
        }
        type = pair.get("type");
        String name = pair.get("name");
        String description = pair.get("description");
        String content = pair.get("content");
        int active = pair.get("active")==null?0:1;
        String slug = Util.generateSlug(name);
        String date_created = Util.dateFormat(new Date());
        int id = pair.get("id")==null?0:Integer.parseInt(pair.get("id"));
        HttpSession session = request.getSession();
        int admin_id = (int)session.getAttribute("user_id");
        int numOfRead = 0;

        String img = null;
        String urlImg = Util.getUrlFileFromUpload(fiImg,slug,"imgs/blog");
        if(urlImg!=null)
            img = urlImg;

        if(type.equalsIgnoreCase("add")){
            img = img==null?"img/blog/default_img.png":img;
            request.setAttribute("type","add");
            request.setAttribute("title","Thêm bài viết");
            boolean isInsert = Blog_Con_DB.insertBlog(name,description,content,active,slug,date_created,admin_id,numOfRead,img);
            if(isInsert)
                request.getRequestDispatcher("add-blog.jsp").forward(request,response);
        }else if(type.equalsIgnoreCase("edit")){
            request.setAttribute("type","edit");
            request.setAttribute("title","Chỉnh sửa bài viết");
            System.out.println("co vao edit");
            boolean isUpdate = Blog_Con_DB.updateBlog(id,name,description,content,active,slug,img);

            Blog blog = Blog_Con_DB.loadBlog(id);
            request.setAttribute("blog",blog);
            request.getRequestDispatcher("add-blog.jsp").forward(request,response);

        }
    }
}
