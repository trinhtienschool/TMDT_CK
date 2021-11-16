package vn.thegioicaycanh.controller.admin_page;

import org.apache.commons.fileupload.FileItem;
import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.coupon_code_type.CouponCodeType;
import vn.thegioicaycanh.model.coupon_code_type.CouponCodeType_Con_DB;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@WebServlet(urlPatterns = "/admin_page/add-coupon-code-type")
public class Add_coupon_code_type extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page","coupon-code-type");
        String type = request.getParameter("type");
        if(type !=null) {
            if (type.equalsIgnoreCase("enterAdd")) {
                request.setAttribute("type", "add");
                request.setAttribute("title", "Thêm loại mã giảm giá");
                request.getRequestDispatcher("add-coupon-code-type.jsp").forward(request, response);
                return;
            } else if (type.equalsIgnoreCase("enterEdit")) {
                request.setAttribute("type", "edit");
                request.setAttribute("title", "Chỉnh sửa loại mã giảm giá");
                int id = Integer.parseInt(request.getParameter("id"));
                CouponCodeType couponCodeType = CouponCodeType_Con_DB.loadCouponCodeTypeBy(id);
                request.setAttribute("cct", couponCodeType);
                request.getRequestDispatcher("add-coupon-code-type.jsp").forward(request, response);
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
        int id = pair.get("id")==null?0:Integer.parseInt(pair.get("id"));
        String img=null;
        String urlImg = Util.getUrlFileFromUpload(fiImg,Util.generateSlug(name),"imgs/coupon_code_type");
        if(urlImg!=null)
            img = urlImg;

        if(type.equalsIgnoreCase("add")){
            request.setAttribute("type","add");
            request.setAttribute("title","Thêm loại mã giảm giá");
            boolean isInsert = CouponCodeType_Con_DB.insertCouponCodeType(name,img);
            if(isInsert)
                request.getRequestDispatcher("add-coupon-code-type.jsp").forward(request,response);

        }else if(type.equalsIgnoreCase("edit")){
            request.setAttribute("type","edit");
            request.setAttribute("title","Chỉnh sửa loại mã giảm giá");
            System.out.println("co vao edit");
            boolean isUpdate = CouponCodeType_Con_DB.updateCouponCodeType(id,name,img);

            CouponCodeType couponCodeType = CouponCodeType_Con_DB.loadCouponCodeTypeBy(id);
            request.setAttribute("cct",couponCodeType);
            request.getRequestDispatcher("add-coupon-code-type.jsp").forward(request,response);

        }
    }
}
