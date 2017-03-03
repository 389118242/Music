package com.music.config;

import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.music.interceptor.LoginInterceptor;

@Configuration
public class WebMvcConfigurerImpl extends WebMvcConfigurerAdapter {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**");
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver configureMultipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		multipartResolver.setMaxUploadSize(20971520);
		return multipartResolver;
	}

	@Bean
	public MapperScannerConfigurer configureMapperScannerConfigurer() {
		MapperScannerConfigurer mapper = new MapperScannerConfigurer();
		mapper.setSqlSessionFactoryBeanName("sqlSessionFactory");
		mapper.setBasePackage("com.music.dao");
		return mapper;
	}
}
