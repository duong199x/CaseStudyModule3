package model;

public class OrderDetail {
    private int id;
    private int orderId;
    private Product product;
    private Size size;

    public OrderDetail(int id, int orderId, Product product, Size size) {
        this.id = id;
        this.orderId = orderId;
        this.product = product;
        this.size = size;
    }

    public OrderDetail(int orderId, Product product, Size size) {
        this.orderId = orderId;
        this.product = product;
        this.size = size;
    }
    public int getId(){
        return this.id;
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

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

}
