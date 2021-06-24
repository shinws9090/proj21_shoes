package proj21_shoes.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.dto.Product;
import proj21_shoes.service.MyQnaService;
import proj21_shoes.service.ProductQnaService;
import proj21_shoes.service.ProductService;

@RestController
public class ProductDetailController {
	
	@Autowired
	ProductService service;
	@Autowired
	private ProductQnaService qService;

	@GetMapping("/productDetail/{code}")
	public ModelAndView productDetail(@PathVariable("code")int code) {
		Product product = service.productByCode(code);
		int count = qService.selectProductQnACount(code);
		int limit = 5;
		List<Integer> pages = new ArrayList<Integer>();
		if(count==limit) {
			pages.add(1);
		}else {
			for(int i = 0; i<=count/limit; i++) {
				pages.add(i+1);
			}
		}
		return new ModelAndView("product/productDetail","product",product).addObject("pages",pages);
	}
	
	
	@GetMapping("/api/ProductQnAList/{productCode},{page}")
	public ResponseEntity<Object> myProductQnADetailListApi(@PathVariable int productCode,
															@PathVariable int page) {
		List<MyQnaViewCommand> qnaList = qService.selectProductQnAbyCode(productCode,page);
		System.out.println(qnaList);
		return ResponseEntity.ok(qnaList);
	}
	
	
	
	@GetMapping("api/size")
	public ResponseEntity<Object> getSize(@RequestParam(value = "styleCode") int styleCode,
			@RequestParam(value = "code") int code){
		return ResponseEntity.ok(service.OrderOptionBy2(styleCode, code));
	} 
	
}
