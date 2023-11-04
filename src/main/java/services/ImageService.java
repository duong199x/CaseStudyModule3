package services;


import model.Image;
import model.Size;
import services.IService.IImageService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImageService implements IImageService<Image> {
    private final Connection connection = ConnectMySql.getConnection();

    @Override
    public boolean add(Image image, int productId) {
        return false;
    }

    @Override
    public boolean edit(Image image, int productId, int id) {
        String sql = "update image set image=? where productId =? and id = ?;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, image.getImage());
            statement.setInt(2, productId);
            statement.setInt(3, id);
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
    public List<Image> findAll() {
        return null;
    }

    @Override
    public Image findProductById(int id) {
        return null;
    }

    @Override
    public List<Image> findAllImageByProductId(int productId) {
        List<Image> imageList = new ArrayList<>();
        String sql = "select * from image where productId =?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String image = resultSet.getString("image");
                int idProduct = resultSet.getInt("productId");
                Image newImage =new Image(id,image,idProduct);
                imageList.add(newImage);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return imageList;
    }
}
