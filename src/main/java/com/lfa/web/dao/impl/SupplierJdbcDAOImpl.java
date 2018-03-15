/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.web.dao.impl;

import com.lfa.web.dao.SupplierDAO;
import com.lfa.web.entity.Supplier;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dell-pc
 */
@Repository
public class SupplierJdbcDAOImpl implements SupplierDAO{

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Override
    public List<Supplier> getAll() {
        return jdbcTemplate.query("select * from suppliers", new RowMapper<Supplier>() {
            @Override
            public Supplier mapRow(ResultSet rs, int i) throws SQLException {
                Supplier supplier = new Supplier();
                supplier.setId(rs.getInt("id"));
                supplier.setName(rs.getString("name"));
                supplier.setContact(rs.getString("contact"));
                supplier.setEmail(rs.getString("email"));
                supplier.setStatus(rs.getBoolean("status"));
                return supplier;
            }
        });
    }

    @Override
    public int insert(Supplier supplier) {
        String sql = "insert into suppliers(name, contact, email, status) values(?,?,?,?)";
        return jdbcTemplate.update(sql, new Object[]{
            supplier.getName(), supplier.getContact(), supplier.getEmail(), supplier.isStatus()
        });
    }
    
    @Override
    public void update(Supplier supplier) {
        String sql = "update suppliers set name=?, contact=?, email=?, status=? where id=?";
        
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Supplier getById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
