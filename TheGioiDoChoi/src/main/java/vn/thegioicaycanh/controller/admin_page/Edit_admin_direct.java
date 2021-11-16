package vn.thegioicaycanh.controller.admin_page;

import org.apache.commons.fileupload.FileItem;
import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
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

@WebServlet(urlPatterns = "/admin_page/edit-admin")
public class Edit_admin_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("current_page", "admin");
        System.out.println("da vao day");
        String type = request.getParameter("type");
        if (type != null) {
            if (type.equalsIgnoreCase("enterEdit")) {
                session.setAttribute("type", "edit");
                session.setAttribute("title", "Sửa thông tin admin");
                int id = Integer.parseInt(request.getParameter("id"));
                User user = LoadUser.loadUserById(id);
                request.setAttribute("user",user);
                request.getRequestDispatcher("edit-admin.jsp").forward(request, response);
                return;
            }
        }
        Iterator<FileItem> i = Util.uploadFile(request, response);

        FileItem fiImg = null;
        Map<String, String> pair = new HashMap<String, String>();
        while (i.hasNext()) {
            FileItem fi = i.next();
            if (fi.isFormField()) {
                pair.put(fi.getFieldName(), fi.getString("UTF-8").trim());
            } else if (!fi.isFormField()) {
                fiImg = fi;
                System.out.println("co vao fiImg");
            }
        }
        type = pair.get("type");
        String user_name = pair.get("name");
        String user_birth = pair.get("birthdate");
        String user_mail = pair.get("email");
        int user_phone = Integer.parseInt(pair.get("phone"));
        String detail = pair.get("detail");
        String ward = pair.get("ward");
        String district = pair.get("district");
        String city = pair.get("city");

        String slug = Util.generateSlug(user_name);
        int id = pair.get("id") == null ? 0 : Integer.parseInt(pair.get("id"));

        String img = null;
        String urlImg = Util.getUrlFileFromUpload(fiImg, slug, "imgs/admins/" + user_name + id);
        if (urlImg != null)
            img = urlImg;

        if (type.equalsIgnoreCase("edit")) {
            request.setAttribute("type", "edit");
            request.setAttribute("title", "Chỉnh sửa");
            System.out.println("co vao edit");
            boolean isUpdate = LoadUser.updateUserById(user_name,img,user_birth,user_phone,user_mail,city,district,ward,detail,id);
            User user = LoadUser.loadUserById(id);
            request.setAttribute("user",user);
            request.getRequestDispatcher("edit-admin.jsp").forward(request, response);

        }
    }
    // Tach dia chi
    protected void getDetailAddress(String address, HttpSession session){
        String [] arr = address.split(",");
        String city = arr[arr.length-1];
        String district = arr[arr.length-2];
        String ward = arr[arr.length-3];
        String detail = "";
        for(int i=0; i< arr.length-3;i++){
            detail += arr[i] + " ";
        }
        session.setAttribute("city", city);
        session.setAttribute("district", district);
        session.setAttribute("ward", ward);
        session.setAttribute("detail", detail);
    }
}
