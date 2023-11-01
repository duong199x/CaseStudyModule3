package model;

public class OrderDetail {
    private int orderId;
    private int productId;
    private int quantityBuy;

    public OrderDetail(int orderId, int productId, int quantityBuy) {
        this.orderId = orderId;
        this.productId = productId;
        this.quantityBuy = quantityBuy;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantityBuy() {
        return quantityBuy;
    }

    public void setQuantityBuy(int quantityBuy) {
        this.quantityBuy = quantityBuy;
    }
}
