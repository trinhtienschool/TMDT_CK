package vn.thegioidochoi.controller.admin_page;

import org.apache.commons.fileupload.FileItem;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.supplier.Load_Supplier;
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

@WebServlet(urlPatterns = {"/admin_page/add-product", "/vendor_page/add-product"})
public class Add_product_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("role_id") == null) {
            response.sendRedirect("../home");
            return;
        } else {
            int role_id = (int) session.getAttribute("role_id");
            if (role_id == 1) {
                response.sendRedirect("../home");
                return;
            }
        }
        request.setAttribute("current_page", "product");
        String type = request.getParameter("type");
        List<Supplier> suppliers = Load_Supplier.loadSupplier_view();
        request.setAttribute("suppliers", suppliers);
        if (type != null) {
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
                product.setImageUrls(ProductEntity.loadProductImagesById(id));
                request.setAttribute("product", product);
                System.out.println("Dang vao edit product ");
                request.getRequestDispatcher("add-product.jsp").forward(request, response);

                return;
            }else if(type.equalsIgnoreCase("delete")){
                int id =Integer.parseInt(request.getParameter("pro-id"));
                ProductEntity.deleteProductById(id);
                System.out.println("Da xoa san phammmmmmmmmmm");
                request.getRequestDispatcher("product").forward(request,response);
                return;
            }
            //todo
        }
        Iterator<FileItem> i = Util.uploadFile(request, response);

        FileItem fiImg = null;
        Map<String, String> pair = new HashMap<String, String>();
        Map<String, FileItem> pairImg = new HashMap<String, FileItem>();
        while (i.hasNext()) {
            FileItem fi = i.next();
            if (fi.isFormField()) {
                pair.put(fi.getFieldName(), fi.getString("UTF-8").trim());
                System.out.println("Dang vao isFormField");
                System.out.println(fi.getFieldName());
                System.out.println(fi.getString("UTF-8").trim());
                System.out.println("ket thuc vao isFormField");
            } else if (!fi.isFormField()) {
                System.out.println("Not FormFielddddddddddddd:");
                System.out.println(fi.getFieldName());
                System.out.println(fi);
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
                System.out.println("Ket thuc vao fiImg");
            }
        }
        type = pair.get("type");
        String name = pair.get("name");
        String slug = Util.generateSlug(name);
        int category_id = Integer.parseInt(pair.get("category_id"));
        int supplier_id = 0;
        if (pair.get("supplier_id") == null)
            supplier_id = (int) session.getAttribute("supplier_id");
        else supplier_id = Integer.parseInt(pair.get("supplier_id"));
        int age = Integer.parseInt(pair.get("age"));
        int gender = Integer.parseInt(pair.get("gender"));
        double price = Double.parseDouble(pair.get("price").replaceAll("\\D", ""));
        int is_sale = pair.get("is_sale") == null ? 0 : 1;
        int is_highlight = pair.get("is_highlight") == null ? 0 : 1;
        int percent_sale = 0;
        double price_sale = 0;
        String date_start_sale = Util.dateFormat(new Date());
        String date_end_sale = Util.dateFormat(new Date());
        if (is_sale == 1) {
            percent_sale = pair.get("percent_sale").isEmpty() ? 0 : Integer.parseInt(pair.get("percent_sale"));
            price_sale = pair.get("price_sale").isEmpty() ? 0 : Double.parseDouble(pair.get("price_sale"));
            date_start_sale = pair.get("date_start_sale").isEmpty() ? Util.dateFormat(new Date()) : pair.get("date_start_sale");
            date_end_sale = pair.get("date_end_sale").isEmpty() ? Util.dateFormat(new Date()) : pair.get("date_end_sale");
        }
        int active = pair.get("active") == null ? 0 : 1;
        String sku = pair.get("sku");
        int quantity = Integer.parseInt(pair.get("quantity"));
        String description = pair.get("description");
        String content = pair.get("content");
        String date_created = Util.dateFormat(new Date());
        //Danh cho edit
        int id = pair.get("id") == null ? 0 : Integer.parseInt(pair.get("id"));


//        System.out.println("imgUrls la: "+imgUrls);
//        String originalImg = pair.get("img")==null?"imgs/products/default_img.png":pair.get("img");
//        System.out.println("pair.getImg: "+pair.get("img"));
//        System.out.println("original img: "+originalImg);
//        String img = imgUrls.isEmpty()?originalImg:imgUrls.get(0);
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


        if (type.equalsIgnoreCase("add")) {

            request.setAttribute("type", "add");
            request.setAttribute("title", "Thêm sản phẩm");
            if (thumbnail == null) thumbnail = "imgs/products/default_img.png";
            boolean isInsert = ProductEntity.insertProduct(name, price, description, content, supplier_id, active, percent_sale,
                    price_sale, category_id, quantity, is_sale, date_start_sale,
                    date_end_sale, slug, sku, age, gender, thumbnail, is_highlight, date_created);
            if (isInsert) {
                Product pro_saved = ProductEntity.loadProductBySlug(slug);
                System.out.println("Imagessssssssssssss: ");
                System.out.println(imgs);
                if (imgs.size() != 0) ProductEntity.insertProductImage(pro_saved.getId(), imgs);
                request.getRequestDispatcher("add-product.jsp").forward(request, response);
            }
        } else if (type.equalsIgnoreCase("edit")) {
            request.setAttribute("type", "edit");
            request.setAttribute("title", "Chỉnh sửa");
            System.out.println("co vao edit");
            boolean isUpdate = ProductEntity.updateProduct(id, name, price, description, content, supplier_id, active, percent_sale, price_sale,
                    category_id, quantity, is_sale, date_start_sale, date_end_sale, slug, sku, age, gender,
                    thumbnail, is_highlight);
            if (imgs.size() != 0) ProductEntity.updateProductImages(id, imgs);
            Product product = ProductEntity.loadProductById(id);
            product.setImageUrls(ProductEntity.loadProductImagesById(id));
            request.setAttribute("product", product);
            request.getRequestDispatcher("add-product.jsp").forward(request, response);

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


//    public String getCategoryName(int category_id){
//        String category_name=null;
//        if(category_id==1) category_name="cay_de_ban";
//        else if(category_id==2) category_name="cay_day_leo";
//        else if(category_id==3) category_name="cay_tet";
//        else if(category_id==4) category_name = "cay_thuy_sinh";
//        else if(category_id==5) category_name = "cay_trong_nha";
//        else if(category_id==6) category_name = "cay_ngoai_vuon";
//        return category_name;
//    }
}
