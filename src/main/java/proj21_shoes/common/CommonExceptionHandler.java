package proj21_shoes.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice("proj21_shoes")//이 프로젝트 모든 패키지에 있는 익셉션 가져다쓸수있당!
public class CommonExceptionHandler {
	
//	@ExceptionHandler(RuntimeException.class)
//    public String handleRuntimeException() {
//        return "error/commonException";
//    }


}
