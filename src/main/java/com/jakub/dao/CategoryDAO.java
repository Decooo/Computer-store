package com.jakub.dao;

import com.jakub.model.Category;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.util.List;

/**
 * Created by Jakub on 23.03.2017.
 */

public interface CategoryDAO{

    public void add(String name, String description);

    public List<Category[]> findAll();

    public List<Category[]> findCategory();

}
