package com.fastkart.dao;

import com.fastkart.entities.Product;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveproduct(Product prod) {
        boolean isSaved = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(prod);

            tx.commit();
            session.close();
            isSaved = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSaved;
    }

//    get all products
    public List<Product> getAllProducts() {
        Session session = this.factory.openSession();
        Query q = session.createQuery("from Product");
        List<Product> productList = q.list();
        session.close();
        return productList;
    }

//  get products by category ID
    public List<Product> getProductsByCategoryID(int categoryID) {
      Session session = this.factory.openSession();
      Query q = session.createQuery("from Product as p where p.category.categoryId =: cid");
      q.setParameter("cid", categoryID);
      List<Product> productList = q.list();
      session.close();
      return productList;
  }
    
}
