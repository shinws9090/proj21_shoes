package proj21_shoes.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.Product;
import proj21_shoes.service.ProductService;

@Controller
public class MainMenuController {
	
	@Autowired
	ProductService service;
	
	@GetMapping("/brand")
	public ModelAndView brandList() {
		
		return new ModelAndView("product/brand/productList");
	}
	
	@GetMapping("/women")
	public ModelAndView womenList() {
		List<Product> products = service.productByMenu("women");
		return new ModelAndView("product/women/productList","products",products);
	}
	@GetMapping("/men")
	public ModelAndView menList() {
		List<Product> products = service.productByMenu("men");
		return new ModelAndView("product/men/productList","products",products);
	}
	@GetMapping("/kids")
	public ModelAndView kidsList() {
		List<Product> products = service.productByMenu("kids");
		return new ModelAndView("product/kids/productList","products",products);
	}
}
