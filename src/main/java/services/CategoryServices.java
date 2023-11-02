package services;

import model.Category;
import model.Product;
import services.IService.ICategoryService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryServices implements ICategoryService<Category> {
    private Connection connection = ConnectMySql.getConnection();

    @Override
    public boolean add(Category category) {
        return false;
    }

    @Override
    public boolean edit(Category category, int id) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public List<Category> findAll() {
        List<Category> categoryList = new ArrayList<>();
        String sql = "select * from category;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Category category = new Category(id, name);
                categoryList.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categoryList;
    }

    @Override
    public Category findProductById(int id) {
        String sql = "select * from category where id =?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int categoryId = resultSet.getInt("id");
                String nameCategory = resultSet.getString("name");
                Category category = new Category(categoryId, nameCategory);
                return category;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
