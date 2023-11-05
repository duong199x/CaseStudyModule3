package services;

import model.Order;
import services.IService.IOrderService;

import java.sql.*;
import java.util.List;

public class OrderService implements IOrderService<Order> {
    private Connection connection = ConnectMySql.getConnection();
    @Override
    public int add(Order order) {
        String generatedColumns[] = { "id" };
        String sql = "INSERT INTO `order` (time,total,userId,status) VALUES (?,?,?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql,generatedColumns);
                    connection.prepareStatement(sql);
//            ps.setDate(1, Date.valueOf("2023-05-03"));
            ps.setDate(1, order.getTime());
            ps.setDouble(2, order.getTotal());
            ps.setInt(3, order.getUser().getId());
            ps.setInt(4, order.getStatus());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            int id;
            if(rs.next()) {
                id=rs.getInt(1);
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

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Order> getAll() {
        return null;
    }

    @Override
    public List<Order> findByUser(int id) {
        return null;
    }
}
