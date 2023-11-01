package model;

import java.time.LocalDateTime;

public class Order {
    private int id;
    private LocalDateTime time;
    private double total;
    private int userId;
    private int status;

    public Order(int id, LocalDateTime time, double total, int userId,int status) {
        this.id = id;
        this.time = time;
        this.total = total;
        this.userId = userId;
        this.status=status;
    }

    public Order(LocalDateTime time, double total, int userId) {
        this.time = time;
        this.total = total;
        this.userId = userId;
        this.status = 1;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
