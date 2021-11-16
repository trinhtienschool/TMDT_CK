package vn.thegioicaycanh.controller.admin_page;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet(urlPatterns = "/admin_page/add-product")
public class Add_product_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("current_page","product");
        String type = request.getParameter("type");
        if(type !=null) {
            if (type.equalsIgnoreCase("enterAdd")) {
                request.setAttribute("type", "add");
                request.setAttribute("title", "Thêm sản phẩm");
                System.out.println("Co vo enterAdd");
                request.getRequestDispatcher("add-product.jsp").forward(request, response);
                System.out.println("Da qua khoi qua trinh chuyen trang ****");
                return;
            } else if (type.equalsIgnoreCase("enterEdit")) {
                request.setAttribute("type", "edit");
                request.setAttribute("title", "Chỉnh sửa sản phẩm");
                int id = Integer.parseInt(request.getParameter("id"));
                Product product = ProductEntity.loadProductById(id);
                request.setAttribute("product", product);
                request.getRequestDispatcher("add-product.jsp").forward(request, response);
                return;
//            }else if(type.equalsIgnoreCase("delete")){
//                int id =Integer.parseInt(request.getParameter("id"));
//                request.getRequestDispatcher("product").forward(request,response);
            }
                //todo
        }
        Iterator<FileItem> i = Util.uploadFile(request,response);

        FileItem fiImg=null;
        Map<String,String>pair = new HashMap<String,String>();
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
        double price = Double.parseDouble(pair.get("price"));

        String description = pair.get("description");
        String content = pair.get("content");
        int supplier_id = Integer.parseInt(pair.get("supplier_id"));
        int type_weight = Integer.parseInt(pair.get("type_weight"));

        int active = pair.get("active")==null?0:1;
        int percent_sale = pair.get("percent_sale").isEmpty()?0:Integer.parseInt(pair.get("percent_sale"));
        double price_sale =pair.get("price_sale").isEmpty()?0: Double.parseDouble(pair.get("price_sale"));
        int category_id = Integer.parseInt(pair.get("category_id"));
        int quantity =Integer.parseInt(pair.get("quantity"));
        int is_sale = pair.get("is_sale")==null?0:1;
        String date_start_sale = pair.get("date_start_sale").isEmpty()? Util.dateFormat(new Date()):pair.get("date_start_sale");
        String date_end_sale = pair.get("date_end_sale").isEmpty()?Util.dateFormat(new Date()):pair.get("date_end_sale");
        String slug = Util.generateSlug(name);
        String date_created = Util.dateFormat(new Date());

        int id = pair.get("id")==null?0:Integer.parseInt(pair.get("id"));


//        System.out.println("imgUrls la: "+imgUrls);
//        String originalImg = pair.get("img")==null?"imgs/products/default_img.png":pair.get("img");
//        System.out.println("pair.getImg: "+pair.get("img"));
//        System.out.println("original img: "+originalImg);
//        String img = imgUrls.isEmpty()?originalImg:imgUrls.get(0);
        String img=null;
       String urlImg = Util.getUrlFileFromUpload(fiImg,slug,"imgs/products/"+getCategoryName(category_id));
       if(urlImg!=null)
        img = urlImg;



        if(type.equalsIgnoreCase("add")){
            img = img==null?"imgs/products/default_img.png":img;
            request.setAttribute("type","add");
            request.setAttribute("title","Thêm sản phẩm");
            boolean isInsert = ProductEntity.insertProduct(name,price,img,description,content,supplier_id
                    ,type_weight,active,percent_sale,price_sale,category_id,quantity,is_sale,date_start_sale,date_end_sale,slug,date_created);
            if(isInsert)
                request.getRequestDispatcher("add-product.jsp").forward(request,response);

        }else if(type.equalsIgnoreCase("edit")){
            request.setAttribute("type","edit");
            request.setAttribute("title","Chỉnh sửa");
            System.out.println("co vao edit");
            boolean isUpdate = ProductEntity.updateProduct(id,name,price,img,description,content,supplier_id
                    ,type_weight,active,percent_sale,price_sale,category_id,quantity,is_sale,date_start_sale,date_end_sale,slug);

            Product product = ProductEntity.loadProductById(id);
            request.setAttribute("product",product);
            request.getRequestDispatcher("add-product.jsp").forward(request,response);

        }




//        System.out.println(name);
//        System.out.println(price);
//        System.out.println(description);
//        System.out.println(content);
//        System.out.println(supplier_id);
//        System.out.println(type_weight);
//        System.out.println(active);
//        System.out.println(percent_sale);
//        System.out.println(price_sale);
//        System.out.println(category_id);
//        System.out.println(quantity);
//        System.out.println(is_sale);
//        System.out.println(date_end_sale);
//        System.out.println(date_start_sale);
//        System.out.println("Day la type: =========="+type);
    }


    public String getCategoryName(int category_id){
        String category_name=null;
        if(category_id==1) category_name="cay_de_ban";
        else if(category_id==2) category_name="cay_day_leo";
        else if(category_id==3) category_name="cay_tet";
        else if(category_id==4) category_name = "cay_thuy_sinh";
        else if(category_id==5) category_name = "cay_trong_nha";
        else if(category_id==6) category_name = "cay_ngoai_vuon";
        return category_name;
    }
}
