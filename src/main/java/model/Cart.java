package model;

public class Cart {
    private int id;
    private int userId;
    private  Product product;
    private  Size size;

    public Cart(int id, int userId, Product product, Size size) {
        this.id = id;
        this.userId = userId;
        this.product = product;
        this.size = size;
    }

    public Cart(int userId, Product product, Size size) {
        this.userId = userId;
        this.product = product;
        this.size = size;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }
}
