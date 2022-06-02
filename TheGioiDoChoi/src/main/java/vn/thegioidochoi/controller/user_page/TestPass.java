package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.database.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.header_footer.Category;
import vn.thegioidochoi.model.header_footer.LoadHeaderFooter;
import vn.thegioidochoi.model.header_footer.Load_Category;
import vn.thegioidochoi.model.supplier.Load_Supplier;
import vn.thegioidochoi.model.user.LoadUser;
import vn.thegioidochoi.model.util.Util;

import java.io.UnsupportedEncodingException;
import java.sql.Array;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLOutput;
import java.text.Normalizer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

public class TestPass {
    public static void main(String[] args) throws UnsupportedEncodingException, SQLException, ParseException {
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


//        String url = "&cate=do-dung-nha-bep";
//        String part = "cate";
//        System.out.println(Util.cutTheSameUrlPart(url,part));
//        String[] age = {"1","2","3"};
//        String ages = Arrays.toString(age);
//        System.out.println(ages.replace("[","(").replace("]",")"));
//        System.out.println(Util.makeMitilUrlParam("age",new String[]{"1","2","3"}));
//        for (Product p: ProductEntity.loadProducts("","do-choi-da-ngoai",50000,3000000,new Integer[]{1,2},new Integer[]{1,2},"",1)
//             ) {
//            System.out.println(p);
//
//        }
//        Array array = DBCPDataSource.getConnection().createArrayOf("int",new Integer[]{1,2});
//        Connection connection = DBCPDataSource.getConnection();
//        Array arrays = connection.createArrayOf("varchar",new Object[]{"1","2"});
//        System.out.println(ProductEntity.loadBestSellerProducts());
////        System.out.println(DBCPDataSource.getNumActive());
//        TestPass thread = new TestPass();
//
//        TestPass thread2 = new TestPass();
//        TestPass thread3 = new TestPass();
//        TestPass thread4 = new TestPass();
//        TestPass thread5 = new TestPass();
//        TestPass thread6 = new TestPass();
//        TestPass thread7 = new TestPass();

//        System.out.println("This code is outside of the thread");
//        long time = System.currentTimeMillis();
//
//            thread.start();
//            thread2.start();
//            thread3.start();
//            thread4.start();
//            thread5.start();
//            thread6.start();
//            thread7.start();

//        System.out.println(ProductEntity.loadProducts(null,"do-choi-da-ngoai",50000,3000000,"1,2","(1,2)","p.price_sale asc",0));
//        Util.cutUrlAgeGender("&cate=bup-be&price_min=241&age=tren-12-tuoi&price_max=3779&age=tren-12-tuoi","age=tren-12-tuoi");
//        System.out.println(Util.makeSqlConditionAgeGender("gender",new String[]{"gt-nam","gt-unisex"}));
//        System.out.println(Util.dateFormat(new Date()));
//        LoadUser.insertUser("Trinh Quang Tiến","trinhtien6236@gmail.com","Tien@123","0335364399",1,"2000-01-01","Long An",1,1);

        Date date = new SimpleDateFormat("yyyy-MM-dd").parse("2000-01-01");
        System.out.println(date);
    }


}
