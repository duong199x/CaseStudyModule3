package model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String description;
    private boolean status;
    private String originImage;
    private Category categoryId;

    public Product(int id, String name, double price, String description, boolean status,String originImage, Category categoryId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.status = status;
        this.originImage = originImage;
        this.categoryId = categoryId;
    }

    public Product(String name, double price, String description, boolean status, String originImage, Category categoryId) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.status = status;
        this.originImage = originImage;
        this.categoryId = categoryId;
    }

    public boolean isStatus() {
        return status;
    }

    public String getOriginImage() {
        return originImage;
    }

    public void setOriginImage(String originImage) {
        this.originImage = originImage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }
}
