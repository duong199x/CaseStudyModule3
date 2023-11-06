package model;

import java.sql.Date;
import java.time.LocalDateTime;

public class Order {
    private int id;
    private Date time;
    private double total;
    private User user;
    private int status;

    public Order(int id, Date time, double total, User user,int status) {
        this.id = id;
        this.time = time;
        this.total = total;
        this.user=user;
        this.status=status;
    }

    public Order(Date time, double total,  User user) {
        this.time = time;
        this.total = total;
        this.user=user;
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

    public Date getTime() {
        return this.time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public User getUser() {
        return user;
    }

    public void setUser( User user) {
        this.user = user;
    }
}
