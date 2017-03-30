package com.jakub.daoimpl;

import com.jakub.dao.UsersDAO;
import com.jakub.model.Users;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;

/**
 * Created by Jakub on 29.03.2017.
 */
@Transactional
@Repository
public class UsersDAOImpl implements UsersDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");


    @Override
    public Users findUsers(String username) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("GET_USER")
                .registerStoredProcedureParameter(1, String.class, ParameterMode.INOUT)
                .registerStoredProcedureParameter(2, Integer.class, ParameterMode.OUT)
                .registerStoredProcedureParameter(3, String.class, ParameterMode.OUT)
                .registerStoredProcedureParameter(4, Integer.class, ParameterMode.OUT)
                .registerStoredProcedureParameter(5, String.class, ParameterMode.OUT)
                .setParameter(1, username);
        query.execute();

        int id = Integer.valueOf(query.getOutputParameterValue(2).toString());
        String name = query.getOutputParameterValue(1).toString();
        String password = query.getOutputParameterValue(3).toString();
        int idClient = Integer.parseInt(query.getOutputParameterValue(4).toString());
        String role = query.getOutputParameterValue(5).toString();

        entityManager.close();
        Users user = new Users(id, name, password, idClient, role);
        return user;
    }
}
