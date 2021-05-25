package proj21_shoes.config;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({ContextDataSource.class, ContextSqlSession.class})
@ComponentScan(basePackages = {
		"proj21_shoes.service"
		,"proj21_shoes.controller"
		,"proj21_shoes.mapper"
		})
public class ContextRoot {

}