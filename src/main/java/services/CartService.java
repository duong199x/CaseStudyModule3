package services;

import model.Cart;
import model.Category;
import model.Product;
import model.Size;
import services.IService.ICartService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartService implements ICartService<Cart> {
    private Connection connection = ConnectMySql.getConnection();
    ;

    @Override
    public void add(Cart cart) {
        String sql = "INSERT INTO cart (productId,userId, sizeId) VALUES (?,?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cart.getProduct().getId());
            ps.setInt(2, cart.getUserId());
            ps.setInt(3, cart.getSize().getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void add(int productId, int sizeId, int userId) {
        String sql = "INSERT INTO cart (productId,userId, sizeId) VALUES (?,?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ps.setInt(2, userId);
            ps.setInt(3, sizeId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM cart where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void deleteByUserId(int userId) {
        String sql = "DELETE FROM cart where userId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void edit(int id, Cart cart) {

    }

    @Override
    public List<Cart> findCartByUserId(int userId) {
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT c.id, c.userId, p.*, s.id , c2.name, s.size, s.quantity FROM cart c\n" +
                "    JOIN product p ON c.productId = p.id\n" +
                "    JOIN size s ON c.sizeId = s.id\n" +
                "    JOIN category c2 on c2.id = p.categoryId where userId=?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("c.id");
                int productId = rs.getInt("p.id");
                String name = rs.getString("p.name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                String originImage = rs.getString("originImage");
                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("c2.name");
                int sizeId = rs.getInt("s.id");
                String sizeName = rs.getString("size");
                int quantity = rs.getInt("quantity");
                Category category = new Category(categoryId, categoryName);
                Product product = new Product(productId, name, price, description, status, originImage, category);
                Size size = new Size(sizeId, sizeName, quantity, productId);
                list.add(new Cart(id, userId, product, size));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
