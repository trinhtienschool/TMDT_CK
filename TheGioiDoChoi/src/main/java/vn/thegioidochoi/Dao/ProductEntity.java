
package vn.thegioidochoi.Dao;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;
import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.util.Util;


import java.sql.*;
import java.time.LocalDate;
import java.time.Month;
import java.util.*;
import java.util.Date;

public class ProductEntity {

    public static List<Product> loadProducts(String search, String category, int price_min, int price_max, String genders, String ages, String order, int page) {
        List<Product> productList = new ArrayList<Product>();
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("\n" +
                    "select p.* from product p join categories c on p.category_id=c.id\n" +
                    "where c.slug = ? and p.price_sale BETWEEN ? and ?\n" +
                    "and age in ? and gender in ? \n" +
                    "ORDER BY ?");

            pe.setString(1, category);
            pe.setInt(2, price_min);
            pe.setInt(3, price_max);
            pe.setString(4,ages);
            pe.setString(5,genders);
            pe.setString(6,order);

            System.out.println(pe.toString());
//            System.out.println((JDBC4PreparedStatement)pe.asSql());
            synchronized (pe) {
                ResultSet resultSet = pe.executeQuery();
                System.out.println(resultSet.getStatement().toString());
                while (resultSet.next()) productList.add(getProduct(resultSet));
                resultSet.close();
            }
            pe.close();
            return productList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }

    public static List<Product> loadBestSellerProducts(){
        LocalDate currentdate = LocalDate.now();
        Month currentMonth = currentdate.getMonth();
        int currentYear = currentdate.getYear();

        String sql = "select p.*\n" +
                "from order_product op join `order` o on op.order_id=o.id join product p on p.id = op.pro_id\n" +
                "where p.active=1 and MONTH(o.date_created)= "+currentMonth.getValue()+" and year(o.date_created)= "+currentYear+" \n" +
                "group by op.pro_id\n" +
                "order by sum(op.quantity) desc\n" +
                "limit 12";
        return loadProductFormSql(sql);
    }
    public static List<Product> loadViewProducts(int userId){
        String sql = "select p.* from product p join recent_view_products rp on p.id = rp.pro_id\n" +
                "where p.active=1 and rp.user_id = "+userId+" ORDER BY rp.date desc limit 8";
        return loadProductFormSql(sql);
    }
    public static List<Product> loadDiscountProducts(int num) {
        String sql = "select *" +
                "from product p " +
                "WHERE active=1 and is_sale=1 and discription is not null " +
                "and content is not null " +
                "ORDER BY percent_sale DESC LIMIT " + num;
        return loadProductFormSql(sql);
    }

    public static List<Product> loadNewProducts(int num) {
        String sql = "SELECT * from product where active=1 " +
                "order by date_created desc LIMIT " + num;
        return loadProductFormSql(sql);
    }
    public static List<Product> loadProductSameSupOrderId(int order_id) {
        String sql = "select * from product p join `order`  o on p.supplier_id = o.supplier_id where o.id="+ order_id;
        return loadProductFormSql(sql);
    }

    public static Product loadProductById(int id) {
        String sql = "select * from product where id=" + id;
        List<Product> products = loadProductFormSql(sql);
        if (products.isEmpty())
            return null;
        return products.get(0);
    }
    public static List<String> loadProductImagesById(int id) {
        String sql = "select * from images where pro_id = " + id;

        List<String> images = new ArrayList<String>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    images.add(resultSet.getString(2));
                }
                resultSet.close();
            }
            statement.close();
            return images;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static Product loadProductByOrderId(int order_id) {
        String sql = "select p.* from product p join `order`  o on p.supplier_id = o.supplier_id where o.id ="+order_id+ " order by RAND() LIMIT 1";
        List<Product> products = loadProductFormSql(sql);
        if (products.isEmpty())
            return null;
        return products.get(0);
    }
    public static Product loadProductBySlug(String slug) {
        String sql = "select * from product where slug='" + slug+"'";
        List<Product> products = loadProductFormSql(sql);
        if (products.isEmpty())
            return null;
        return products.get(0);
    }

    public static List<Product> loadMostRating(int num) {
        String sql = "SELECT * from product p join rating r on p.id=r.pro_id where r.rating_type_id  = (SELECT  max(r1.rating_type_id) from rating r1) LIMIT " + num;
        return loadProductFormSql(sql);
    }

    public static List<Product> loadListProductBySupplierId(int supplier_id){
        String sql = "SELECT * from product where active=1 and supplier_id  = " + supplier_id;
        return loadProductFormSql(sql);
    }

    public static List<Product> loadFirstPros(int num) {
        String sql = "SELECT * from product p where p.active=1 LIMIT " + num;
        return loadProductFormSql(sql);
    }

    public static List<Product> loadHighLightProducts() {
        String sql = "SELECT * from product\n" +
                "where active=1 and highlight=1\n" +
                "order by date_created desc\n" +
                "limit 10";
        return loadProductFormSql(sql);
    }
    public static List<Product> loadSmartToys() {
        String sql = "select *\n" +
                "from product where active=1 and category_id in (1,2,3,4) and percent_sale=0\n" +
                "limit 6";
        return loadProductFormSql(sql);
    }
    public static List<Product> loadCharacterToys() {
        String sql = "select *\n" +
                "from product where active=1 and category_id in (11,12) and percent_sale=0\n" +
                "limit 6";
        return loadProductFormSql(sql);
    }
    public static List<Product> loadTransportationToys() {
        String sql = "select *\n" +
                "from product where active=1 and category_id in (8,9,10) and percent_sale=0\n" +
                "limit 6";
        return loadProductFormSql(sql);
    }

    public static List<Product> loadAllProducts() {
        return loadProductFormSql("select * from product where active=1");
    }

    // Load product in shopping page
    public static List<Product> loadShoppingProducts(int start, int num) {
        return loadProductFormSql("select * from product limit " + start + "," + num);
    }

    public static int sumOfProduct(String sql) {
        int sum = 0;
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet rs = statement.executeQuery(sql);
                if (rs.next()) {
                    sum = rs.getInt(1);
                }
                rs.close();
            }
            statement.close();
            return sum;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    // Filter product by category
    public static List<Product> filterProductByCategory(int id, int start, int num) {
        return loadProductFormSql("SELECT * FROM product WHERE category_id = " + id + " LIMIT " + start + "," + num);
    }

    // Filter product by type_weight
    public static List<Product> filterProductBySize(int id, int start, int num) {
        return loadProductFormSql("SELECT * FROM product WHERE active=1 and type_weight = " + id + " LIMIT " + start + "," + num);
    }


    public static Product getProduct(ResultSet resultSet) {
        if (resultSet == null)
            return null;
        Product product = new Product();
        try {
            product.setId(resultSet.getInt(1));
            product.setName(resultSet.getString(2));
            product.setPrice(resultSet.getDouble(3));
            product.setDescription(resultSet.getString(4));
            product.setContent(resultSet.getString(5));
            product.setSupplier_id(resultSet.getInt(6));
            byte active = resultSet.getByte(7);
            product.setActive(active == 1);
            product.setPercent_sale(resultSet.getByte(8));
            product.setPrice_sale(resultSet.getDouble(9));
            product.setCategory_id(resultSet.getInt(10));
            product.setQuantity(resultSet.getInt(11));
            product.setIs_sale(resultSet.getByte(12) == 1);
            product.setDate_start_sale(resultSet.getDate(13));
            product.setDate_end_sale(resultSet.getDate(14));
            product.setSlug(resultSet.getString(15));
            product.setDate_created(resultSet.getDate(16));
            product.setSold(resultSet.getInt(17));
            product.setProduct_code(resultSet.getString(18));
            product.setAge(resultSet.getInt(19));
            product.setGender(resultSet.getInt(20));

            product.setImg(resultSet.getString(21));
            byte highlight = resultSet.getByte(22);
            product.setHighlight(highlight == 1);

            product.setPercent_sale_past(product.percent_sale_past());
            product.setDayRest(product.dayRest());

            return product;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static List<Product> loadPriceProducts(int start, int num) {
        return loadProductFormSql("select * from product order by price asc limit " + start + "," + num);
    }


    public static List<Product> loadProductFormSql(String sql) {
        List<Product> list = new ArrayList<Product>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    list.add(getProduct(resultSet));
                }
                resultSet.close();
            }
            statement.close();
            return list;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static List<Product> searchProduct(String key) {
        Map<Integer, Product> map = new LinkedHashMap<Integer, Product>();
        List<Product> ab_pros = loadProductFormSql("select * from product where active=1 and name like '%" + key + "%'");
        convertListToMap(map, ab_pros);
        String[] words = key.split(" ");
        for (String word : words) {
            if (word.equalsIgnoreCase("đồ")
                    || word.equalsIgnoreCase("chơi")
                    || word.equalsIgnoreCase("do")
                    || word.equalsIgnoreCase("choi"))
                continue;
            ;
            List<Product> pros = loadProductFormSql("select * from product where active=1 and name like '% " + word + " %' or discription like '% " + key + " %'or content like '% " + key + " %'");
            convertListToMap(map, pros);
        }
        return convertMapToList(map);
    }

    public static List<Product> convertMapToList(Map<Integer, Product> map) {
        List<Product> list = new ArrayList<Product>();
        for (Product p : map.values()) {
            list.add(p);
        }
        return list;
    }

    public static void convertListToMap(Map<Integer, Product> map, List<Product> list) {
        for (Product product : list) {
            if (!map.containsKey(product.getId()))
                map.put(product.getId(), product);
        }
    }

    public static int loadMax_MinPrice(String sql) {
        int max_price = 0;
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet rs = statement.executeQuery(sql);
                if (rs.next()) {
                    max_price = rs.getInt(1);
                }
                rs.close();
            }
            statement.close();
            return max_price;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return max_price;
    }

    // Load san pham yeu thich
    public static List<Product> loadFavoriteProduct(int user_id) {
        String sql = "SELECT * FROM product\n" +
                "WHERE active=1 and id IN (SELECT pro_id FROM favorist_list WHERE user_id = " + user_id + ")";
        return loadProductFormSql(sql);
    }

    public static List<Product> loadProductBy(String supplier_id,String product_id, String product_name, String category, String from_date, String to_date) {
        List<Product> productList = new ArrayList<Product>();

        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from product where active<>-1 and id like ? and name like ? and category_id like ? and supplier_id like ? and date_created between ? and ?");

            pe.setString(1, product_id);
            pe.setString(2, product_name);
            pe.setString(3, category);
            pe.setString(4, supplier_id);
            pe.setString(5, from_date);
            pe.setString(6, to_date);
//            System.out.println((JDBC4PreparedStatement)pe.asSql());
            synchronized (pe) {
                ResultSet resultSet = pe.executeQuery();
                System.out.println(resultSet.getStatement().toString());
                while (resultSet.next()) productList.add(getProduct(resultSet));
                resultSet.close();
            }
            pe.close();
            return productList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }

    public static String getNameProductById(int id){
        List<Product> products=loadProductFormSql("select * from product");
        for( Product p:products){
            if(p.getId()==id){
                return p.getName();
            }
        }
        return null;
    }
    public static double getPriceProductById(int id){
        List<Product> products=loadProductFormSql("select * from product");
        for( Product p:products){
            if(p.getId()==id){
                return p.getPrice();
            }
        }
        return 0.0;
    }
public static void vidu(String s){
        s +="tien";
    System.out.println(s);
}
    public static boolean insertRecentViewProduct(int userId, int proId) {
        String sql = "insert into recent_view_products value\n" +
                "(?,?,?)";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);

            pe.setInt(1, userId);
            pe.setInt(2, proId);
            pe.setString(3, Util.dateFormat(new Date()));
            System.out.println(pe.toString());
            synchronized (pe) {
                update = pe.executeUpdate();
            }
            pe.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
public static boolean insertProductImage(int product_id, List<String>images){
    String sql = "insert into images(src,pro_id) value(?,?)";

    int update = 0;
    try {
        for(String image:images) {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setString(1, image);
            pe.setInt(2, product_id);
            System.out.println(pe.toString());
            synchronized (pe) {
                update = pe.executeUpdate();
            }
            pe.close();
        }
        return update == 1;
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    return false;
}
public static boolean insertProduct(String name, double price,
                                        String description,
                                        String content, int supplier_id,
                                         int active,
                                        int percent_sale, double price_sale,
                                        int category_id, int quantity,
                                        int is_sale, String date_start_sale,
                                        String date_end_sale, String slug,
                                        String product_code, int age, int gender,
                                        String img, int highlight,
                                        String date_created) {
//        String sql = "insert into product(name,price,discription,content,supplier_id,type_weight,active,percent_sale,price_sale,category_id,quantity,is_sale,date_start_sale,date_end_sale,slug,img,date_created) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        String sql = "insert into product(name,price,discription,content,supplier_id, active, percent_sale, price_sale, category_id, quantity, is_sale, date_start_sale, date_end_sale, slug,  product_code, age, gender,  highlight,img,date_created) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);

            peSetAttribute(pe, name, price, description, content
                    , supplier_id, active, percent_sale, price_sale, category_id, quantity, is_sale,
                    date_start_sale, date_end_sale, slug,product_code,age, gender, highlight);
            pe.setString(19, img);
            pe.setString(20, date_created);
            System.out.println(pe.toString());
            synchronized (pe) {
                update = pe.executeUpdate();
            }
            pe.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    private static void peSetAttribute(PreparedStatement pe, String name, double price, String description, String content,
                                       int supplier_id, int active, int percent_sale, double price_sale, int category_id,
                                       int quantity, int is_sale, String date_start_sale, String date_end_sale, String slug,
                                       String product_code, int age, int gender, int highlight) {
                try {
            pe.setString(1, name);
            pe.setDouble(2, price);
            pe.setString(3, description);
            pe.setString(4, content);
            pe.setInt(5, supplier_id);
            pe.setInt(6, active);
            pe.setInt(7, percent_sale);
            pe.setDouble(8, price_sale);
            pe.setInt(9, category_id);
            pe.setInt(10, quantity);
            pe.setInt(11, is_sale);
            pe.setString(12, date_start_sale);
            pe.setString(13, date_end_sale);
            pe.setString(14, slug);
            pe.setString(15, product_code);
            pe.setInt(16, age);
            pe.setInt(17, gender);
            pe.setInt(18, highlight);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//    private static void peSetAttribute(PreparedStatement pe, String name, double price, String description, String content, int supplier_id, int type_weight, int active, int percent_sale, double price_sale, int category_id, int quantity, int is_sale, String date_start_sale, String date_end_sale, String slug) {
//        try {
//            pe.setString(1, name);
//            pe.setDouble(2, price);
//            pe.setString(3, description);
//            pe.setString(4, content);
//            pe.setInt(5, supplier_id);
//            pe.setInt(6, type_weight);
//            pe.setInt(7, active);
//            pe.setInt(8, percent_sale);
//            pe.setDouble(9, price_sale);
//            pe.setInt(10, category_id);
//            pe.setInt(11, quantity);
//            pe.setInt(12, is_sale);
//            pe.setString(13, date_start_sale);
//            pe.setString(14, date_end_sale);
//            pe.setString(15, slug);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }

    public static boolean updateProductImages(int product_id, List<String>images) {
        List<String>images_old = loadProductImagesById(product_id);
        for(String image_old:images_old){
            if(!image_old.startsWith("http")) Util.deleteFile(image_old);
        }
        String sql = "DELETE FROM images WHERE pro_id = ?";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setInt(1,product_id);
            synchronized (pe) {
                update = pe.executeUpdate();
            }
            pe.close();
            insertProductImage(product_id,images);
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean updateProduct(int id, String name, double price,
                                        String description,
                                        String content, int supplier_id,
                                        int active,
                                        int percent_sale, double price_sale,
                                        int category_id, int quantity,
                                        int is_sale, String date_start_sale,
                                        String date_end_sale, String slug,
                                        String product_code, int age, int gender,
                                        String img, int highlight
                                        ) {
        String sql = "update product set name = ?, price=?, discription=?,content=?,supplier_id=?,active=?," +
                "percent_sale=?,price_sale=?,category_id=?,quantity=?," +
                "is_sale=?,date_start_sale=?,date_end_sale=?,slug=?,product_code=?," +
                "age=?,gender=?,highlight=?";
        if (img == null) {

            sql += " where id = ? ";
        } else {
            Product product_old = ProductEntity.loadProductById(id);
            String thumbnail_old = product_old.getImg();
            if(!thumbnail_old.startsWith("http") && !thumbnail_old.contains("default_img")) Util.deleteFile(thumbnail_old);
            sql += ", img=? where id = ? ";
        }


        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            peSetAttribute(pe, name, price, description, content
                    , supplier_id, active, percent_sale, price_sale, category_id, quantity, is_sale,
                    date_start_sale, date_end_sale, slug,product_code,age, gender, highlight);
            if (img == null)
                pe.setInt(19, id);
            else {
                pe.setString(19, img);
                pe.setInt(20, id);
            }
            System.out.println("Day la query update: " + pe.toString());
            synchronized (pe) {
                update = pe.executeUpdate();
            }
            pe.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean updateProductSlug(int id, String slug) {
        String sql = "update product set slug=? where id= ?";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setString(1,slug);
            pe.setInt(2, id);

            synchronized (pe) {
                update = pe.executeUpdate();
            }
            pe.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean updateProducts(int id,String name, String slug) {
        String sql = "update product set highlight=? where id="+id;
//        if (img == null) {
//            sql += " where id = ? ";
//        } else sql += ", img=? where id = ? ";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);

            Random random  =new Random();

//            String s = 2022+"-03"+"-"+ (random.nextInt(10)+10);
            int i = random.nextInt(100);
            int h = i>=50?0:1;
            pe.setInt(1, h);
//            pe.setString(2,name );
//            pe.setString(3,slug );



            System.out.println("Day la query update: " + pe.toString());
            synchronized (pe) {
                update = pe.executeUpdate();
            }
            pe.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean updateProductActiveBySupplierId(int active, int supplier_id){
        String sql = "UPDATE product SET active = ? WHERE supplier_id = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,active);
            preparedStatement.setInt(2,supplier_id);
            synchronized (preparedStatement) {
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return false;
    }
    public static List<Product> loadFavorateByIdUser(int idUser){
        List<Product> productList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT p.id,p.`name`,p.date_created FROM product p join favorist_list f on p.id=f.pro_id join `user` u on u.id=f.user_id\n" +
                    "WHERE u.id=? and p.active=1");
            preparedStatement.setString(1, String.valueOf(idUser));
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    Product product = new Product();
                    product.setId(resultSet.getInt(1));
                    product.setName(resultSet.getString(2));
                    product.setDate_created(resultSet.getDate(3));
                    productList.add(product);
                }
                resultSet.close();
            }
            preparedStatement.close();
            return productList;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return productList;
    }
    public static Product loadCountStarByIdProAndIdStar(int idpro,int nstar){
//        List<Product> productList = new ArrayList<>();
        Product product=new Product();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT COUNT(rating_type_id) as soluong FROM rating WHERE pro_id=? and rating_type_id=?");
            preparedStatement.setString(1, String.valueOf(idpro));
            preparedStatement.setString(2, String.valueOf(nstar));
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
//                    Product product = new Product();
                    product.setCountstar(resultSet.getInt(1));
                    return  product;
                }
                resultSet.close();
            }
            preparedStatement.close();
            return product;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return product;
    }
    public static Product loadCountCommentByIdPro(int idpro){
//        List<Product> productList = new ArrayList<>();
        Product product=new Product();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT COUNT(`comment`) from rating WHERE pro_id=? and `comment`is not null");
            preparedStatement.setString(1, String.valueOf(idpro));
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
//                    Product product = new Product();
                    product.setContcomment(resultSet.getInt(1));
                    return  product;
                }
                resultSet.close();
            }
            preparedStatement.close();
            return product;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return product;
    }
    public static Product loadCountAvgstarByIdPro(int idpro){
//        List<Product> productList = new ArrayList<>();
        Product product=new Product();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT ROUND(AVG(rating_type_id),1) as tb FROM rating where pro_id=?");
            preparedStatement.setString(1, String.valueOf(idpro));
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
//                    Product product = new Product();
                    product.setAvgstar(resultSet.getInt(1));
                    return  product;
                }
                resultSet.close();
            }
            preparedStatement.close();
            return product;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return product;
    }
    public static List<Product> loadRelativeProduct(int cateid,int proid) {
        List<Product> productList = new ArrayList<Product>();

        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("SELECT * from product WHERE active=1 and category_id=? and id <>? LIMIT 4 ");

            pe.setInt(1, cateid);
            pe.setInt(2, proid);
//            System.out.println((JDBC4PreparedStatement)pe.asSql());
            synchronized (pe) {
                ResultSet resultSet = pe.executeQuery();
                System.out.println(resultSet.getStatement().toString());
                while (resultSet.next()) productList.add(getProduct(resultSet));
                resultSet.close();
            }
            pe.close();
            return productList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }

    public static void main(String[] args) throws SQLException {
//        String s= "Shopping_sorted_By_Price_Direct".toLowerCase();
//        if(s.contains("shopping"))
//            System.out.println("co chua");
//        else System.out.println("khong chua");
//        System.out.println(loadMax_MinPrice("select min(price) from product"));

//        List<Integer>list = new ArrayList<>();
//        list.add(1);
//        list.add(2);
//        list.add(3);
//        List<Integer>list1= list.subList(1,(5+1)>list.size()?list.size():5+1);
//        System.out.println(list1);

//        List<Product> products = loadProductBy("%", "cay thuong xuan", "%", "2020-01-15", "2021-01-22");
//            Statement statement = DBCPDataSource.getStatement();
//            int i=statement.executeUpdate("insert into product(name,price,discription,content,supplier_id,type_weight,active,percent_sale,price_sale,category_id,quantity,is_sale,date_start_sale,date_end_sale,slug,img,date_created) value('cây ng? hành',23659.0,'','<p>&nbsp;</p>\\r\\n\\r\\n<div class=\"eJOY__extension_root_class\" id=\"eJOY__extension_root\" style=\"all:unset\">&nbsp;</div>',23,1,1,0,0.0,1,15,0,'20200221','20200221','cay-ngu-hanh','imgs/products/default_img.png','2021-01-23 16:10:59')");
//        System.out.println(i);

//        List<Product>products = loadProductBy("%","cay thuong xuan","%","2020-01-15","2021-01-22");
//        System.out.println(getNameProductById(3));
//        System.out.println(loadFavorateByIdUser(3).size());
//        System.out.println(loadCountStarByIdProAndIdStar(3,5).getCountstar());
//        System.out.println(loadCountCommentByIdPro(3).getContcomment());
//        System.out.println(loadCountAvgstarByIdPro(3).getAvgstar());
//        for(Product p:loadListProductBySupplierId(1)){
//            System.out.println(p.getId());
//        }
        updateProductActiveBySupplierId(1,33);
    }
    public static void deleteProductById(int id){
        try {
//            OrderProduct_Con_DB.deleteOrderWithProductId(id);
            PreparedStatement pe = DBCPDataSource.preparedStatement("UPDATE product SET active=-1 where id=?");
            synchronized (pe){
                pe.setInt(1,id);
                pe.executeUpdate();

            }
            pe.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static boolean updateCategoryId(int defaultId, int cate_id){
        String sql="UPDATE product SET category_id=? WHERE category_id=?";
        int update=0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);

            preparedStatement.setInt(1, defaultId);
            preparedStatement.setInt(2, cate_id);
            synchronized (preparedStatement) {
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return false;
    }


}

