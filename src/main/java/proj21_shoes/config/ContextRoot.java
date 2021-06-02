package proj21_shoes.config;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({ContextDataSource.class, ContextSqlSession.class, MvcConfig.class})
@ComponentScan(basePackages = {
		"proj21_shoes.service"
		,"proj21_shoes.controller"
		,"proj21_shoes.commend"
		,"proj21_shoes.mapper"
		,"proj21_shoes.common"
		})
public class ContextRoot {

}