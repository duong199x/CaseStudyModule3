package model;

public class User {
    private int id;
    private String email;
    private String password;
    private String nickname;
    private String phone;
    private String address;
    private int role;

    public User(int id, String email, String password, String nickname, String phone, String address, int role) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.nickname = nickname;
        this.phone = phone;
        this.address = address;
        this.role = role;
    }

    public User(int id, String email, String nickname, String phone, String address) {
        this.id = id;
        this.email = email;
        this.nickname = nickname;
        this.phone = phone;
        this.address = address;
    }

    public User(String email, String password, String nickname, String phone, String address) {
        this.email = email;
        this.password = password;
        this.nickname = nickname;
        this.phone = phone;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
