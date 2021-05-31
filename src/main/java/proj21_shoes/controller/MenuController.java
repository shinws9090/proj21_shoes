package proj21_shoes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.Product;
import proj21_shoes.service.ProductService;

@Controller
public class MenuController {
	
	@Autowired
	ProductService service;
	
	@GetMapping("/brand")
	public ModelAndView brandList() {
		return new ModelAndView("product/brand/productList");
	}
	
	@GetMapping("/women")
	public ModelAndView womenList() {
//		Product product = service.productByAll();
		return new ModelAndView("product/women/productList");
	}
	@GetMapping("/men")
	public ModelAndView menList() {
		return new ModelAndView("product/men/productList");
	}
	@GetMapping("/kids")
	public ModelAndView kidsList() {
		return new ModelAndView("product/kids/productList");
	}
}
