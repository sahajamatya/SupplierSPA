/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.web.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 *
 * @author dell-pc
 */
public class SMTPAuthenticator extends Authenticator {

    public PasswordAuthentication getPasswordAuthentication() {
        Mailer mailer = new Mailer();
        return new PasswordAuthentication(mailer.getFrom(), mailer.getPassword());
    }
}
