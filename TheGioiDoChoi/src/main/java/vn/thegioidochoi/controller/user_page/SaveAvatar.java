package vn.thegioidochoi.controller.user_page;

import org.apache.commons.fileupload.FileItem;
import vn.thegioidochoi.model.user.LoadUser;
import vn.thegioidochoi.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;

@WebServlet(urlPatterns = "/saveAvatar")
public class SaveAvatar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Iterator<FileItem> i = Util.uploadFile(request,response);


        int id = (int)request.getSession().getAttribute("user_id");
        while(i.hasNext()){
            FileItem fi =i.next();
            if(!fi.isFormField()){
                String urlImg = Util.getUrlFileFromUpload(fi,"user"+id,"imgs/user/");
                if(urlImg!=null){
                    LoadUser.saveAvatar(urlImg,id);
                }
            }
        }
        request.getRequestDispatcher("user").forward(request,response);
    }
}
