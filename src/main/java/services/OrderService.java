package services;

import model.Order;
import model.User;
import services.IService.IOrderService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderService implements IOrderService<Order> {
    private Connection connection = ConnectMySql.getConnection();

    @Override
    public int add(Order order) {
        String generatedColumns[] = {"id"};
        String sql = "INSERT INTO `order` (time,total,userId,status) VALUES (?,?,?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, generatedColumns);
            connection.prepareStatement(sql);
            ps.setDate(1, order.getTime());
            ps.setDouble(2, order.getTotal());
            ps.setInt(3, order.getUser().getId());
            ps.setInt(4, order.getStatus());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            int id;
            if (rs.next()) {
                id = rs.getInt(1);
                return id;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public void edit(Order order) {

    }

    @Override
    public void changeStatus(int id, int status) {
        String sql = "UPDATE `order` SET `status`= ? where id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, status);
            stmt.setInt(2, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Order> getAll() {
        List<Order> orderList = new ArrayList<Order>();
        String sql = "SELECT o.*, u.email, u.nickname,u.phone, u.address FROM `order` o join user u on u.id = o.userId;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = getOrder(rs);
                orderList.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderList;
    }

    @Override
    public List<Order> findByUser(int userId) {
        List<Order> orderList = new ArrayList<>();
        String sql = "SELECT o.*, u.email, u.nickname,u.phone, u.address FROM `order` o join user u on u.id = o.userId and o.userId = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderList.add(getOrder(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderList;
    }

    @Override
    public Order findById(int id) {
        String sql = "SELECT o.*, u.email, u.nickname,u.phone, u.address FROM `order` o join user u on u.id = o.userId and o.id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               return getOrder(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    private static Order getOrder(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        Date date = rs.getDate("time");
        double total = rs.getDouble("total");
        int userId = rs.getInt("userId");
        int status = rs.getInt("status");
        String email = rs.getString("email");
        String nickname = rs.getString("nickname");
        String phone = rs.getString("phone");
        String address = rs.getString("address");
        User user = new User(userId, email, nickname, phone, address);
        return new Order(id, date, total, user, status);
    }
}
