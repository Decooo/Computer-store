package com.jakub.dao;

import com.jakub.model.OrderDetails;
import com.jakub.model.Orders;

import java.util.List;

/**
 * Created by Jakub on 16.05.2017.
 */

//interfejs z metodami odpowaiadającymi za operacje w bazie danych na encji szczegóły zamówienai

public interface OrderDetailsDAO {

    void addOrderDetails(int orderID, int productID, int quantity, double price);

    List<OrderDetails> findAll(int id);

}
