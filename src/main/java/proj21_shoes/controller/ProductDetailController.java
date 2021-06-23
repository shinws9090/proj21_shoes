package proj21_shoes.controller;

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

import proj21_shoes.dto.ReView;
import proj21_shoes.review.ReviewService;

import proj21_shoes.service.MyQnaService;
import proj21_shoes.service.ProductQnaService;

import proj21_shoes.service.ProductService;

@RestController
public class ProductDetailController {
	
	@Autowired
	ProductService service;

	
	@Autowired
	ReviewService rService;

	@Autowired
	private ProductQnaService qService;


	@GetMapping("/productDetail/{code}")
	public ModelAndView productDetail(@PathVariable("code")int code) {
		Product product = service.productByCode(code);

		List<ReView> reViewList = rService.selectReviewByProductCode(code);
		System.out.println(reViewList);
		
		ModelAndView mav = new ModelAndView("product/productDetail","product",product);
		mav.addObject("reviewList",reViewList);
		
		return mav;

		List<MyQnaViewCommand> qnaList = qService.selectProductQnAbyCode(code);
		return new ModelAndView("product/productDetail","product",product).addObject("myQnAList",qnaList);

	}
	
	@GetMapping("api/size")
	public ResponseEntity<Object> getSize(@RequestParam(value = "styleCode") int styleCode,
			@RequestParam(value = "code") int code){
		return ResponseEntity.ok(service.OrderOptionBy2(styleCode, code));
	} 
	
}
