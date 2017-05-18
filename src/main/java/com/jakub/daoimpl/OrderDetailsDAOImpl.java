package com.jakub.daoimpl;

import com.jakub.dao.OrderDetailsDAO;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;

/**
 * Created by Jakub on 16.05.2017.
 */
@Transactional
@Repository
public class OrderDetailsDAOImpl implements OrderDetailsDAO {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");

    @Override
    public void addOrderDetails(int orderID, int productID, int quantity, double price) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("p_orders.add_orderdetail")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(4, Double.class, ParameterMode.IN)
                .setParameter(1,orderID)
                .setParameter(2,productID)
                .setParameter(3,quantity)
                .setParameter(4,price);
        query.execute();

        entityManager.close();
    }
}
