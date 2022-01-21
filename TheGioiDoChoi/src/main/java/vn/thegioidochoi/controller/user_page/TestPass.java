package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.header_footer.Category;
import vn.thegioidochoi.model.header_footer.LoadHeaderFooter;
import vn.thegioidochoi.model.header_footer.Load_Category;
import vn.thegioidochoi.model.supplier.Load_Supplier;
import vn.thegioidochoi.model.user.LoadUser;
import vn.thegioidochoi.model.user.User;
import vn.thegioidochoi.model.util.Util;

import java.io.UnsupportedEncodingException;
import java.sql.SQLOutput;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

public class TestPass {
    public static void main(String[] args) throws UnsupportedEncodingException {
//        int id = 1;
//        String email = "trinhtien6236@gmail.com";
//        String pass = "Tien12345@";
//        long passEn =  id*email.hashCode()*pass.hashCode();
//        System.out.println(passEn);
//        List<Category> categories = LoadHeaderFooter.loadCategories();
//        List<Category> removeCategories = new ArrayList<Category>();
//        System.out.println("Da ra");
//        for(Category cate: categories){
//            if(cate.getId() == cate.getMaster_id()){
//                for(int i=0;i<categories.size();i++){
//                    Category sub_cate = categories.get(i);
//                    if(sub_cate.getMaster_id() == cate.getId() && sub_cate.getMaster_id() !=sub_cate.getId()){
//                        cate.getSubcategories().add(sub_cate);
//                        removeCategories.add(sub_cate);
//                        System.out.println(sub_cate);
//                    }
//                }
//            }
//        }
//        for(Category category: removeCategories){
//            categories.remove(category);
//        }
//        System.out.println(Load_Supplier.loadBestSupplier(10));

//        System.out.println(Util.generateSlug("Trịnh Quang Tiến"));
//    List<Product> products = ProductEntity.loadAllProducts();
//    long number = new Date().getTime();
//    for(Product product: products){
//        String name = product.getName().replaceAll("'","");
//        ProductEntity.updateProducts(product.getId(),name,Util.generateSlug(name.replaceAll("-",""))+"-"+number++);
//
//   }
//        for(int i=1;i<=267;i++){
//            ProductEntity.updateProducts(i,"","");
//        }
//        String text = "Xe đạp trẻ em Flying Bear 12' Vàng";
//        System.out.println(text.replaceAll("'",""));
//        String t = "đi tìm hạnh phúc";
//        System.out.println(Util.generateSlug(t));
//        String str = "đi tìm hạnh phúc";
//        char c = '\u00F6';
//        Character letter = new Character('đ');
//        System.out.println(str);
//        System.out.println(letter);
//        System.out.println(Util.generateSlug(str));

//        System.out.println(Load_Supplier.loadBestSupplier(6));
        List<User> users  = LoadUser.loadOrderCommentByIdUser(1);
        for(User u: users){
            System.out.println(u);
        }
    }

}
