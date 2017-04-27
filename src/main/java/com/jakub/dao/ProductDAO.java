package com.jakub.dao;

import com.jakub.model.Category;
import com.jakub.model.Product;

import java.util.List;

/**
 * Created by Jakub on 20.04.2017.
 */
public interface ProductDAO {

    public void add(Product product);

    public List<Product> findAll();

    public Product findProduct(String id);

}
