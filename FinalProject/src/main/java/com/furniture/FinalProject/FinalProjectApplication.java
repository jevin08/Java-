package com.furniture.FinalProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

import utilites.HibernateUtil;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class FinalProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalProjectApplication.class, args);
		HibernateUtil.getSessionFactory();
	}

}
