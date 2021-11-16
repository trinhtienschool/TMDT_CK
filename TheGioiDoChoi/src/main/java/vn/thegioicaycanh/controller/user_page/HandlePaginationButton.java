package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.blog.Blog;
import vn.thegioicaycanh.model.blog.Blog_Con_DB;
import vn.thegioicaycanh.model.coupon_code.CouponCode;
import vn.thegioicaycanh.model.coupon_code.Coupon_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet(urlPatterns = "/handlePagination")
public class HandlePaginationButton extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //khoi tao gia tri ban dau cho finalProduct
        //finalProduct la danh sach san pham sau khi da xu li
        //finalProduct CHI DUOC DUNG DE XU LI SEARCH
        List<Product> finalProduct=null;

        //lay chuoi sql
        String sql = (String)request.getAttribute("sql");

        //lay chuoi countSql: chinh la cau lenh de lay ra TONG so san pham thoa dieu kien
        String countSql = (String)request.getAttribute("sumOfItems_sql");
        System.out.println("sql: "+sql);
        System.out.println("sc");

        //lay ra chi so trang hien tai de hien thi
        int pages=1;
        if(request.getAttribute("pages") !=null){
            pages = (int)request.getAttribute("pages");
        }


        //khoi tao tong so product/blog thoa dieu kien se duoc load tu database
        int sumOfItems=0;

        //so product/blog se hien thi trang 1 trang
        int last = (int)request.getAttribute("numOfItemLoad");

        //lay ra loai trang, type_page cung chinh la url_pattern cua servlet se xu li cac su kien khi client gui ve
        String type_page = (String)request.getAttribute("type_page");

        //lay ra tong so blog thoa dieu kien neu type_page co chua tu blog

        if(type_page.contains("blog")){
            sumOfItems = Blog_Con_DB.sumOfBlogs();
            System.out.println("sumOfItém"+sumOfItems);
        }
        //lay ra tong so product thoa dieu kien neu type_page co chua tu shopping
        else if(type_page.contains("shopping")){

            //Phan nay danh cho search neu co parameter keyword trong request thi se vao if nay
            if(request.getParameter("keyword")!=null){

                //lay ra tong so san pham thoa dieu kien co tu keyword da xu li o servlet truoc
                List<Product>resultSearch = (List<Product>)request.getAttribute("resultSearch");

                //load nhung san pham thoa cau lenh sql
                List<Product>conditionSearch = ProductEntity.loadProductFormSql(sql);

                //finalProduct chinh la nhung san pham nao vua thoa dieu kien search, vua thoa cac dieu kien loc, sap xep
                finalProduct = getTheCorrectProduct(resultSearch,conditionSearch);

                //tong so san pham cuoi cung bang kich thuoc cua finalProduct
                sumOfItems = finalProduct.size();
            }
            //phan nay dung cho request khong co search, chi co loc, sap xep
            else {
                System.out.println("co vao shopping");
                //tong so product thoa dieu kien sql
                sumOfItems = ProductEntity.sumOfProduct(countSql);
                System.out.println("sumOfItems: " + sumOfItems);
            }
        }
        request.setAttribute("sumOfItems",sumOfItems);

        //tinh toan tong so trang dua vao tong so product
        int sumOfPage = sumOfItems/last;
        System.out.println("sumOfPages: "+sumOfPage);
        if(sumOfItems % last !=0)
            sumOfPage++;
        if(sumOfPage==0)
            sumOfPage=1;

        //neu chi so trang <=0  thi set pages=1,
        // neu chi so trang >tong so trang & tong so trang >0 thi chi so trang = gia tri tong so trang, tuc trang cuoi cung
        int first = 0;
        if(pages<=0){
            pages=1;
        }else if(pages>sumOfPage && sumOfPage>0){
            pages=sumOfPage;
        }
        request.setAttribute("pages",pages);

        //first: san pham thu n can phai lay den last
        first =(pages-1)*last;


       //them dieu kien cho gioi han cho sql
        sql +=" limit "+first+","+last;
        System.out.println(sql);

        //load danh sach cac blog thoa dieu kien
        if(type_page.contains("blog")){
            System.out.println("co vo blog");
            List<Blog> list = Blog_Con_DB.loadLimitBlog(first,last);
            System.out.println("Blog: "+list.size());
            request.setAttribute("data",list);
        }
        //load danh sach cac product thoa dieu kien
        else if(type_page.contains("shopping")){

            //Phan nay danh cho request co parameter search
            if(finalProduct !=null){

                //tu san pham thu first lay ra last san pham
                //ham subList(indexFrom,toIndex): copy tu san pham thu indexFrom den san pham thu toIndex
                //neu first+last>size(): tuc la toIndex vuot gioi han thi chi lay duoc tu san pham thu indexFrom den size()
                //nguoc lai lay tu san pham thu indexFrom den san pham thu first+last
                finalProduct = finalProduct.subList(first,(first+last)>finalProduct.size()?finalProduct.size():(first+last));
                request.setAttribute("data",finalProduct);
            }
            //Phan nay danh cho request KHONG co parameter search
            else {
                System.out.println("co vo shopping");
                //loc ra san pham thoa dieu kien tu cau sql
                List<Product> list = ProductEntity.loadProductFormSql(sql);
                System.out.println("Product:; " + list.size());
                request.setAttribute("data", list);
            }
        }
        request.setAttribute("first",first);
        request.setAttribute("last",last);

        //cal back and next button
        String url = (String)request.getAttribute("url");

        //set attribute cho back va next, cac attribute chinh la cac link cho page truoc do hoac page ke tiep
        request.setAttribute("back",type_page+"?pages="+(pages==1?1:pages-1)+url);
        request.setAttribute("next",type_page+"?pages="+(pages<sumOfPage?pages+1:pages)+url);

        int start =1;
        int end = 5;

        //Xac dinh xem co isStill nua khong
        if(sumOfPage>5 && pages+2<sumOfPage){
            request.setAttribute("isStill",true);
        }else request.setAttribute("isStill",false);

        //Tinh toan gia tri dau va gia tri cuoi cho thanh hien thi so trang
        if(sumOfPage<=5){
            start=1;
            end=sumOfPage;
        } else if(pages>3 && pages+2<=sumOfPage) {
            start = pages - 2;
            end = pages + 2;
        }else if(pages+1==sumOfPage || pages ==sumOfPage) {
            start = pages - (sumOfPage - pages == 1 ? 3 : 4);
            end = pages + (sumOfPage - pages);
        }
        request.setAttribute("start",start);
        request.setAttribute("end",end);
        System.out.println("first: "+first);
        System.out.println("sql: "+sql);
        System.out.println("count_sql: "+countSql);
        System.out.println("back:"+request.getAttribute("back"));
        System.out.println("next:"+request.getAttribute("next"));
        System.out.println("pages:"+request.getAttribute("pages"));
        System.out.println("isStill:"+request.getAttribute("isStill"));
        System.out.println("start:"+request.getAttribute("start"));
        System.out.println("end:"+request.getAttribute("end"));
        request.getRequestDispatcher((String)request.getAttribute("direct_to")).forward(request,response);

    }

    /**
     * Tim ra cac product vua o trong danh sach san pham thoa dieu kien search,
     * vua o trong danh sach san pham thoa dieu kien loc, sắp xếp
     * @param keyProducts
     * @param conditionProduct
     * @return
     */
    public List<Product> getTheCorrectProduct(List<Product>keyProducts,List<Product>conditionProduct){
        List<Product>finalProducts = new ArrayList<Product>();
        for(Product kp : keyProducts){
            for(Product cp : conditionProduct){
                if(kp.getId()==cp.getId())
                    finalProducts.add(kp);
            }
        }
        System.out.println("final product: ");
        for(Product p:finalProducts){
            System.out.println(p.getName());
        }
        return finalProducts;
    }

}
