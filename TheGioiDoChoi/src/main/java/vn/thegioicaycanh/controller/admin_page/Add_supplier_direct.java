package vn.thegioicaycanh.controller.admin_page;

import org.apache.commons.fileupload.FileItem;
import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.blog.Blog;
import vn.thegioicaycanh.model.blog.Blog_Con_DB;
import vn.thegioicaycanh.model.supplier.Load_Supplier;
import vn.thegioicaycanh.model.supplier.Supplier;
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

@WebServlet(urlPatterns = "/admin_page/add-supplier")
public class Add_supplier_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","supplier");
        String type = request.getParameter("type");
        if(type !=null) {
            if (type.equalsIgnoreCase("enterAdd")) {
                request.setAttribute("type", "add");
                request.setAttribute("title", "Thêm nhà cung cấp");
                request.getRequestDispatcher("add-supplier.jsp").forward(request, response);
                return;
            }else if (type.equalsIgnoreCase("enterEdit")) {
                request.setAttribute("type", "edit");
                request.setAttribute("title", "Chỉnh sửa nhà cung cấp");
                int id = Integer.parseInt(request.getParameter("id"));
                Supplier supplier=Load_Supplier.loadSupplier(id);
                request.setAttribute("supplier", supplier);
                request.getRequestDispatcher("add-supplier.jsp").forward(request, response);
                return;
            }
        }
//
//
//        Iterator<FileItem> i = Util.uploadFile(request,response);
//
//        FileItem fiImg=null;
//        Map<String,String>pair = new HashMap<String,String>();
//        while(i.hasNext()){
//            FileItem fi =i.next();
//            if(fi.isFormField()){
//                pair.put(fi.getFieldName(),fi.getString("UTF-8").trim());
//            }
//            else if(!fi.isFormField()){
//                fiImg=fi;
//                System.out.println("co vao fiImg");
//            }
//        }
//        type = pair.get("type");
//        String name = pair.get("name");
//        String address=pair.get("address");
//        String email=pair.get("email");
//        String phone=pair.get("phone");
////        String id = pair.get("id");
//        String id="3";
//
////        double price = Double.parseDouble(pair.get("price"));
////
////        String description = pair.get("description");
////        String content = pair.get("content");
////        int supplier_id = Integer.parseInt(pair.get("supplier_id"));
////        int type_weight = Integer.parseInt(pair.get("type_weight"));
////
////        int active = pair.get("active")==null?0:1;
////        int percent_sale = pair.get("percent_sale").isEmpty()?0:Integer.parseInt(pair.get("percent_sale"));
////        double price_sale =pair.get("price_sale").isEmpty()?0: Double.parseDouble(pair.get("price_sale"));
////        int category_id = Integer.parseInt(pair.get("category_id"));
////        int quantity =Integer.parseInt(pair.get("quantity"));
////        int is_sale = pair.get("is_sale")==null?0:1;
////        String date_start_sale = pair.get("date_start_sale").isEmpty()? Util.dateFormat(new Date()):pair.get("date_start_sale");
////        String date_end_sale = pair.get("date_end_sale").isEmpty()?Util.dateFormat(new Date()):pair.get("date_end_sale");
//        String slug = Util.generateSlug(name);
////        String date_created = Util.dateFormat(new Date());
////
////        int id = pair.get("id")==null?0:Integer.parseInt(pair.get("id"));
////
//
//
////        String img = imgUrls.isEmpty()?originalImg:imgUrls.get(0);
//
//        String img=null;
//        String urlImg = Util.getUrlFileFromUpload(fiImg,slug,"imgs/supplier/"+slug);
////        +getCategoryName(category_id)
//        if(urlImg!=null)
//            img = urlImg;
////        System.out.println("imgUrls la: "+img);
////        String originalImg = pair.get("img")==null?"imgs/products/default_img.png":pair.get("img");
////        System.out.println("pair.getImg: "+pair.get("img"));
////        System.out.println("original img: "+originalImg);
        if(type.equalsIgnoreCase("add")){
            request.setAttribute("type","add");
            request.setAttribute("title","Thêm nhà cung cấp");
//            String logo= request.getParameter("logo");
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            int phone=Integer.parseInt(request.getParameter("phone"));
            String email=request.getParameter("email");
            boolean isInsert = Load_Supplier.insertSupplier(name,address,phone,email);
//            if(isInsert)
                request.getRequestDispatcher("add-supplier.jsp").forward(request,response);
        }else if(type.equalsIgnoreCase("edit")){
            request.setAttribute("type","edit");
            request.setAttribute("title","Chỉnh sửa nhà cung cấp");
            System.out.println("co vao edit");
//            String logo= request.getParameter("logo");
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            int phone=Integer.parseInt(request.getParameter("phone"));
            String email=request.getParameter("email");
             int id=Integer.parseInt(request.getParameter("id"));
            System.out.println(id);
            boolean isUpdate = Load_Supplier.updateSupplier(id,name,address,phone,email);
            Supplier su = Load_Supplier.loadSupplier(id);
            request.setAttribute("supplier",su);
            request.getRequestDispatcher("add-supplier.jsp").forward(request,response);

        }

//        if(type.equalsIgnoreCase("add")){
//            img = img==null?"imgs/supplier/default_img.png":img;
//            request.setAttribute("type","add");
//            request.setAttribute("title","Thêm nhà cung cấp");
//            int phones=Integer.parseInt(phone);
//            boolean isInsert = Load_Supplier.insertSupplier(img,name,address,phones,email);
//            request.getRequestDispatcher("add-supplier.jsp").forward(request,response);
//
//        }else if(type.equalsIgnoreCase("edit")){
//            request.setAttribute("type","edit");
//            request.setAttribute("title","Chỉnh sửa nhà cung cấp");
//            System.out.println("co vao edit");
//            int phones=Integer.parseInt(phone);
//            int ids=Integer.parseInt(id);
//            boolean isUpdate = Load_Supplier.updateSupplier(ids,img,name,address,phones,email);
//
//            Product product = ProductEntity.loadProductById(ids);
//            request.setAttribute("",product);
//            request.getRequestDispatcher("add-product.jsp").forward(request,response);
//            Supplier supplier=Load_Supplier.loadSupplier(ids);
//            request.setAttribute("supplier", supplier);
//            request.getRequestDispatcher("add-supplier.jsp").forward(request, response);
//        }


    }}
