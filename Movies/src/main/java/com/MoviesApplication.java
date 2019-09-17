package com;

import javafx.application.Application;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
//import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.RestController;

//@EnableOAuth2Sso
@SpringBootApplication
@RestController
@Configuration
@EntityScan
@EnableScheduling
public class MoviesApplication /*extends WebSecurityConfigurerAdapter*/ {

    private static ApplicationContext applicationContext;

//    private String[] getMethod = new String[] {};
//    private String[] putMethod = new String[] {};
//    private String[] postMethod = new String[] {"/person/", "/person", "person", "/person/**", "**/person/", "**/person/**"};
//
//    @Override
//    public void configure(HttpSecurity http) throws Exception {
//        http.authorizeRequests()
//                .antMatchers(HttpMethod.GET, getMethod).permitAll()
//                .antMatchers(HttpMethod.POST, postMethod).permitAll()
//                .antMatchers(HttpMethod.PUT, putMethod).permitAll()
//                .anyRequest().authenticated();
//    }

    public static void main(String[] args) {
        applicationContext = SpringApplication.run(MoviesApplication.class, args);
    }

    public static void displayAllBeans() {
        String[] allBeanNames = applicationContext.getBeanDefinitionNames();
        for(String beanName : allBeanNames) {
            System.out.println(beanName);
        }
    }
}
