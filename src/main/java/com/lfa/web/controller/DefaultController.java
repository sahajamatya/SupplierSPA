/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.web.controller;

import com.lfa.web.dao.SupplierDAO;
import com.lfa.web.entity.Supplier;
import com.lfa.web.util.Mailer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author dell-pc
 */
@Controller
@RequestMapping(value = "/")
public class DefaultController {

    @Autowired
    @Qualifier(value = "supplierDAOHibernateImpl")
    private SupplierDAO supplierDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("suppliers", supplierDAO.getAll());
        return "index";
    }

    @RequestMapping(value = "/addSupplier", method = RequestMethod.POST)
    public String addSupplier(Supplier supplier) {
        supplierDAO.insert(supplier);
        return "redirect:/";
    }

    @RequestMapping(value = "/editSupplier", method = RequestMethod.POST)
    public String editSupplier(Supplier supplier) {
        supplierDAO.update(supplier);
        return "redirect:/";
    }

    @RequestMapping(value = "/deleteSupplier", method = RequestMethod.POST)
    public String deleteSupplier(@RequestParam("did") int id) {
        supplierDAO.delete(id);
        return "redirect:/";
    }

    @RequestMapping(value = "/mail", method = RequestMethod.POST)
    public String mail(@RequestParam("to") String to,
            @RequestParam("subject") String subject,
            @RequestParam("body") String body,
            @RequestParam("id") int id) {
        Mailer mailer = new Mailer();
        mailer.setTo(to);
        mailer.setSubject(subject);
        mailer.setBody(body);
        try {
            mailer.sendMail();
            System.out.println("Message sent");
        } catch (MessagingException ex) {
            System.out.println(ex.getMessage());
            System.out.println("message not sent");
        }
        return "redirect:/";
    }
}
