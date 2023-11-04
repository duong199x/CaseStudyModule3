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
        String sql = "insert into product(name, price, description, status, categoryId,deleteFlag) values (?,?,?,?,?,0);";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setBoolean(4, product.getStatus());
            statement.setInt(5, product.getCategoryId().getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return true;
    }

    @Override
    public boolean edit(Product product, int id) {
        String sql = "update product set name =?, price =?,description =?, status =?,categoryId=? where id =? and product.deleteFlag = 0;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setBoolean(4, product.getStatus());
            statement.setInt(5, product.getCategoryId().getId());
            statement.setInt(6, id);
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "update product set product.deleteFlag = 1 where id = ?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        String sql = "select product.*,c.name as brand from product join category c on product.categoryId = c.id and product.deleteFlag = 0;";
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
                Category category = new Category(categoryId, nameCategory);
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
        String sql = "select product.*,c.name as brand from product join category c on product.categoryId = c.id where product.id=?;";
        Product product = null;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                boolean status = resultSet.getBoolean("status");
                int categoryId = resultSet.getInt("categoryId");
                String nameCategory = resultSet.getString("brand");
                Category category = new Category(categoryId, nameCategory);
                product = new Product(id, name, price, description, status, category);
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return product;
    }
    public List<Product> findProductByName(String nameFind){
        List<Product> productList = new ArrayList<>();
        String sql = "select product.*,c.name as brand from product join category c on product.categoryId = c.id and product.deleteFlag = 0 and product.name like ?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,"%"+nameFind+"%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                boolean status = resultSet.getBoolean("status");
                int categoryId = resultSet.getInt("categoryId");
                String nameCategory = resultSet.getString("brand");
                Category category = new Category(categoryId, nameCategory);
                Product product = new Product(id, name, price, description, status, category);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productList;
    }
}
