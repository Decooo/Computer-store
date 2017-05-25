package com.jakub.dao;

import com.jakub.model.Category;
import com.jakub.model.Product;

import java.util.List;

/**
 * Created by Jakub on 20.04.2017.
 */

//interfejs z metodami odpowaiadającymi za operacje w bazie danych na encji produkt

public interface ProductDAO {

    public void add(Product product);

    public List<Product> findAll();

    public Product findProduct(String id);

    public void deleteProduct(Integer id);

    public Product findByID(Integer id);

    public void update(Integer id,String name, String description, Double price, byte[] picture, Integer categoryID);


}
