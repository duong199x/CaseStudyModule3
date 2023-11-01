package services;

import model.User;
import services.IService.IUserService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService<User> {
    protected Connection connection = ConnectMySql.getConnection();

    @Override
    public void add(User user) {
        String sql = "INSERT INTO user (email,password,nickname,phone,address,role) VALUES(?,?,?,?,?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getNickname());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());
            ps.setInt(6, 2);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(User user) {

    }

    @Override
    public List<User> findAll() {
        List<User> result = new ArrayList<User>();
        String sql = "SELECT * FROM user;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = getUserInfo(rs);
                result.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public User findById(int id) {
        String sql = "SELECT * FROM user WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            return getUserInfo(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public User findByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            return getUserInfo(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static User getUserInfo(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String email = rs.getString("email");
        String password = rs.getString("password");
        String nickname = rs.getString("nickname");
        String phone = rs.getString("phone");
        String address = rs.getString("address");
        int role = rs.getInt("role");
        return new User(id, email, password, nickname, phone, address, role);
    }
}
