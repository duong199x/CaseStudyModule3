package model;

public class Size {
    private int id;
    private String size;
    private int quantity;
    private int productId;

    public Size(int id, String size, int quantity, int productId) {
        this.id = id;
        this.size = size;
        this.quantity = quantity;
        this.productId = productId;
    }

    public Size(String size, int quantity, int productId) {
        this.size = size;
        this.quantity = quantity;
        this.productId = productId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
}
