package com.jakub.com.jakub.dao.impl;

import com.jakub.dao.CategoryDAO;
import com.jakub.model.Category;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Jakub on 23.03.2017.
 */

@Transactional
@Repository
public class CategoryDAOImpl implements CategoryDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void add(String name, String description) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("CALL ADDCATEGORY(:categoryName, :categoryDescription )")
                .addEntity(Category.class)
                .setParameter("categoryName", name)
                .setParameter("categoryDescription", description);
        query.executeUpdate();
        System.out.println("Poprawnie dodano nowa kategorie: name= " +name + " opis= " +description);
    }

    // Nie działa

    @Override
    public List<String> findCategory() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("call VIEWALLCATEGORIES()")
                .addEntity(Category.class);
        List result = query.list();
        for (int i = 0; i < result.size(); i++) {
            Category category = (Category) result.get(i);
            System.out.println("wynik: " + category.getCategoryName());
        }

        return result;
    }

    @Override
    public List<Category> findAll() {
        Session session = sessionFactory.getCurrentSession();
        String hql = "SELECT * FROM category";
        Query query = session.createSQLQuery(hql);
        return query.list();
    }
}
