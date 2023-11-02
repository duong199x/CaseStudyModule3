package services;

import model.Size;
import services.IService.ISizeService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class SizeService implements ISizeService<Size> {
    Connection connection = ConnectMySql.getConnection();

    @Override
    public boolean add(Size size, int productId) {
        String sql = "insert into size(size, quantity, productId) values (?,?,?);";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, size.getSize());
            statement.setInt(2, size.getQuantity());
            statement.setInt(3, productId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return true;
    }

    @Override
    public boolean edit(Size size, int id) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public List<Size> findAll() {
        return null;
    }

    @Override
    public Size findProductById(int id) {
        return null;
    }

    @Override
    public List<Size> findAllSizeByProductId(int productId) {
        return null;
    }
}
