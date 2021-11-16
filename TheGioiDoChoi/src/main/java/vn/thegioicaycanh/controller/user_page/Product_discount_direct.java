package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.home_page.Home_page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/shopping-sale")
public class Product_discount_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleParameter(request);
        request.setAttribute("page_menu","discount");
        request.setAttribute("title","Giảm giá");
//        request.setAttribute("home_page_data",new Home_page());
        request.getRequestDispatcher("handlePagination").forward(request,response);
    }

    private void handleParameter(HttpServletRequest request) {
        int pages = 1;
        byte cate_id = 0; // danh muc
        byte date_id = 0; // ngay het han
        byte sort_id = 0; // sap xep
        byte new_sale = 0;
        String url ="";
        String sqlCondition="";
        if(request.getParameter("pages") != null) {
            pages = Integer.parseInt(request.getParameter("pages"));
        }
        if(request.getParameter("cate_id") != null) {
            cate_id = Byte.parseByte(request.getParameter("cate_id"));
            sqlCondition += " and category_id="+cate_id;
            url +="&cate_id="+cate_id;
        }
        if(request.getParameter("date_id") !=null){
            date_id=Byte.parseByte(request.getParameter("date_id"));
            url +="&date_id="+date_id;
            System.out.println(url);
            if(date_id==1){
                sqlCondition=sqlCondition+" and date_end_sale = CURRENT_DATE";
                System.out.println(sqlCondition);
            }
            else if(date_id==2){
                sqlCondition=sqlCondition+" and date_end_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY)";
            }
            else if(date_id==3){
                sqlCondition=sqlCondition+" and date_end_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY)";
            }
            else if(date_id==4){
                sqlCondition=sqlCondition+" and date_end_sale <= DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY)";
            }
            else{
                sqlCondition=sqlCondition+" and date_end_sale > DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY)";
            }
        }
        if(request.getParameter("sort_id") !=null) {
            sort_id = Byte.parseByte(request.getParameter("sort_id"));
            url +="&sort_id="+sort_id;
            if(request.getParameter("new_sale") !=null)
                new_sale = 1;
            else new_sale = 0;
            if(sort_id ==1){
                sqlCondition =" where is_sale=1 "+sqlCondition+" order by "+(new_sale==1?"date_start_sale desc,":"") +" price_sale asc";
            }else{
                sqlCondition =" where is_sale=1 "+sqlCondition+" order by "+(new_sale==1?"date_start_sale desc,":"") +" price_sale desc";
            }
        }else{
            sqlCondition =" where is_sale=1 "+sqlCondition;
        }


        // set Attribute cho request
        request.setAttribute("pages",pages);
        request.setAttribute("type_page","shopping-sale");
        request.setAttribute("cate_id",cate_id);
        request.setAttribute("sort_id",sort_id);
        request.setAttribute("date_id", date_id);
        request.setAttribute("url",url);
        request.setAttribute("numOfItemLoad",20);
        request.setAttribute("direct_to","user_page/product-discount.jsp");
        request.setAttribute("sql","select * from product "+sqlCondition);
        request.setAttribute("sumOfItems_sql","select count(*) from product "+sqlCondition);

    }
}
