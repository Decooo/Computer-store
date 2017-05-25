package com.jakub.dao;

import com.jakub.model.Category;

import java.util.List;

/**
 * Created by Jakub on 23.03.2017.
 */

//interfejs z metodami odpowaiadającymi za operacje w bazie danych na encji kategorie

public interface CategoryDAO{

    public void add(String name, String description);

    public void update(Integer id,String name, String description);

    public List<Category> findAll();

    public void deleteCategory(Integer id);

    public Category findByID(Integer id);
}
