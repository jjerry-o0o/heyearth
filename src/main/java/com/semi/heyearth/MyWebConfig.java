package com.semi.heyearth;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //현재 파일도 웹 설정 포함된 파일이니 이 파일도 읽으라는 태그
public class MyWebConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/upload/**") //아래에 있는 경로를 이렇게 부르겠다는 뜻
		.addResourceLocations("file:///c:/upload/"); //upload 경로라고 불려지게 됨
		//http://localhost:8080/upload 에서 이미지 파일들을 확인 가능하게 됨.
		
	}

}
