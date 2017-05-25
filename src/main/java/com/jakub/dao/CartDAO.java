package com.jakub.dao;

import com.jakub.model.Cart;
import com.jakub.model.Category;

import java.util.List;

/**
 * Created by Jakub on 08.05.2017.
 */

//interfejs z metodami odpowaiadającymi za operacje w bazie danych na encji koszyk

public interface CartDAO {

    public void add(Integer userID, Integer productID, Integer quantity,Double totalPrice);

    public List<Cart> findAll(int id);

    public void deleteProduct(Integer id);

    public Integer addQuantity(Integer id);

    public Integer reduceQuantity(Integer id);

    public Double amount(Integer userId);

    public Double rebate(Integer userId);

    public void clearCart(int userID);


}
