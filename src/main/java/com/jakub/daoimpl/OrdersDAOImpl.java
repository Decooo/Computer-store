package com.jakub.daoimpl;

import com.jakub.dao.OrdersDAO;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Created by Jakub on 16.05.2017.
 */
@Transactional
@Repository
public class OrdersDAOImpl implements OrdersDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");


    @Override
    public void addOrders() {

    }
}
