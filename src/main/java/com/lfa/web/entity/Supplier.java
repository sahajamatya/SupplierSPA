/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.web.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author dell-pc
 */
@Entity
@Table(name="suppliers")
public class Supplier {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id")
    private int id;
    @Column(name="name")
    private String name;
    @Column(name="contact")
    private String contact;
    @Column(name="email")
    private String email;
    @Column(name="added_date", insertable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date addedDate;
    @Column(name="modified_date", nullable = true)
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedDate;
    @Column(name="status")
    private boolean status;
//    @Column(name="total_products")
//    private int totalProducts;

    public Supplier() {
    }

    public Supplier(int id, String name, String contact, String email, Date addedDate, Date modifiedDate, boolean status) {
        this.id = id;
        this.name = name;
        this.contact = contact;
        this.email = email;
        this.addedDate = addedDate;
        this.modifiedDate = modifiedDate;
        this.status = status;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getAddedDate(){
        return addedDate;
    }
    
    public void setAddedDate(Date addedDate){
        this.addedDate=addedDate;
    }
    
    public Date getModifiedDate(){
        return modifiedDate;
    }
    
    public void setModifiedDate(Date modifiedDate){
        this.modifiedDate=modifiedDate;
    }
    
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
