package com.jakub.daoimpl;

import com.jakub.dao.OrderDetailsDAO;
import com.jakub.model.OrderDetails;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Jakub on 16.05.2017.
 */

//implementacja metod interfejsu odpowaiadających za operacje w bazie danych na encji szczegóły zamówienia

@Transactional
@Repository
public class OrderDetailsDAOImpl implements OrderDetailsDAO {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");

    //metoda obsługująca wywołanie procedury pl/sql dodającej szeczgóły składanego zamówienia do bazy danych
    @Override
    public void addOrderDetails(int orderID, int productID, int quantity, double price) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("p_orders.add_orderdetail")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(4, Double.class, ParameterMode.IN)
                .setParameter(1, orderID)
                .setParameter(2, productID)
                .setParameter(3, quantity)
                .setParameter(4, price);
        query.execute();

        entityManager.close();
    }

    //metoda wyświetlająca szczegóły wybranego zamówienia z bazy danych
    @Override
    public List<OrderDetails> findAll(int id) {
        EntityManager entityManager = emf.createEntityManager();

        List<OrderDetails> result = (List<OrderDetails>) entityManager.createNativeQuery("SELECT * FROM orderDetails where orderID='" + id + "' ", OrderDetails.class).getResultList();

        entityManager.close();
        return result;
    }

}
