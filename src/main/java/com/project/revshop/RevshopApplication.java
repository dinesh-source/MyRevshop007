package com.project.revshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
//@EnableDiscoveryClient
public class RevshopApplication {

	public static void main(String[] args) {
		SpringApplication.run(RevshopApplication.class, args);
		
	}

}
