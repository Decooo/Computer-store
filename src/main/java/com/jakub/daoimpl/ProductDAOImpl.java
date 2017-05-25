package com.jakub.daoimpl;

import com.jakub.dao.ProductDAO;
import com.jakub.model.Product;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Jakub on 20.04.2017.
 */

//implementacja metod interfejsu odpowaiadających za operacje w bazie danych na encji produkty

@Transactional
@Repository
public class ProductDAOImpl implements ProductDAO {
    @Autowired
    SessionFactory sessionFactory;
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");

    //metoda obsługująca wywołanie procedury pl/sql dodającej nowy produkt do bazy danych
    @Override
    public void add(Product product) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("p_product.add_product")
                .registerStoredProcedureParameter(1, String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3, Double.class, ParameterMode.IN)
                .registerStoredProcedureParameter(4, byte[].class, ParameterMode.IN)
                .registerStoredProcedureParameter(5, Integer.class, ParameterMode.IN)
                .setParameter(1, product.getProductName())
                .setParameter(2, product.getProductDescription())
                .setParameter(3, product.getProductPrice())
                .setParameter(4, product.getPicture())
                .setParameter(5, product.getCategoryID());

        query.execute();
        System.out.println("Dodano nowy produkt");
        entityManager.close();
    }

    //metoda wyświetlająca wszystkie produkty z bazy danych
    @Override
    public List<Product> findAll() {
        EntityManager entityManager = emf.createEntityManager();

        List<Product> result = (List<Product>) entityManager.createNativeQuery("SELECT * FROM product", Product.class).getResultList();


        entityManager.close();
        return result;
    }

    //metoda znajdująca produkt o podanym id w bazie danych
    @Override
    public Product findProduct(String code) {
        EntityManager entityManager = emf.createEntityManager();

        Product product = (Product) entityManager.createNativeQuery("SELECT * FROM product WHERE productID='" + code + "'", Product.class).getSingleResult();
        entityManager.close();
        return product;

    }

    //metoda obsługująca wywołanie procedury pl/sql usuwająca produkt z bazy danych
    @Override
    public void deleteProduct(Integer id) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("p_product.delete_product")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .setParameter(1, id);
        query.execute();
        System.out.println("Usunieto produkt");
        entityManager.close();
    }

    //metoda obsługująca wywołanie procedury pl/sql znajdująca produkt o podanym id
    @Override
    public Product findByID(Integer id) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("p_product.find_product_by_id")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, String.class, ParameterMode.OUT)
                .registerStoredProcedureParameter(3, String.class, ParameterMode.OUT)
                .registerStoredProcedureParameter(4, Double.class, ParameterMode.OUT)
                .registerStoredProcedureParameter(5, byte[].class, ParameterMode.OUT)
                .registerStoredProcedureParameter(6, Integer.class, ParameterMode.OUT)
                .setParameter(1, id);
        query.execute();

        String name = query.getOutputParameterValue(2).toString();
        String desc = query.getOutputParameterValue(3).toString();
        Double price = Double.valueOf(query.getOutputParameterValue(4).toString());
        byte[] picture = (byte[]) query.getOutputParameterValue(5);
        Integer categoryID = Integer.valueOf(query.getOutputParameterValue(6).toString());

        Product product = new Product(id, name, price, picture, desc, categoryID);

        entityManager.close();
        return product;
    }

    //metoda obsługująca wywołanie procedury pl/sql edytującej produkt w bazie danych
    @Override
    public void update(Integer id, String name, String description, Double price, byte[] picture, Integer categoryID) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("p_product.update_product")
                .registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2, String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(3, String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(4, Double.class, ParameterMode.IN)
                .registerStoredProcedureParameter(5, byte[].class, ParameterMode.IN)
                .registerStoredProcedureParameter(6, Integer.class, ParameterMode.IN)
                .setParameter(1, id)
                .setParameter(2, name)
                .setParameter(3, description)
                .setParameter(4, price)
                .setParameter(5, picture)
                .setParameter(6, categoryID);
        query.execute();
        System.out.println("Zaaktualizowano poprawnie");
        entityManager.close();
    }

}
