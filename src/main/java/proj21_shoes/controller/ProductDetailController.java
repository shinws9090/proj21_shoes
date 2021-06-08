package proj21_shoes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.Product;
import proj21_shoes.service.ProductService;

@RestController
public class ProductDetailController {
	
	@Autowired
	ProductService service;

	@GetMapping("/productDetail/{code}")
	public ModelAndView productDetail(@PathVariable("code")int code) {
		System.out.println(code);
		Product product = service.productByCode(code);
		product.setOrderOptions(service.OrderOptionByCode(code));
		System.out.println(product);
		return new ModelAndView("product/productDetail","product",product);
	}
	
	@GetMapping("api/size")
	public ResponseEntity<Object> members(@RequestParam(value = "styleCode") int styleCode,
			@RequestParam(value = "code") int code){
		System.out.println(service.OrderOptionByStyle(styleCode, code));
		return ResponseEntity.ok(service.OrderOptionByStyle(styleCode, code));
	} 
}
