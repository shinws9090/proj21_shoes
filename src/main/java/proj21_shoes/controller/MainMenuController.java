package proj21_shoes.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Product;
import proj21_shoes.service.ProductService;

@RestController
public class MainMenuController {
	
	@Autowired
	ProductService service;
	
	@GetMapping("/brand")
	public ModelAndView brandList() {
		List<Brand> brand = service.brandByAll();
		return new ModelAndView("product/brandList","brand",brand);
	}
	@GetMapping("/brand/{code}")
	public ModelAndView brandList(@PathVariable("code")int code) {
		System.out.println(code);
		List<Product> products = service.productByBrand(code);
		System.out.println(products);
		return new ModelAndView("product/productList","products",products);
	}
	
	@GetMapping("/women")
	public ModelAndView womenList() {
		List<Product> products = service.productByMenu("women");
		return new ModelAndView("product/productList","products",products);
	}
	@GetMapping("/men")
	public ModelAndView menList() {
		List<Product> products = service.productByMenu("men");
		return new ModelAndView("product/productList","products",products);
	}
	@GetMapping("/kids")
	public ModelAndView kidsList() {
		List<Product> products = service.productByMenu("kids");
		return new ModelAndView("product/productList","products",products);
	}
	@GetMapping("/productDetail/{code}")
	public ModelAndView productDetail(@PathVariable("code")int code) {
		System.out.println(code);
		Product product = service.productByCode(code);
		product.setOrderOptions(service.OrderOptionByCode(code));
		System.out.println(product);
		return new ModelAndView("product/productDetail","product",product);
	}
}
