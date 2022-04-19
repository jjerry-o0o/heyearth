package recycling;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //현재 파일도 웹 설정 포함된 파일이니 이 파일도 읽으라는 태그
public class MyWebConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/upload/**") //upload 밑에 있는 모든 것
		.addResourceLocations("file:///c:/upload/");
	}
}
