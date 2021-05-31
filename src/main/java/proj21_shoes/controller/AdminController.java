package proj21_shoes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
//	관리자 페이지 연결용
	@GetMapping("/admin")
	public ModelAndView Admin() {
		return new ModelAndView("admin/adminMain");
	}
}
