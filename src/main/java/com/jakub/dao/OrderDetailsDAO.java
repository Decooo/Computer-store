package com.jakub.dao;

/**
 * Created by Jakub on 16.05.2017.
 */
public interface OrderDetailsDAO {

    void addOrderDetails(int orderID,int productID,int quantity,double price);
}
