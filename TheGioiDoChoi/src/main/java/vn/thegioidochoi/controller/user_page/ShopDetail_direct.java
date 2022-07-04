package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.header_footer.Category;
import vn.thegioidochoi.model.header_footer.Load_Category;
import vn.thegioidochoi.model.image.Image;
import vn.thegioidochoi.model.image.LoadImage;
import vn.thegioidochoi.model.supplier.Load_Supplier;
import vn.thegioidochoi.model.supplier.Supplier;
import vn.thegioidochoi.model.user.LoadUser;
import vn.thegioidochoi.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/shop-detail")
public class ShopDetail_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page_menu","shopping");
        request.setAttribute("title","Chi tiết sản phẩm");
        String product_slug=request.getParameter("product");
        Product product= ProductEntity.loadProductBySlug(product_slug);
        int id = product.getId();
        Product prostar5=ProductEntity.loadCountStarByIdProAndIdStar(id,1);
        Product prostar4=ProductEntity.loadCountStarByIdProAndIdStar(id,2);
        Product prostar3=ProductEntity.loadCountStarByIdProAndIdStar(id,3);
        Product prostar2=ProductEntity.loadCountStarByIdProAndIdStar(id,4);
        Product prostar1=ProductEntity.loadCountStarByIdProAndIdStar(id,5);
        Product procountcomment=ProductEntity.loadCountCommentByIdPro(id);
        Product proavgstar=ProductEntity.loadCountAvgstarByIdPro(id);

        Supplier supplier = Load_Supplier.loadSupplierById(product.getSupplier_id());

        List<Image> images = LoadImage.loadListImage(id);

        int cateid=product.getCategory_id();
        List<Product> relaproducts=ProductEntity.loadRelativeProduct(cateid,id);
        Category category = Load_Category.loadCategoryById(cateid);
        List<User> users= LoadUser.loadOrderCommentByIdUser(id);
        request.setAttribute("product",product);
        request.setAttribute("category",category);
        System.out.println("Đã vào trang chi tiết sản phẩm ttttttttttttttt");
        request.setAttribute("supplier", supplier);
        request.setAttribute("images", images);

        int totalratestar=prostar5.getCountstar()+prostar4.getCountstar()+prostar3.getCountstar()+prostar2.getCountstar()+prostar1.getCountstar();
        request.setAttribute("id",id);
        request.setAttribute("prostar5",prostar5);
        request.setAttribute("prostar4",prostar4);
        request.setAttribute("prostar3",prostar3);
        request.setAttribute("prostar2",prostar2);
        request.setAttribute("prostar1",prostar1);
        request.setAttribute("totalratestar",totalratestar);
        request.setAttribute("procountcomment",procountcomment);
        request.setAttribute("proavgstar",proavgstar);
        request.setAttribute("relaproducts",relaproducts);
        request.setAttribute("usercomment",users);

        System.out.println("chuan bi vao shop-detail");
        System.out.println(users);

        System.out.println(users);
        System.out.println(product);

        HttpSession session = request.getSession();
        if(session.getAttribute("user_id") !=null) {
            int user_id = (int) session.getAttribute("user_id");
            ProductEntity.insertRecentViewProduct(user_id, id);

            List<Product> viewProducts = ProductEntity.loadViewProducts(user_id);
            session.setAttribute("vp",viewProducts);
        }else{
            if(session.getAttribute("vp") !=null) {
                List<Product> vp = (List<Product>)session.getAttribute("vp");
                vp.add(product);
                session.setAttribute("vp",vp);
            }else{
                List<Product>vp = new ArrayList<>();
                vp.add(product);
                session.setAttribute("vp",vp);
            }
        }
        System.out.println("Dang chuyen qua JSPPPPPPPPPPPPPPPPPPPPPPP");
        request.getRequestDispatcher("user_page/shop-detail.jsp").forward(request,response);
    }
}
