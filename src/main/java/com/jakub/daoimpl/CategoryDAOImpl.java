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
                .createStoredProcedureQuery("p_category.ADDCATEGORY")
                .registerStoredProcedureParameter(1, String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, String.class, ParameterMode.IN)
                .setParameter(1, name)
                .setParameter(2, description);
        query.execute();
        System.out.println("Poprawnie dodano nowa kategorie: name= " + name + " opis= " + description);

        entityManager.close();

    }

    @Override
    public void update(Integer id, String name, String description) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("p_category.update_category")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3, String.class, ParameterMode.IN)
                .setParameter(1, id)
                .setParameter(2, name)
                .setParameter(3, description);
        query.execute();
        System.out.println("Zaaktualizowano poprawnie");
        entityManager.close();
    }

    @Override
    public List<Category> findAll() {
        EntityManager entityManager = emf.createEntityManager();

        List<Category> result = (List<Category>) entityManager.createNativeQuery("SELECT * FROM category", Category.class).getResultList();

        entityManager.close();
        return result;
    }

    @Override
    public void deleteCategory(Integer id) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("p_category.delete_category")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .setParameter(1, id);
        query.execute();
        System.out.println("Usunieto kategorie");
        entityManager.close();
    }

    @Override
    public Category findByID(Integer id) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("p_category.find_category_by_id")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, String.class, ParameterMode.OUT)
                .registerStoredProcedureParameter(3, String.class, ParameterMode.OUT)
                .setParameter(1, id);
        query.execute();

        String name = query.getOutputParameterValue(2).toString();
        String desc = query.getOutputParameterValue(3).toString();

        Category category = new Category(id, name, desc);

        entityManager.close();
        return category;
    }

}
