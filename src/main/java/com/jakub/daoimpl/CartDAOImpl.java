package com.jakub.daoimpl;

import com.jakub.dao.CartDAO;
import com.jakub.model.Cart;
import com.jakub.model.Category;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Jakub on 08.05.2017.
 */
@Transactional
@Repository
public class CartDAOImpl implements CartDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");


    @Override
    public void add(Integer userID, Integer productID, Integer quantity, Double totalPrice) {

        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("add_product_to_cart")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(4, Double.class, ParameterMode.IN)
                .setParameter(1, userID)
                .setParameter(2, productID)
                .setParameter(3, quantity)
                .setParameter(4, totalPrice);
        query.execute();
        System.out.println("Dodano produkt do koszyka");

        entityManager.close();
    }

    @Override
    public List<Cart> findAll(int id) {
        EntityManager entityManager = emf.createEntityManager();

        List<Cart> result = (List<Cart>) entityManager.createNativeQuery("SELECT * FROM cart WHERE userID='" + id + "'", Cart.class).getResultList();

        entityManager.close();
        return result;
    }

    @Override
    public void deleteProduct(Integer id) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("delete_product_from_cart")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .setParameter(1, id);
        query.execute();
        System.out.println("Usunieto produkt z koszyka");
        entityManager.close();
    }

}
