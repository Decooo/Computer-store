package com.jakub.dao;

import com.jakub.model.Orders;
import com.jakub.model.Product;

import java.util.List;

/**
 * Created by Jakub on 16.05.2017.
 */
public interface OrdersDAO {
    int addOrders(int userid, double totalprice);

    List<Orders> findAll();

}
