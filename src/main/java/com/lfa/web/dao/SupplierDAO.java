/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.web.dao;

import com.lfa.web.entity.Supplier;
import java.util.List;

/**
 *
 * @author dell-pc
 */
public interface SupplierDAO {
    List<Supplier> getAll();
    int insert(Supplier supplier);
    void update(Supplier supplier);
    boolean delete(int id);
    Supplier getById(int id);
}
