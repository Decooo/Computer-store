package com.jakub.daoimpl;

import com.jakub.dao.OrdersDAO;
import com.jakub.model.Orders;
import com.jakub.model.Product;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Jakub on 16.05.2017.
 */
@Transactional
@Repository
public class OrdersDAOImpl implements OrdersDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");


    @Override
    public int addOrders(int userid, double totalprice) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("p_orders.add_orders")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, Double.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3,Integer.class,ParameterMode.OUT)
                .setParameter(1, userid)
                .setParameter(2, totalprice);
        query.execute();
        Integer orderID = (Integer) query.getOutputParameterValue(3);
        System.out.println("Dodano nowe zamowienie");

        entityManager.close();

        return orderID;
    }

    @Override
    public List<Orders> findAll() {
        EntityManager entityManager = emf.createEntityManager();

        List<Orders> result = (List<Orders>) entityManager.createNativeQuery("SELECT * FROM orders", Orders.class).getResultList();

        entityManager.close();
        return result;
    }

}