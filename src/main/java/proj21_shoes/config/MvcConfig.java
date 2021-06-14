package proj21_shoes.config;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

@Configuration
@EnableWebMvc // 스프링 MVC설정 활성화
public class MvcConfig implements WebMvcConfigurer {
	
	/** DispatcherServlet의 매핑경로를 '/'주었을 때, JSP/HTML/CSS 등을 올바르게 처리하기 위한 설정 추가 */
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	/** JSP를 통해서 컨트롤러의 실행 결과를 보여주기 위한 설정 */
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/view/", ".jsp"); //경로 미리설정해주는거/ 이 경로에 view 만들어야함.
	}
	
	 
	@Override 
	public void addViewControllers(ViewControllerRegistry registry) { 
	registry.addViewController("/index").setViewName("index"); //메인부르면 컨트롤러 거치지 말고 바로 메인 호출시켜준다!! main.jsp는 register안 말고, view안에 바로 만들기
	registry.addViewController("/signup").setViewName("/member/signup");  //회원가입화면
//	registry.addViewController("/memberMgt").setViewName("/admin/memberMgt");

	}
	
	@Bean	//messag패키지에 속한 label 프로퍼티 파일로부터 메시지를 읽어 온당
	public MessageSource messageSource() {//빈의 아이디를 반드시 messageSource로 지정해야함. 그래야 resoursece 폴더에서 메세지 찾아온다.
		ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
		ms.setBasename("message.label");
		ms.setDefaultEncoding("UTF-8");
		return ms;
	}
	
	@Override  //json으로 받을떄 날짜형식 수정
	public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // HH:mm:ss 추가하면 시분초
		ObjectMapper objectMapper = Jackson2ObjectMapperBuilder.json()
				.featuresToEnable(SerializationFeature.INDENT_OUTPUT)
				.serializerByType(LocalDateTime.class, new LocalDateTimeSerializer(formatter))
				.simpleDateFormat("yyyy-MM-dd HH:mm:ss").build();
		converters.add(0, new MappingJackson2HttpMessageConverter(objectMapper));
	}
	
}