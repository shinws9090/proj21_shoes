package proj21_shoes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuController {
	
	
	@GetMapping("/brand")
	public ModelAndView brandList() {
		return new ModelAndView("product/brand/productList");
	}
	
	@GetMapping("/women")
	public ModelAndView womenList() {
		return new ModelAndView("product/women/productList");
	}
	@GetMapping("/men")
	public ModelAndView menList() {
		return new ModelAndView("product/men/productList");
	}
	@GetMapping("/kdis")
	public ModelAndView kidsList() {
		return new ModelAndView("product/kdis/productList");
	}
}
