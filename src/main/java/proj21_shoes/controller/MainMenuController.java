package proj21_shoes.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.ProductSelectCommend;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Product;
import proj21_shoes.service.ProductService;

@RestController
public class MainMenuController {
	
	@Autowired
	ProductService service;
	
	@GetMapping("/brand/{code}")
	public ModelAndView brandList(@PathVariable("code")int code) {
		System.out.println(code);
		List<Product> products = service.productByBrand(code);
		System.out.println(products);
		ProductSelectCommend commend = new ProductSelectCommend();
		commend.setBrandCode(code);
		return new ModelAndView("product/productList","products",products)
				.addObject("productSelectCommend", commend);
	}
	@PostMapping("/productList")
	public ModelAndView productList(ProductSelectCommend productSelectCommend) {
		System.out.println(productSelectCommend);
		List<Product> products = service.productBycommand(productSelectCommend);
		return new ModelAndView("product/productList","products",products)
				.addObject("productSelectCommend", productSelectCommend);
	}
	@GetMapping("/productList")
	public ModelAndView productList(@RequestParam("menu") String menu) {
		if(menu.equals("brand")) {
			List<Brand> brand = service.brandByAll();
			return new ModelAndView("product/brandList","brand",brand);
		}else {
			List<Product> products = service.productByMenu(menu);
			return new ModelAndView("product/productList","products",products)
					.addObject("productSelectCommend", new ProductSelectCommend());
		}
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
