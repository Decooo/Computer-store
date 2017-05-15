package com.jakub.daoimpl;

import com.jakub.dao.CartDAO;
import com.jakub.model.Cart;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.jdbc.ReturningWork;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

/**
 * Created by Jakub on 08.05.2017.
 */
@Transactional
@Repository
public class CartDAOImpl implements CartDAO {

    @Autowired
    SessionFactory sessionFactory;
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

        List<Cart> result = (List<Cart>) entityManager.createNativeQuery("SELECT * FROM cart WHERE userID='" + id + "' and quantity>0", Cart.class).getResultList();

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

    @Override
    public Integer addQuantity(final Integer id) {
        EntityManager entityManager = emf.createEntityManager();

        Session session = sessionFactory.getCurrentSession();


        Integer newQuantity = session.doReturningWork(new ReturningWork<Integer>() {
            @Override
            public Integer execute(Connection connection) throws SQLException {
                CallableStatement call = connection.prepareCall("{? = call add_quantity(?)}");
                call.registerOutParameter(1, Types.INTEGER);
                call.setInt(2, id);
                call.execute();
                int result = call.getInt(1);
                return result;
            }
        });

        System.out.println("newQuantity = " + newQuantity);
        return newQuantity;
    }

    @Override
    public Integer reduceQuantity(final Integer id) {
        EntityManager entityManager = emf.createEntityManager();

        Session session = sessionFactory.getCurrentSession();


        Integer newQuantity = session.doReturningWork(new ReturningWork<Integer>() {
            @Override
            public Integer execute(Connection connection) throws SQLException {
                CallableStatement call = connection.prepareCall("{? = call reduce_quantity(?)}");
                call.registerOutParameter(1, Types.INTEGER);
                call.setInt(2, id);
                call.execute();
                int result = call.getInt(1);
                return result;
            }
        });

        System.out.println("newQuantity = " + newQuantity);
        return newQuantity;
    }

    @Override
    public Double amount(final Integer userId) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("get_amount")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, Double.class, ParameterMode.OUT)
                .setParameter(1, userId);
        query.execute();

        Double price = (Double) query.getOutputParameterValue(2);
        System.out.println("price = " + price);
        entityManager.close();
        return price;
    }


    @Override
    public Double rebate(final Integer id) {
        EntityManager entityManager = emf.createEntityManager();

        Session session = sessionFactory.getCurrentSession();


        Double rebate= session.doReturningWork(new ReturningWork<Double>() {
            @Override
            public Double execute(Connection connection) throws SQLException {
                CallableStatement call = connection.prepareCall("{? = call calculate_rebate(?,?)}");
                call.registerOutParameter(1, Types.INTEGER);
                call.registerOutParameter(3, Types.DOUBLE);
                call.setInt(2, id);
                call.execute();
                double result = call.getDouble(1);
                return result;
            }
        });

        System.out.println("rebate = " + rebate);
        return rebate;
    }

}
