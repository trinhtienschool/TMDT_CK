package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.Product.ProductEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Shopping_direct_test", urlPatterns = "/shopping_test")
public class Shopping_direct_test extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        handleParameter(request);
        request.setAttribute("page_menu","shopping");
        request.setAttribute("title","Mua sắm");
////        request.setAttribute("home_page_data",new Home_page());
//        request.setAttribute("new_pros",ProductEntity.loadNewProducts(9));
//        List<Product> np = (List<Product>)request.getAttribute("new_pros");
////        System.out.println(np.size());
//        request.getRequestDispatcher("handlePagination").forward(request,response);
    }

    /**
     * Ham handleParameter: xu li cac parameter nhan duoc tu request
     * Cac parameter gom:
     * keyword:tu khoa nguoi dung nhap vao
     * pages: chi so trang hien tai phai load
     * cate_id: id cua category
     * type_view: loai hien thi (neu 1:luoi; 2:danh sach)
     * price_min: gia nho nhat nguoi dung muon loc
     * price_max: gia lon nhat nguoi dung muon loc
     * type_size: kich thuoc cua cay; khi dung trong mysql se la cot type_weight cua bang product
     * sort_id: che do sap xep (neu 1:moi nhat; 2: gia tu thap den cao; 3: gia tu cao den thap)
     * @param request
     */
    private void handleParameter(HttpServletRequest request){
//        String search = request.getParameter("search");
//        String cate = request.getParameter("cate");
//        String min_price = request.getParameter("price_min");
//        String max_price = request.getParameter("price_max");
//        String[] genders = request.getParameterValues("gender");
//        String[] ages = request.getParameterValues("age");
//        String order = request.getParameter("order");
//        String page = request.getParameter("page");
        String sql = "";

            sql += request.getParameter("cate") !=null?" c.slug = ? ":"";
           if(request.getParameter("price_min") !=null){
               sql += sql.isEmpty()?" p.price_sale between ? and ? ":" and p.price_sale between ? and ? ";
           }
           sql = generateWithAgeGender("age",sql,request);
           sql = generateWithAgeGender("gender",sql,request);




//
//        // phan xu li search:
//
//        //Khoi tao url voi gia tri mac dinh
//        //url: la duong dan se duoc dinh kem trong cac duong dan trong trang jsp
////        String url ="";
//
//        //Khoi tao keyword voi gia tri mac dinh
//        String keyword = "";
//
//        //neu parameter keyword khac null thi bien keyword=gia tri parameter keyword
//        // va them duong dan vao url
//        if(request.getParameter("keyword") !=null){
//            keyword = request.getParameter("keyword");
//            url+="&keyword="+keyword;
//        }
//
//        //neu bien keyword da duoc set gia tri moi tu dieu kien o tren (khong phai gia tri mac dinh)
//        //thi load product thoa dieu kien keyword
//        //set request thuoc tinh resultSearch
//        //set request thuoc tinh keyword
//        if(!keyword.isEmpty()){
//            List<Product>resultSearch = ProductEntity.searchProduct(keyword);
//            request.setAttribute("resultSearch",resultSearch);
//            request.setAttribute("keyword",keyword);
//        }
//        System.out.println(keyword);
//
//        //Phan xu li chung cua trang shopping
//
//        //Load gia tien lon nhat cua san pham co trong database
//        int max_price = ProductEntity.loadMax_MinPrice("select max(price) from product")/1000;
//
//        //Load gia tien nho nhat cua san pham co trong database
//        int min_price = ProductEntity.loadMax_MinPrice("select min(price) from product")/1000;
//
//        //khoi tao cac gia tri mac dinh cho cac bien
//        int pages = 1;
//        String cate_slug = "";
//        byte type_view = 1;
//
//        int price_min = min_price ; //gia tien nho nhat ma nguoi dung muon loc, mac dinh se bang gia tien nho nhat co trong database
//        int price_max = max_price; //gia tien lon nhat ma nguoi dung muon loc, mac dinh se bang gia tien lon nhat co trong database
//        byte type_size = 0;
//        byte sort_id = 0;
//
//        //Khoi tao gia tri mac dinh cho sqlCondition
//        //sqlCondition: la cac dieu kien loc khi chay cau query load du lieu tu database
//        String sqlCondition="";
//
//        //neu trong request co parameter pages thi se set lai gia tri cho bien parameter
//        if(request.getParameter("pages") != null) {
//            pages = Integer.parseInt(request.getParameter("pages"));
//        }
//
//        //neu trong request co parameter cate thi se set lai gia tri cho bien cate_slug
//        //va them dieu kien cho trang sqlCondition
//        // them doi so cho url
//
//        if(request.getParameter("cate") != null) {
//            //chuyen doi tu String sang Byte
//            cate_slug = request.getParameter("cate");
//            request.setAttribute("cate_slug",cate_slug);
//            //neu sqlCondition rong (truoc do chua duoc them dieu kien loc)
//            //thi se them dieu kien loc: category.slug=cate_slug
//            //nguoc lai them and o phia truoc dieu kien loc tren, se thanh: and slug=cate_slug
//            sqlCondition +=sqlCondition.isEmpty()?" c.slug='"+cate_slug+"'":" and c.slug='"+cate_slug+"'";
//
//            //them parameter cho link: parameter cate co gia tri bang cate_slug
//            url +="&cate="+cate_slug;
//        }
//        if(request.getParameter("type_view") != null) {
//            type_view = Byte.parseByte(request.getParameter("type_view"));
//            url +="&type_view="+type_view;
//        }
//
//        if(request.getParameter("price_min") != null) {
//            price_min = Integer.parseInt(request.getParameter("price_min"));
//            sqlCondition +=sqlCondition.isEmpty()?" p.price between "+(price_min*1000):" and p.price between "+(price_min*1000);
//            url += "&price_min=" + price_min;
//        }
////        if(request.getParameterValues("age") !=null){
////            String[] ages = request.getParameterValues("age");
////            sqlCondition +=sqlCondition.isEmpty()?" p.age in "+ Util.covertArrToString(ages):" and p.age in "+Util.covertArrToString(ages);
////            url += "&age=" + price_min;
////        }
//        if(request.getParameter("price_max") != null) {
//            price_max = Integer.parseInt(request.getParameter("price_max"));
//            url +="&price_max="+price_max;
//            sqlCondition +=sqlCondition.isEmpty()?" "+(price_max*1000):" and "+(price_max*1000);
//        }
////        if (request.getParameter("age") != null) {
////            type_size = Byte.parseByte(request.getParameter("type_size"));
////            url += "&type_size=" + type_size;
////            sqlCondition +=sqlCondition.isEmpty()?" type_weight="+type_size:" and type_weight="+type_size;
////        }
//
//        //neu trong request co parameter sort_id thi thuc hien:
//        if(request.getParameter("sort_id") !=null) {
//            sort_id = Byte.parseByte(request.getParameter("sort_id"));
//
//            //them parameter cho url: co parameter sor_id co gia tri bang gia tri cua bien sort_id
//            url +="&sort_id="+sort_id;
//            if(sort_id ==1 ){
//
//                //neu sqlCondition rong (tuc la khong co dien kien loc nao), va bay gio phai sap xep
//                //nen cho can gia dieu kien sap xep
//                //nguoc lai phai them tu WHERE o truoc dieu kien loc sau do toi phan SAP XEP
//                sqlCondition =sqlCondition.isEmpty()?" order by p.date_created desc":" where "+sqlCondition+" order by p.date_created desc";
//            }else if(sort_id ==2){
//                sqlCondition =sqlCondition.isEmpty()?" order by p.price asc":" where "+sqlCondition+" order by p.price asc";
//            }else{
//                sqlCondition =sqlCondition.isEmpty()?" order by p.price desc":" where "+sqlCondition+" order by p.price desc";
//            }
//        }else{
//            //Nguoc lai, se khong co dieu kien sap xep, nen phai them tu WHERE vao dieu kien loc
//            sqlCondition =sqlCondition.isEmpty()?"":" where "+sqlCondition;
//        }
//
//        //setAttribute cho request
//        request.setAttribute("pages",pages);
//
//        //type_page: chinh la urlpattern cua trang hien tai
//        //neu la load du lieu product thi urlpattern phai chua tu shopping
//        //neu la load du lieu blog thi urlpattern phai chua tu blog
//        request.setAttribute("type_page","shopping");
//        request.setAttribute("cate",cate_slug);
//        request.setAttribute("type_view",type_view);
//        request.setAttribute("price_min",price_min);
//        request.setAttribute("price_max",price_max);
//        request.setAttribute("type_size",type_size);
//        request.setAttribute("sort_id",sort_id);
//        request.setAttribute("url",url);
//        if(type_view == 1){
//
//            //neu trang hien thi la 1: thi se hien thi trang shop-grid
//            //phai load 18 product trong 1 trang
//            //direct_to: la duong dan den trang shopping-grid.jsp
//            request.setAttribute("numOfItemLoad",12);
//            request.setAttribute("direct_to","user_page/shopping-grid.jsp");
//        }else if(type_view == 2){
//            request.setAttribute("numOfItemLoad",10);
//            request.setAttribute("direct_to","user_page/shopping-list.jsp");
//        }
//
//        //setAttribute: sql load product cho request
//        request.setAttribute("sql","SELECT p.* FROM product p join categories c on p.category_id = c.id "+sqlCondition);
//        System.out.println("SELECT p.* FROM product p join categories c on p.category_id = c.id "+sqlCondition);
//        //setAttribute: sql sumOfItems de tinh tong so san pham tim duoc cho request
//        request.setAttribute("sumOfItems_sql","select count(*) FROM product p join categories c on p.category_id = c.id "+sqlCondition);
//
//        //map chua gia tri cua kich thuoc san pham
//        // neu kich thuoc = 1 thi ghi ra bang chu la Rat nho
//        //cac kich thuoc khac tuong tu
//        Map<Integer,String>map =new HashMap<Integer, String>();
//        map.put(1,"Rất nhỏ");
//        map.put(2,"Nhỏ");
//        map.put(3,"Lớn");
//        map.put(4,"Rất lớn");
//
//        //set map kich thuoc san pham cho request
//        request.setAttribute("type_weight_map",map);
//
//        //setAttribute gia tien lon nhat va nho nhat cua san pham trong database
//        request.setAttribute("max_price",max_price);
//        request.setAttribute("min_price",min_price);
    }
//    private List<Product> queryProduct(HttpServletRequest request){
//        List<Product>products = new ArrayList<Product>();
////        request.
//        return  products;
//    }
    private String generateWithAgeGender(String type, String sql , HttpServletRequest request){
        if(request.getParameterValues(type) !=null){
            String temp = "";
            String[] arr= request.getParameterValues(type);
            for(int i = 0;i<arr.length;i++){
                temp += " and  "+ type +" = ? ";
            }
            sql += sql.isEmpty()? temp.replaceFirst("and",""): temp;
        }
        return  sql;
    }
}