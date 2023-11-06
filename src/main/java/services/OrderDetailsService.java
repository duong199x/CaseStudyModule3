package services;

import model.*;
import services.IService.IOrderDetailService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailsService implements IOrderDetailService<OrderDetail> {
    private Connection connection = ConnectMySql.getConnection();

    @Override
    public void add(OrderDetail orderDetail) {

    }

    @Override
    public void add(int orderId, int productId, int sizeId) {
        String sql = "INSERT INTO orderdetail (orderId, productId, sizeId) VALUES (?,?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ps.setInt(2, productId);
            ps.setInt(3, sizeId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderDetail> getAll() {
        return null;
    }

    @Override
    public List<OrderDetail> findByOderId(int orderId) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT od.id, od.orderId, p.*, s.id , c2.name, s.size, s.quantity FROM orderdetail od\n" +
                "    JOIN product p ON od.productId = p.id\n" +
                "    JOIN size s ON od.sizeId = s.id\n" +
                "    JOIN category c2 on c2.id = p.categoryId where orderId = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("od.id");
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
                list.add(new OrderDetail(id, orderId, product, size));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
