package com.jakub.daoimpl;

import com.jakub.dao.UsersDAO;
import com.jakub.model.Category;
import com.jakub.model.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.omg.CORBA.ParameterMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import javax.persistence.*;
import javax.persistence.*;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.List;

/**
 * Created by Jakub on 29.03.2017.
 */
@Transactional
@Repository
public class UsersDAOImpl implements UsersDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");


    @Override
    public Users findByID(Integer id) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("p_users.find_users_by_id")
                .registerStoredProcedureParameter(1, Integer.class, javax.persistence.ParameterMode.IN)
                .registerStoredProcedureParameter(2, String.class, javax.persistence.ParameterMode.OUT)
                .setParameter(1, id);
        query.execute();

        String username = query.getOutputParameterValue(2).toString();

        Users users= new Users(id, username);

        entityManager.close();
        return users;
    }

    @Override
    public Users findUsers(String username) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("p_users.GET_USER")
                .registerStoredProcedureParameter(1, String.class, javax.persistence.ParameterMode.INOUT)
                .registerStoredProcedureParameter(2, Integer.class, javax.persistence.ParameterMode.OUT)
                .registerStoredProcedureParameter(3, String.class, javax.persistence.ParameterMode.OUT)
                .registerStoredProcedureParameter(4, Integer.class, javax.persistence.ParameterMode.OUT)
                .registerStoredProcedureParameter(5, String.class, javax.persistence.ParameterMode.OUT)
                .setParameter(1, username);
        query.execute();

        int id = Integer.valueOf(query.getOutputParameterValue(2).toString());
        String name = query.getOutputParameterValue(1).toString();
        String password = query.getOutputParameterValue(3).toString();
        int idClient = Integer.parseInt(query.getOutputParameterValue(4).toString());
        String role = query.getOutputParameterValue(5).toString();


        Users user = new Users(id, name, password, idClient, role);

       return user;


    }

    @Override
    public Integer findUsersID(String username) {
        EntityManager entityManager=emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("P_users.GET_USER_ID")
                .registerStoredProcedureParameter(1,Integer.class, javax.persistence.ParameterMode.OUT)
                .registerStoredProcedureParameter(2,String.class, javax.persistence.ParameterMode.IN)
                .setParameter(2,username);
        query.execute();

        int id=Integer.valueOf(query.getOutputParameterValue(1).toString());
        entityManager.close();
        System.out.println("id = " + id);
        return id;
    }

}
