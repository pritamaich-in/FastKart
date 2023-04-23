package com.fastkart.dao;

import com.fastkart.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

//    save category to db
    public int saveCategory(Category catg) {
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            int catgId = (int) session.save(catg);
            tx.commit();
            session.close();
            return catgId;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

//    get all the listed categories in db
    public List<Category> getCategories() {
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Category");
        List<Category> catgList = query.list();
        session.close();
        return catgList;
    }

//    get category by categoryID
    public Category getCategoryByID(int id) {
        Category catg = null;
        try {
            Session session = this.factory.openSession();
            catg = session.get(Category.class, id);
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return catg;
    }
}
