package model;

public class Image {
    private int id;
    private String image;
    private int productId;

    public Image(int id, String image, int productId) {
        this.id = id;
        this.image = image;
        this.productId = productId;
    }

    public Image(String image, int productId) {
        this.image = image;
        this.productId = productId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
}
