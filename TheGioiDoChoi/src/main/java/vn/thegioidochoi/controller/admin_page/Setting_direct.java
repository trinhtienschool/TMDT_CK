package vn.thegioidochoi.controller.admin_page;

import org.apache.commons.fileupload.FileItem;
import vn.thegioidochoi.model.header_footer.Header;
import vn.thegioidochoi.Dao.LoadHeaderFooter;
import vn.thegioidochoi.model.header_footer.Social_media;
import vn.thegioidochoi.Dao.Load_Supplier;
import vn.thegioidochoi.model.supplier.Supplier;
import vn.thegioidochoi.Dao.LoadUser;
import vn.thegioidochoi.model.user.User;
import vn.thegioidochoi.model.util.Util;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@WebServlet(urlPatterns = {"/admin_page/setting", "/vendor_page/setting"})
public class Setting_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "setting");
        HttpSession session = request.getSession();
        int roleId = 0;
        int user_id = 0;
        if (request.getParameter("user_id") != null) {
            user_id = Integer.parseInt(request.getParameter("user_id"));
        } else {
            user_id = (int) session.getAttribute("user_id");
        }
        System.out.println((long) session.getAttribute("user_phone"));
        if (session.getAttribute("user_id") != null) {
            User user = LoadUser.loadUserById(user_id);
            if (user.getRole_id() == 2) {
                roleId = 2;
            } else if (user.getRole_id() == 3) {
                roleId = 3;
            }
        }
        if (roleId == 3 || roleId == 4) {
            System.out.println("Co vao thay doi hasMorePara");
            Iterator<FileItem> i = Util.uploadFile(request, response);
            if (i != null) {
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
                        File folder = new File("..\\webapps\\thegioidochoi.vn/imgs/header");
                        if (!folder.exists()) folder.mkdirs();
                        File file = new File("..\\webapps\\thegioidochoi.vn/imgs/header/" + fieldName + ext);
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
            request.getRequestDispatcher("setting.jsp").forward(request, response);
        } else if (roleId == 2) {
            Iterator<FileItem> i = Util.uploadFile(request, response);
            Map<String, String> pair = new HashMap<String, String>();
            Map<String, FileItem> pairImg = new HashMap<String, FileItem>();
            if (i != null) {
                while (i.hasNext()) {
                    FileItem fi = i.next();
                    if (fi.isFormField()) {
                        pair.put(fi.getFieldName(), fi.getString("UTF-8").trim());
                    } else if (!fi.isFormField()) {
                        System.out.println("co vao khong phai truong form field");
                        if (fi.getFieldName().equalsIgnoreCase("gallery-img")) {
                            if (fi.getSize() != 0) {
                                pairImg.put("gallery-img-" + System.nanoTime(), fi);
                            }
                            System.out.println(System.nanoTime());

                        } else {
                            if (fi.getSize() != 0) {
                                pairImg.put(fi.getFieldName(), fi);
                            }
                        }

                        System.out.println("co vao fiImg");
                        System.out.println(fi.getFieldName());
                        for (String key : pairImg.keySet()) {
                            System.out.println(key + " : " + pairImg.get(key));
                        }
                    }

                    String name = pair.get("name");
                    String company = pair.get("company");
                    String website = pair.get("website");
                    String phone = pair.get("phone");
                    String city = pair.get("city");
                    String district = pair.get("district");
                    String ward = pair.get("ward");
                    String detail = pair.get("detail");
                    String slug = Util.generateSlug(name);
                    String thumbnail = null;
                    List<String> imgs = new ArrayList<String>();
                    for (String imageField : pairImg.keySet()) {
                        if (imageField.equalsIgnoreCase("thumbnail-img")) {
                            thumbnail = Util.getUrlFileFromUpload(pairImg.get(imageField), slug + "-thumbnail-" + System.currentTimeMillis(), "imgs/products");
                            if (thumbnail == null) thumbnail = "imgs/products/default_img.png";
                        } else {
                            String img = Util.getUrlFileFromUpload(pairImg.get(imageField), slug + "-gallery-" + System.currentTimeMillis(), "imgs/products");
                            if (img == null) img = "imgs/products/default_img.png";
                            imgs.add(img);
                        }
//            String img = null;
//            String urlImg = Util.getUrlFileFromUpload(fiImg, slug, "imgs/products/");
//            if (urlImg != null)
//                img = urlImg;
                    }
                    String logo = thumbnail;
                    String description = pair.get("content");
                    boolean isUpdate = LoadUser.updateUserVendor(name, phone, city, district, ward, detail, logo, user_id);
                    boolean isUpdateSupplier = Load_Supplier.updateSupplierSetting(company, website, phone, city, district, ward, detail, description, logo, user_id);
                }
            }
            Supplier supplier = null;
            if (request.getParameter("supplier") != null) {
                user_id = Integer.parseInt(request.getParameter("user_id"));
                supplier = Load_Supplier.loadSupplierSettings(user_id);
            } else supplier = Load_Supplier.loadSupplierSettings(user_id);
            System.out.println("supplier: "+supplier);
            System.out.println("user_id: "+user_id);
            request.setAttribute("supplier", supplier);
            getDetailAddress(supplier.getAddress(), request);
            request.getRequestDispatcher("settings_vendor.jsp").forward(request, response);
        }
    }

    // Tach dia chi
    protected void getDetailAddress(String address, HttpServletRequest request) {
        String[] arr = address.split(",");
        if(arr.length <3){
            request.setAttribute("city", "");
            request.setAttribute("district", "");
            request.setAttribute("ward", "");
            request.setAttribute("detail", address);
            return;
        }
        String city = arr[arr.length - 1];
        String district = arr[arr.length - 2];
        String ward = arr[arr.length - 3];
        String detail = "";
        for (int i = 0; i < arr.length - 3; i++) {
            detail += arr[i] + " ";
        }

        request.setAttribute("city", city);
        request.setAttribute("district", district);
        request.setAttribute("ward", ward);
        request.setAttribute("detail", detail);
    }
}
