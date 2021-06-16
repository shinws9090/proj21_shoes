package proj21_shoes.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.StringUtils;

import proj21_shoes.commend.ProductSelectCommend;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Product;
import proj21_shoes.service.ProductService;

@RestController
public class MainMenuController {
	
	@Autowired
	ProductService service;
	
	@GetMapping("/api/images")
	public ResponseEntity<Object> images(HttpServletRequest request){
		
		File dir = new File(request.getRealPath("/")+"images/slide");
	    File[] fileList = dir.listFiles();
	    List<String> fileNames = new ArrayList<String>();
	    for(File f : fileList) {
	    	fileNames.add(f.getName());
	    }
		return ResponseEntity.ok(fileNames);
	}
	@GetMapping("/api/mainList/{main}")
	public ResponseEntity<Object> newProductList(@PathVariable("main")String main){
		ProductSelectCommend commend = new ProductSelectCommend();
		commend.setMain(main);
		List<Product> products = service.productBycommand(commend);
		System.out.println(products);
		return ResponseEntity.ok(products);
	}
	
	
	@GetMapping("/brand/{code}")
	public ModelAndView brandList(@PathVariable("code")int code) {
		System.out.println(code);
//		List<Product> products = service.productByBrand(code);
		ProductSelectCommend commend = new ProductSelectCommend();
		commend.setBrandCode(code);
		List<Product> products = service.productBycommand(commend);
		System.out.println(products);
		return new ModelAndView("product/productList","products",products)
				.addObject("productSelectCommend", commend);
	}
	
	@PostMapping("/productList")
	public ModelAndView productList(ProductSelectCommend productSelectCommend) {
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
			ProductSelectCommend commend = new ProductSelectCommend();
			commend.setGender(menu);
			List<Product> products = service.productBycommand(commend);
			System.out.println(products);
			return new ModelAndView("product/productList","products",products)
					.addObject("productSelectCommend", commend);
		}
	}
}
