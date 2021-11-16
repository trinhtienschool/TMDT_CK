package vn.thegioicaycanh.controller.admin_page;

import org.apache.commons.fileupload.FileItem;
import vn.thegioicaycanh.model.header_footer.Header;
import vn.thegioicaycanh.model.header_footer.LoadHeaderFooter;
import vn.thegioicaycanh.model.header_footer.Social_media;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@WebServlet(urlPatterns = "/admin_page/setting")
public class Setting_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setAttribute("current_page","setting");


            System.out.println("Co vao thay doi hasMorePara");
            Iterator<FileItem> i = Util.uploadFile(request, response);
            if(i!=null) {
                Map<String, String> pair = new HashMap<String, String>();
                while (i.hasNext()) {
                    FileItem fi = i.next();
                    if (fi.isFormField()) {
                        pair.put(fi.getFieldName(), fi.getString("UTF-8").trim());
                    } else if (!fi.isFormField()) {
                        System.out.println("co vao khong phai truong form field");
                        String fieldName = fi.getFieldName();
                        String fileName = fi.getName();
                        String ext;
                        if (fileName.lastIndexOf(".") >= 0 && !fileName.isEmpty()) {
                            ext = fileName.substring(fileName.lastIndexOf("."));
                        } else {
                            ext = null;
                        }
                        System.out.println(fileName);
                        System.out.println(fieldName);
                        if (ext == null) {
                            continue;
                        }
                        File folder = new File("..\\webapps\\thegioicaycanh.vn/imgs/header");
                        if (!folder.exists()) folder.mkdirs();
                        File file = new File("..\\webapps\\thegioicaycanh.vn/imgs/header/" + fieldName + ext);
                        try {
                            fi.write(file);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        pair.put(fieldName, "imgs/header/" + fieldName + ext);
                    }
                }
                String name = pair.get("name");
                String logo = pair.get("logo");
                String shortcut = pair.get("shortcut");

                String fb = pair.get("fb");
                String tw = pair.get("tw");
                String in = pair.get("in");
                String pi = pair.get("pi");
                boolean isSocialUpdated = Social_media.update(fb, tw, in, pi);
                boolean isHeaderUpdated = LoadHeaderFooter.update(name, logo, shortcut);

                Header header = LoadHeaderFooter.loadHeader();
                Social_media s = new Social_media();
                ServletContext context = getServletContext();
                context.setAttribute("header", header);
                context.setAttribute("social_media", s);
            }
        request.getRequestDispatcher("setting.jsp").forward(request,response);

    }
}
