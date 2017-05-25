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

//implementacja metod interfejs odpowaiadających za operacje w bazie danych na encji koszyk


@Transactional
@Repository
public class CartDAOImpl implements CartDAO {

    //tworzenie obiektu session
    @Autowired
    SessionFactory sessionFactory;

    //tworzenie entitymenagera
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");

    //metoda obsługująca wywołanie procedury pl/sql dodającej produkt do koszyka
    @Override
    public void add(Integer userID, Integer productID, Integer quantity, Double totalPrice) {

        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("p_cart.add_product_to_cart")
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

    //metoda obsługująca wyświetlenie wszystkich produktów w koszyku
    @Override
    public List<Cart> findAll(int id) {
        EntityManager entityManager = emf.createEntityManager();

        List<Cart> result = (List<Cart>) entityManager.createNativeQuery("SELECT * FROM cart WHERE userID='" + id + "' and quantity>0", Cart.class).getResultList();

        entityManager.close();
        return result;
    }

    //metoda obsługująca wywołanie procedury pl/sql usuwającej produkt z koszyka
    @Override
    public void deleteProduct(Integer id) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("p_cart.delete_product_from_cart")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .setParameter(1, id);
        query.execute();
        System.out.println("Usunieto produkt z koszyka");
        entityManager.close();
    }

    //metoda obsługująca wywołanie funkcji pl/sql zwiekszającej ilosc sztuk produktu w koszyku
    @Override
    public Integer addQuantity(final Integer id) {
        EntityManager entityManager = emf.createEntityManager();

        Session session = sessionFactory.getCurrentSession();


        Integer newQuantity = session.doReturningWork(new ReturningWork<Integer>() {
            @Override
            public Integer execute(Connection connection) throws SQLException {
                CallableStatement call = connection.prepareCall("{? = call p_cart.add_quantity(?)}");
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

    //metoda obsługująca wywołanie funkcji pl/sql zmniejszającej ilosc sztuk produktu w koszyku
    @Override
    public Integer reduceQuantity(final Integer id) {
        EntityManager entityManager = emf.createEntityManager();

        Session session = sessionFactory.getCurrentSession();


        Integer newQuantity = session.doReturningWork(new ReturningWork<Integer>() {
            @Override
            public Integer execute(Connection connection) throws SQLException {
                CallableStatement call = connection.prepareCall("{? = call p_cart.reduce_quantity(?)}");
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

    //metoda obsługująca wywołanie procedury pl/sql obliczającej kwote do zaplaty
    @Override
    public Double amount(final Integer userId) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("p_cart.get_amount")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, Double.class, ParameterMode.OUT)
                .setParameter(1, userId);
        query.execute();

        Double price = (Double) query.getOutputParameterValue(2);
        if(price==null){
            price=0.0;
        }
        System.out.println("price = " + price);
        entityManager.close();
        return price;
    }

    //metoda obsługująca wywołanie funkcji pl/sql obliczającej rabat
    @Override
    public Double rebate(final Integer id) {
        EntityManager entityManager = emf.createEntityManager();

        Session session = sessionFactory.getCurrentSession();


        Double rebate= session.doReturningWork(new ReturningWork<Double>() {
            @Override
            public Double execute(Connection connection) throws SQLException {
                CallableStatement call = connection.prepareCall("{? = call p_cart.calculate_rebate(?,?)}");
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

    //metoda obsługująca wywołanie procedury pl/sql usuwającej wszystkie produkty z koszyka
    @Override
    public void clearCart(int userID) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("p_cart.clear_cart")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .setParameter(1, userID);
        query.execute();
        System.out.println("Wyczyszczono koszyk");
        entityManager.close();
    }

}
