package com.jakub.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Jakub on 16.05.2017.
 */
@Entity
@Table(name = "orders")
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer orderID;
    private Date orderDate;
    private Integer userID;
    private Double totalPrice;

    @Override
    public String toString() {
        return "Orders{" +
                "orderID=" + orderID +
                ", orderDate=" + orderDate +
                ", userID=" + userID +
                ", totalPrice=" + totalPrice +
                '}';
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
