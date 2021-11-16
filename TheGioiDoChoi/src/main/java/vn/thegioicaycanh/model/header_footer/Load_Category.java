package vn.thegioicaycanh.model.header_footer;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Load_Category {
    public static List<Category> loadCategory_view() {
        List<Category> categories = new ArrayList<Category>();
        try {
            PreparedStatement statement = DBCPDataSource.preparedStatement("select c.*,s.sl from categories c join (select category_id, count(id) as sl from product group by category_id) as s on c.id=s.category_id");
            synchronized (statement) {
                ResultSet rs = statement.executeQuery();
                while (rs.next()) {
                    Category c = new Category();
                    c.setId(rs.getInt(1));
                    c.setName(rs.getString(2));
                    c.setActive(rs.getByte(3) == 1);
                    c.setSlug(rs.getString(4));
                    c.setNumOfProduct(rs.getInt(5));
                    categories.add(c);
                }
                rs.close();
            }
            statement.close();
            return categories;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return categories;
    }

    public static List<Category> loadCategoryBy(String category) {
        List<Category> categories = new ArrayList<Category>();

        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from categories where id like ?");
            pe.setString(1,category);
            synchronized (pe){
                ResultSet resultSet = pe.executeQuery();
                System.out.println(resultSet.getStatement().toString());
                while(resultSet.next()) categories.add(getCategory(resultSet));
                resultSet.close();
            }
            pe.close();
            return categories;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return categories;
    }

    private static Category getCategory(ResultSet resultSet) {
        if(resultSet != null) {
            Category category = new Category();
            try {
                category.setId(resultSet.getInt(1));
                category.setName(resultSet.getString(2));
                byte active = resultSet.getByte(3);
                category.setActive(active == 1);
                category.setSlug(resultSet.getString(4));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            return category;
        }
        return null;
    }

    public static Category loadCategoryById(int cate_id){
        Category category = new Category();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement("SELECT c.id, c.name, c.slug, count(p.id) FROM categories c JOIN product p ON c.id = p.category_id WHERE c.id = ?");
            preparedStatement.setInt(1,cate_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    category.setId(resultSet.getInt(1));
                    category.setName(resultSet.getString(2));
                    category.setSlug(resultSet.getString(3));
                    category.setNumOfProduct(resultSet.getInt(4));
                }
                resultSet.close();
            }
            preparedStatement.close();

        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return category;
    }
    // Them danh muc o trang admin
    public static boolean insertCategory(String name, int active, String slug){
        String sql = "INSERT INTO categories(name,active,slug) value (?,?,?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, active);
            preparedStatement.setString(3, slug);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return false;
    }
    // Sua danh muc o trang admin
    public  static boolean updateCategory(int id, String name, int active, String slug){
        String sql = "UPDATE categories SET name = ?, active = ?, slug = ? WHERE id = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, active);
            preparedStatement.setString(3, slug);
            preparedStatement.setInt(4,id);
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
    public static void main(String[] args) {
//        System.out.println(insertCategory("Cây ăn quả",0,"cay-an-qua"));
    }
}
