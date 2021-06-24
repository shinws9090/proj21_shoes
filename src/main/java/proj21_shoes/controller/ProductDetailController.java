package proj21_shoes.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.dto.Product;
import proj21_shoes.dto.ReView;
import proj21_shoes.service.ProductQnaService;
import proj21_shoes.service.ProductReviewService;
import proj21_shoes.service.ProductService;

@RestController
public class ProductDetailController {
	
	@Autowired
	ProductService service;
	@Autowired
	private ProductQnaService qService;
	@Autowired
	private ProductReviewService rService;

	@GetMapping("/productDetail/{code}")
	public ModelAndView productDetail(@PathVariable("code")int code) {
		Product product = service.productByCode(code);
		int limit = 5;

		//문의게시판 페이지 번호 연산
		int qnaCount = qService.selectProductQnACount(code);
		System.out.println(qnaCount);
		List<Integer> qnaPages = new ArrayList<Integer>();
		if(qnaCount==limit) {
			qnaPages.add(1);
		}else {
			for(int i = 1; i<=(int)(Math.ceil((double)qnaCount/limit)); i++) {
				qnaPages.add(i);
			}
		}
		
		//리뷰게시판 페이지 번호 연산
		int reviewCount = rService.selectProductReviewCount(code);
		List<Integer> reviewPages = new ArrayList<Integer>();
		if(reviewCount==limit) {
			reviewPages.add(1);
		}else {
			for(int i = 1; i<=(int)(Math.ceil((double)reviewCount/limit)); i++) {
				reviewPages.add(i);
			}
		}
		
		
		ModelAndView mav = new ModelAndView("product/productDetail","product",product);
		mav.addObject("qnaPages",qnaPages);
		mav.addObject("reviewPages",reviewPages);
		return mav;
	}
	
	
	@GetMapping("/api/ProductQnAList/{productCode},{page}")
	public ResponseEntity<Object> myProductQnAListApi(@PathVariable int productCode,
													  @PathVariable int page) {
		List<MyQnaViewCommand> qnaList = qService.selectProductQnAbyCode(productCode,page);
		System.out.println(qnaList);
		return ResponseEntity.ok(qnaList);
	}
	
	@GetMapping("/api/ProductReviewList/{productCode},{page}")
	public ResponseEntity<Object> myProductReviewListApi(@PathVariable int productCode,
														 @PathVariable int page) {
		List<ReView> reviewList = rService.selectProductReviewbyCode(productCode,page);
		System.out.println(reviewList);
		return ResponseEntity.ok(reviewList);
	}
	
	
	
	@GetMapping("api/size")
	public ResponseEntity<Object> getSize(@RequestParam(value = "styleCode") int styleCode,
			@RequestParam(value = "code") int code){
		return ResponseEntity.ok(service.OrderOptionBy2(styleCode, code));
	} 
	
}
