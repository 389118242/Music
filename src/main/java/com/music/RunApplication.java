package com.music;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;

import com.music.config.WebMvcConfigurerImpl;

@SpringBootApplication
@Import(WebMvcConfigurerImpl.class)
@ImportResource(locations = "classpath:config/spring-transaction.xml")
public class RunApplication{

	public static void main(String[] args) {
		SpringApplication.run(RunApplication.class);
	}

}
