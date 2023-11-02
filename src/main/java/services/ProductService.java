package services;

import model.Category;
import model.Product;
import services.IService.IProductService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService<Product> {
    private Connection connection = ConnectMySql.getConnection();

    @Override
    public boolean add(Product product) {
        return false;
    }

    @Override
    public boolean edit(Product product, int id) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        String sql = "select product.*,c.name as brand from product join category c on product.categoryId = c.id;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                boolean status = resultSet.getBoolean("status");
                int categoryId = resultSet.getInt("categoryId");
                String nameCategory = resultSet.getString("brand");
                Category category = new Category(categoryId,nameCategory);
                Product product = new Product(id, name, price, description, status, category);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productList;
    }

    @Override
    public Product findProductById(int id) {
        return null;
    }
}
