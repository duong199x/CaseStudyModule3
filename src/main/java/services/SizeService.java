package services;

import model.Category;
import model.Product;
import model.Size;
import services.IService.ISizeService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SizeService implements ISizeService<Size> {
    Connection connection = ConnectMySql.getConnection();

    @Override
    public boolean add(Size size, int productId) {
        return false;
    }

    @Override
    public boolean edit(Size size, int productId, String productSize) {
        String sql = "update size set quantity=? where productId =? and size = ?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, size.getQuantity());
            statement.setInt(2, productId);
            statement.setString(3, productSize);
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
        List<Size> sizeList = new ArrayList<>();
        String sql = "select * from size where productId =?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String size = resultSet.getString("size");
                int quantity = resultSet.getInt("quantity");
                int idProduct = resultSet.getInt("productId");
                Size Newsize = new Size(id,size,quantity,idProduct);
                sizeList.add(Newsize);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return sizeList;
    }
}
