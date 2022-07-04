package vn.thegioidochoi.controller.user_page;

import com.fasterxml.jackson.databind.util.JSONPObject;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.JSONObject;
import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.database.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.header_footer.Category;
import vn.thegioidochoi.model.header_footer.LoadHeaderFooter;
import vn.thegioidochoi.model.header_footer.Load_Category;
import vn.thegioidochoi.model.mail.Mail;
import vn.thegioidochoi.model.order_product.OrderProduct;
import vn.thegioidochoi.model.order_product.OrderProduct_Con_DB;
import vn.thegioidochoi.model.supplier.Load_Supplier;
import vn.thegioidochoi.model.supplier.Supplier;
import vn.thegioidochoi.model.user.EmailConfirm;
import vn.thegioidochoi.model.user.LoadUser;

import vn.thegioidochoi.model.user.User;

import vn.thegioidochoi.model.util.Util;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Array;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLOutput;
import java.text.Normalizer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.util.*;
import java.util.regex.Pattern;

public class TestPass {

    public static void main(String[] args) throws IOException, SQLException, ParseException {
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

//        Date date = new SimpleDateFormat("yyyy-MM-dd").parse("2000-01-01");
//        System.out.println(date);
//
//        List<User> users  = LoadUser.loadOrderCommentByIdUser(1);
//        for(User u: users){
//            System.out.println(u);
//        }
//
//        List<Supplier>suppliers = Load_Supplier.loadSupplierByKeySearch("");
//        for(Supplier s:suppliers){
//            System.out.println(s);
//        }

//        System.out.println(toKhongDau("Đồ Chơi Đoan Khang Vina - Công Ty TNHH Dịch Vụ Và Thương Mại Đoan Khang Vina"));
//        System.out.println(System.currentTimeMillis());
//        for(int i=1;i<=267;i++){
//            ProductEntity.updateProductSlug(i,toKhongDau(ProductEntity.loadProductById(i).getName())+"-"+System.currentTimeMillis());
//        }


//        for(int i=1;i<=45;i++){
//            Load_Supplier.updateSupplierSlug(i,toKhongDau(Load_Supplier.loadSupplierById(i).getName())+"-"+System.currentTimeMillis());
//        }

//        List<Supplier>suppliers = Load_Supplier.loadSupplier_view();
//        for(Supplier supplier: suppliers){
//            String[] arr = supplier.getCompany_name().split("-");
//            if(arr.length == 2){
//                String name = arr[0].trim();
//                System.out.println("Name: "+name);
//                Load_Supplier.updateSupplierName(supplier.getId(),name);
//            }
//        }

//        String url = Util.cutUrlAgeGender("http://localhost:8082","sup-slug=do-choi-tre-em-phu-thai---cong-ty-tnhh-mtv-dau-tu-va-dv-tm-phu-thai-1654682046457");
//        System.out.println(url);

//        String dir = System.getProperty("user.dir");
//        System.out.println(dir);

//        Set<TestPair> testPairs = new HashSet<TestPair>();
//        testPairs.add(new TestPair(354,43,43));
//        testPairs.add(new TestPair(354,43,42));
//        testPairs.add(new TestPair(354,43,41));
//
//        System.out.println(testPairs.size());
//        System.out.println(testPairs.contains(new TestPair(354,43,65)));

//        List<Product>products = ProductEntity.loadProductSameSupOrderId(1);
//        System.out.println(products);
//        List<Integer>order_ids = OrderProduct_Con_DB.loadAllOrderProductId();
//        System.out.println(order_ids);


//        Product product = ProductEntity.loadProductByOrderId(1);
//        System.out.println(product);
//        List<OrderProduct> orderProducts = new ArrayList<OrderProduct>();
//        for(int i=1;i<=3011;i++){
//            OrderProduct orderProduct= new OrderProduct();
//            Product p1 = ProductEntity.loadProductByOrderId(i);
//            orderProduct.setOrder_id(i);
//            orderProduct.setPro_id(p1.getId());
//            int random = (int) ((Math.random() * (4 - 1)) + 1);
//            orderProduct.setQuantity(random);
//            orderProduct.setPrice(p1.getPriceSaleOrPrice());
//            int randTrue = (int) ((Math.random() * (2-0)) + 0);
//            orderProduct.setStatus(randTrue==1?true:false);
//            orderProduct.setTotal_price(random*p1.getPriceSaleOrPrice());
//            orderProducts.add(orderProduct);
//        }
//
//        System.out.println(orderProducts.size());
//        try {
//            // Creates a FileWriter
//            FileWriter file = new FileWriter("C:\\Users\\trinh\\Desktop\\writefile\\file.txt");
//
//            // Creates a BufferedWriter
//            BufferedWriter output = new BufferedWriter(file);
//
//            // Writes the string to the file
//            for(OrderProduct orderProduct:orderProducts) {
//
//                String line = orderProduct.toLine();
//                output.write(line);
//                output.newLine();
//                output.flush();
//            }
//
//            // Closes the writer
//            output.close();
//        }
//
//        catch (Exception e) {
//            e.getStackTrace();
//        }
//        System.out.println("1.324,323 đ".replaceAll("\\D",""));
//        System.out.println(ProductEntity.loadProductById(1));
//        float tien = 100;
//        System.out.println(String.format("%.0f",tien));
//        OkHttpClient client = new OkHttpClient().newBuilder().build();
//        Request request = new Request.Builder()
//                .url("https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/vnd.json")
//                .method("GET",null)
//            .build();
//
//    Response response = client.newCall(request).execute();
//        JSONObject jsonObject = new JSONObject(response.body().string());
//        double exchangeRate = jsonObject.getJSONObject("vnd").getDouble("usd");
//        System.out.println(exchangeRate*100000);
//    System.out.println(response.body().string());
//        System.out.println((double) Math.ceil(5.26783 * 100) / 100);
//        System.out.println(Util.formatNumber(46543125.26783));
//        List<Product> products = ProductEntity.loadHighLightProducts();
//        for(Product product:products){
//            System.out.println(product);
//        }
        //Getting the current month
//        LocalDate currentdate = LocalDate.now();
//        System.out.println("Current date: "+currentdate);
//        Month currentMonth = currentdate.getMonth();
//        System.out.println("Current month: "+currentMonth.getValue());
//        int currentYear = currentdate.getYear();
//        System.out.println("Current month: "+currentYear);

//        Mail.sendMail("Hi","Xin chào","trinhtien2212@gmail.com");
//        System.out.println((int) ((Math.random() * (999999 - 111111)) + 111111));
//        System.out.println(LoadUser.saveEmailConfirm("trinhquangtien3@gmail.com","Tiến",123456));
//        LoadUser.saveEmailConfirm("trinhquangtien5543@gmail.com","Tiến",123456);
//        EmailConfirm emailConfirm = LoadUser.loadEmailConfirm("trinhquangtien5543@gmail.com");
//        System.out.println(System.currentTimeMillis()-emailConfirm.getTime_created());
        System.out.println(1000*60*5);
    }



}
