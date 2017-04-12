package com.jakub.daoimpl;

import com.jakub.dao.ClientDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.StoredProcedureQuery;

/**
 * Created by Jakub on 06.04.2017.
 */
@Transactional
@Repository
public class ClientDAOImpl implements ClientDAO {

    @Autowired
    SessionFactory sessionFactory;
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");

    @Override
    public void addClientAndUser(String firstName, String lastName, String emailAddress, String street, String numberHouse, String postCode, String city, String username, String password) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("ADD_CLIENT")
                .registerStoredProcedureParameter(1, String.class, javax.persistence.ParameterMode.IN)
                .registerStoredProcedureParameter(2, String.class, javax.persistence.ParameterMode.IN)
                .registerStoredProcedureParameter(3, String.class, javax.persistence.ParameterMode.IN)
                .registerStoredProcedureParameter(4, String.class, javax.persistence.ParameterMode.IN)
                .registerStoredProcedureParameter(5, String.class, javax.persistence.ParameterMode.IN)
                .registerStoredProcedureParameter(6, String.class, javax.persistence.ParameterMode.IN)
                .registerStoredProcedureParameter(7, String.class, javax.persistence.ParameterMode.IN)
                .registerStoredProcedureParameter(8, String.class, javax.persistence.ParameterMode.OUT)
                .registerStoredProcedureParameter(9, String.class, javax.persistence.ParameterMode.IN)
                .registerStoredProcedureParameter(10, String.class, javax.persistence.ParameterMode.IN)
                .setParameter(1, firstName)
                .setParameter(2, lastName)
                .setParameter(3, emailAddress)
                .setParameter(4, street)
                .setParameter(5, numberHouse)
                .setParameter(6, postCode)
                .setParameter(7, city)
                .setParameter(9, username)
                .setParameter(10, password);


        query.execute();

        System.out.println("Poprawnie utworzono nowego uzytkownika");
        entityManager.close();
    }
}
