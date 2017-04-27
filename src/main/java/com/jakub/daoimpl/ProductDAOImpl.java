package com.jakub.daoimpl;

import com.jakub.dao.ProductDAO;
import com.jakub.model.Category;
import com.jakub.model.Product;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Jakub on 20.04.2017.
 */
@Transactional
@Repository
public class ProductDAOImpl implements ProductDAO {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.jakub.model");

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void add(Product product) {
        EntityManager entityManager = emf.createEntityManager();
        StoredProcedureQuery query = entityManager
                .createStoredProcedureQuery("add_product")
                .registerStoredProcedureParameter(1,String.class, ParameterMode.IN)
                .registerStoredProcedureParameter(2,String.class,ParameterMode.IN)
                .registerStoredProcedureParameter(3,Double.class,ParameterMode.IN)
                .registerStoredProcedureParameter(4,byte[].class,ParameterMode.IN)
                .registerStoredProcedureParameter(5,Integer.class,ParameterMode.IN)
                .setParameter(1,product.getProductName())
                .setParameter(2,product.getProductDescription())
                .setParameter(3,product.getProductPrice())
                .setParameter(4,product.getPicture())
                .setParameter(5,product.getCategoryID());

        query.execute();
        System.out.println("Dodano nowy produkt");
        entityManager.close();
    }

    @Override
    public List<Product> findAll() {
        EntityManager entityManager = emf.createEntityManager();

        List<Product> result = (List<Product>) entityManager.createNativeQuery("SELECT * FROM product", Product.class).getResultList();


        entityManager.close();
        return result;
    }

    @Override
    public Product findProduct(String code) {
        EntityManager entityManager = emf.createEntityManager();

        Product product = (Product) entityManager.createNativeQuery("SELECT * FROM product WHERE productID='"+code+"'",Product.class).getSingleResult();
        entityManager.close();
        return product;

    }

}
