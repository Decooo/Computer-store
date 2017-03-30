package com.jakub.daoimpl;

import com.jakub.dao.CategoryDAO;
import com.jakub.model.Category;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Jakub on 23.03.2017.
 */

@Transactional
@Repository
public class CategoryDAOImpl implements CategoryDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");


    @Override
    public void add(String name, String description) {
//        Session session = sessionFactory.getCurrentSession();
//        org.hibernate.Query query = session.createSQLQuery("CALL ADDCATEGORY(:categoryName, :categoryDescription )")
//                .addEntity(Category.class)
//                .setParameter("categoryName", name)
//                .setParameter("categoryDescription", description);
//        query.executeUpdate();
//        System.out.println("Poprawnie dodano nowa kategorie: name= " +name + " opis= " +description);

        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("ADDCATEGORY")
                .registerStoredProcedureParameter(1, String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, String.class, ParameterMode.IN)
                .setParameter(1, name)
                .setParameter(2, description);
        query.execute();
        System.out.println("Poprawnie dodano nowa kategorie: name= " + name + " opis= " + description);

        entityManager.close();

    }


    @Override
    public List<Category[]> findCategory() {

        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("GET_CATEGORY_LIST")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.OUT)
                .registerStoredProcedureParameter(2, String.class, ParameterMode.OUT)
                .registerStoredProcedureParameter(3, String.class, ParameterMode.OUT);

        query.execute();
        System.out.println("id: " + query.getOutputParameterValue(1).toString());
        System.out.println("name: " + query.getOutputParameterValue(2).toString());
        System.out.println("desc: " + query.getOutputParameterValue(3).toString());

        List cat = query.getResultList();

        entityManager.close();
        return cat;
    }


    //nie działa
    @Override
    public List<Category[]> findAll() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");
        EntityManager entityManager = emf.createEntityManager();
        //Session session = sessionFactory.getCurrentSession();
        String hql = "SELECT * FROM category";
        //Query query = session.createSQLQuery(hql);
        List<Category[]> lista = entityManager.createNativeQuery(hql).getResultList();
        return lista;
    }
}
