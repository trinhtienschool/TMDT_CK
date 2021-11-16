package vn.thegioicaycanh.controller.admin_page;

import org.apache.commons.fileupload.FileItem;
import vn.thegioicaycanh.model.user.LoadUser;
import vn.thegioicaycanh.model.user.User;
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

@WebServlet(urlPatterns = "/admin_page/add-admin")
public class Add_admin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        if((int)session.getAttribute("role_id")!=3){
            //TODO
            request.setAttribute("current_page","dashboard");
//            request.getRequestDispatcher("todo").forward(request,response);
            return;
        }

        request.setAttribute("current_page","admin-list");
        String type = request.getParameter("type");
        if(type !=null){
            if(type.equalsIgnoreCase("enterAdd")){
                request.setAttribute("type","add");
                request.setAttribute("title","Thêm admin");
                request.getRequestDispatcher("add-admin.jsp").forward(request,response);
                return;
            }else if(type.equalsIgnoreCase("enterEdit")){
                request.setAttribute("type","edit");
                request.setAttribute("title","Chỉnh sửa admin");
                int id = Integer.parseInt(request.getParameter("id"));
                User user = LoadUser.loadUserById(id);
                request.setAttribute("user",user);
                request.getRequestDispatcher("add-admin.jsp").forward(request,response);
                return;
            }
        }

        type= request.getParameter("type");
        String name =request.getParameter("name");
        String email =request.getParameter("email");
        String pass =request.getParameter("pass").isEmpty()?null:request.getParameter("pass");
        String phone=request.getParameter("phone");
        int sex = Integer.parseInt(request.getParameter("sex"));
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
        int active = request.getParameter("active")==null?0:1;
        int role_id = Integer.parseInt(request.getParameter("role_id"));
        String date_created = Util.dateFormat(new Date());

        int id = request.getParameter("id")==null?0:Integer.parseInt(request.getParameter("id"));

       if(type.equalsIgnoreCase("add")){
           request.setAttribute("type","add");
           request.setAttribute("title","Thêm admin");
           boolean isInsert = LoadUser.insertUser(name,email,pass,phone,sex,birthday,address,active,role_id,date_created);
            if(isInsert)
                request.getRequestDispatcher("add-admin.jsp").forward(request,response);
       }else if(type.equalsIgnoreCase("edit")){
           request.setAttribute("type","edit");
           request.setAttribute("title","Chỉnh sửa");
           boolean isUpdate = LoadUser.updateUser(id,name,email,pass,phone,sex,birthday,address,active,role_id);
           User user = LoadUser.loadUserById(id);
           request.setAttribute("user",user);
           request.getRequestDispatcher("add-admin.jsp").forward(request,response);
       }
    }
}
