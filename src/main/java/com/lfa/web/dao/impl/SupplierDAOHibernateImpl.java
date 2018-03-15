/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.web.dao.impl;

import com.lfa.web.dao.SupplierDAO;
import com.lfa.web.entity.Supplier;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dell-pc
 */
@Repository
public class SupplierDAOHibernateImpl implements SupplierDAO{
    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;
    
    @Override
    public List<Supplier> getAll() {
        session = sessionFactory.openSession();
        return session.createQuery("Select s from Supplier s").list();
    }

    @Override
    public int insert(Supplier supplier) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        int result = (int)session.save(supplier);
        trans.commit();
        return result;
    }
    
    @Override
    public void update(Supplier supplier) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.saveOrUpdate(supplier);
        trans.commit();
    }

    @Override
    public boolean delete(int id) {
        Supplier supplier = getById(id);
        if(supplier!=null){
            session = sessionFactory.openSession();
            trans = session.beginTransaction();
            session.delete(supplier);
            trans.commit();
            return true;
        }
        return false;
    }

    @Override
    public Supplier getById(int id) {
        session = sessionFactory.openSession();
        return (Supplier)session.get(Supplier.class, id);
    }
    
}
