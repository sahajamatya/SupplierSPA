/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lfa.web;

import java.util.Properties;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 *
 * @author dell-pc
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages="com.lfa.web")
@PropertySource(value = "classpath:application.properties")
public class MVCConfigurer extends WebMvcConfigurerAdapter {
    @Value("${jdbc.driverClassName}")
    private String jdbcDriver;
    
   @Value("${jdbc.url}")
   private String jdbcUrl;
   
   @Value("${jdbc.username}")
   private String jdbcUsername;
   
   @Value("${jdbc.password}")
   private String jdbcPassword;
   
   @Value("${view.prefix}")
   private String viewPrefix;
   
   @Value("${view.suffix}")
   private String viewSuffix;
   
   @Bean 
   public InternalResourceViewResolver getViewResolver(){
       InternalResourceViewResolver vr = new InternalResourceViewResolver(viewPrefix, viewSuffix);
       return vr;
   }
   
   @Bean
   public DataSource getDataSource(){
       DriverManagerDataSource dataSource = new DriverManagerDataSource();
       dataSource.setDriverClassName(jdbcDriver);
       dataSource.setUrl(jdbcUrl);
       dataSource.setUsername(jdbcUsername);
       dataSource.setPassword(jdbcPassword);
       return dataSource;
   }
   
   @Bean
   public JdbcTemplate getJdbcTemplate(){
       JdbcTemplate template = new JdbcTemplate(getDataSource());
       return template;
   }
   
   @Bean
   public LocalSessionFactoryBean getSessionFactory(){
       LocalSessionFactoryBean bean = new LocalSessionFactoryBean();
       bean.setDataSource(getDataSource());
       bean.setPackagesToScan("com.lfa.web.entity");
       Properties properties = new Properties();
       properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
       properties.put("hibernate.show_sql", "true");
       bean.setHibernateProperties(properties);
       return bean;
   }
   
   
}
