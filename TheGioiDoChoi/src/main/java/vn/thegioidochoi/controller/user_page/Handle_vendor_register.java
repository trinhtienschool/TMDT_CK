package vn.thegioidochoi.controller.user_page;

import org.apache.commons.fileupload.FileItem;
import vn.thegioidochoi.Dao.Load_Supplier;
import vn.thegioidochoi.model.supplier.Supplier;
import vn.thegioidochoi.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet(urlPatterns = "/vendor-handle-sign-up")
public class Handle_vendor_register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("page_menu","login");
        request.setAttribute("title","Thông tin cửa hàng");



        Iterator<FileItem> i = Util.uploadFile(request,response);

        //Xu li chuyen vao dang ky vendor
        if(i==null){
            request.setAttribute("status",1);
            request.setAttribute("status_content","");
            request.getRequestDispatcher("user_page/vendor-sign-up.jsp").forward(request,response);
            return;
        }

        FileItem fiImg=null;
        Map<String,String> pair = new HashMap<String,String>();
        Map<String,FileItem>pairImg = new HashMap<String,FileItem>();
        while(i.hasNext()){
            FileItem fi =i.next();
            if(fi.isFormField()){
                pair.put(fi.getFieldName(),fi.getString("UTF-8").trim());
                System.out.println("Dang vao isFormField");
                System.out.println(fi.getFieldName());
                System.out.println(fi.getString("UTF-8").trim());
                System.out.println("ket thuc vao isFormField");
            }
            else if(!fi.isFormField()){
                System.out.println("Not FormFielddddddddddddd:");
                System.out.println(fi.getFieldName());
                System.out.println(fi);
                if(fi.getFieldName().equalsIgnoreCase("gallery-img")){
                    if(fi.getSize()!=0) {
                        pairImg.put("gallery-img-" + System.nanoTime(), fi);
                    }
                    System.out.println(System.nanoTime());

                }else{
                    if(fi.getSize()!=0) {
                        pairImg.put(fi.getFieldName(), fi);
                    }
                }

                System.out.println("co vao fiImg");
                System.out.println(fi.getFieldName());
                for(String key: pairImg.keySet()){
                    System.out.println(key+" : "+pairImg.get(key));
                }
                System.out.println("Ket thuc vao fiImg");
            }
        }

        String name = pair.get("name");
        String slug = Util.generateSlug(name);
        long phone = Long.parseLong(pair.get("phone"));

        HttpSession session = request.getSession();
        int user_id = 0;
       if(session.getAttribute("user_id") !=null){
           user_id = (int)session.getAttribute("user_id");
       }else user_id = Integer.parseInt(pair.get("user_id"));
        String email = pair.get("email");
        String city = pair.get("city");
        String district = pair.get("district");
        String warm = pair.get("warm");
        String address = pair.get("address");
        address = address + "," +warm+" , "+ district + "," + city;
        String company_name = pair.get("company_name");
        String website = pair.get("website");
        String description = pair.get("description");


//        int active = pair.get("active")==null?0:1;
//        String sku = pair.get("sku");
//        int quantity =Integer.parseInt(pair.get("quantity"));
//        String description = pair.get("description");
//        String content = pair.get("content");
//        String date_created = Util.dateFormat(new Date());
//        //Danh cho edit
//        int id = pair.get("id")==null?0:Integer.parseInt(pair.get("id"));


//        System.out.println("imgUrls la: "+imgUrls);
//        String originalImg = pair.get("img")==null?"imgs/products/default_img.png":pair.get("img");
//        System.out.println("pair.getImg: "+pair.get("img"));
//        System.out.println("original img: "+originalImg);
//        String img = imgUrls.isEmpty()?originalImg:imgUrls.get(0);
        String thumbnail = null;
        List<String> imgs = new ArrayList<String>();
        for(String imageField: pairImg.keySet()) {
            if(imageField.equalsIgnoreCase("thumbnail-img")){
                thumbnail = Util.getUrlFileFromUpload(pairImg.get(imageField),slug+"-thumbnail-"+System.currentTimeMillis(),"imgs/products");
                if(thumbnail== null) thumbnail = "imgs/products/default_img.png";
            }else{
                String img = Util.getUrlFileFromUpload(pairImg.get(imageField),slug+"-gallery-"+System.currentTimeMillis(),"imgs/products");
                if(img == null) img = "imgs/products/default_img.png";
                imgs.add(img);
            }
//            String img = null;
//            String urlImg = Util.getUrlFileFromUpload(fiImg, slug, "imgs/products/");
//            if (urlImg != null)
//                img = urlImg;
        }

        Supplier supplier = new Supplier(name,thumbnail, address,String.valueOf(phone), email, description,10,user_id, company_name,website,Util.generateSlug(name));
        boolean status = Load_Supplier.insertSupplier(supplier);

        if(status) {
            request.setAttribute("page_menu", "login");
            request.setAttribute("title", "Đăng nhập");
            request.setAttribute("status",2);
            request.setAttribute("status_content","Đăng ký thành công, vui lòng đăng nhập");
            request.getRequestDispatcher("user_page/Login.jsp").forward(request,response);
            return;
        }else{

        }
    }
}
