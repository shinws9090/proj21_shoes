package proj21_shoes.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.ReView;
import proj21_shoes.service.ProductReviewService;

@RestController
public class ProductDetailReviewController {

	@Autowired
	private ProductReviewService rService;

	// 상품문의상세내역 페이지
	@GetMapping("/ProductReviewDetail/{boardCode}")
	public ModelAndView myProductReviewDetail(@PathVariable("boardCode") int boardCode,HttpSession session,HttpServletResponse response) {
		System.out.println("boardCode>>"+ boardCode );
		ReView reView =rService.selectReviewbyBoardCode(boardCode);

		if(reView ==null) {
			System.out.println("리스트 없");
		
		}
		ModelAndView mav = new ModelAndView("/product/ProductReviewDetail");
		mav.addObject("reView",reView);
		System.out.println(reView);
		
		return mav;
	}
	
	
	
	
	
	
	@GetMapping("/ProductReviewInsertAndUpdateForm/{productCode},{commend},{boardCode}")
	public ModelAndView ProductReviewInsertAndUpdateForm(@PathVariable int productCode,
														@PathVariable int boardCode,
														@PathVariable String commend) {
		ModelAndView mav = new ModelAndView("/product/productReviewRegist", "productCode", productCode);
		mav.addObject("commend", commend);
//		mav.addObject("orderCode", orderCode);
		mav.addObject("boardCode", boardCode);
		return mav;
	}
//
//	@PostMapping("/productReviewRegist")
//	public ModelAndView ProductReviewInsertAndUpdate(ReView reView, @RequestParam(name = "commend") String commend,
//			HttpSession session) {
//		Member member = (Member) session.getAttribute("sessionMember");
//		if (member == null) {
//			return new ModelAndView("redirect:/login/loginForm");
//		}
//		
//		if (commend.equals("insert")) {
//			rService.productReviewInsert(reView);
//		} else if (commend.equals("update")) {
//			rService.productReviewUpdate(reView);
//		}
//		return new ModelAndView("redirect:/productDetail/" + reView);
//	}
//
//	@GetMapping("ProductQnADelete/{boardCode},{productCode}")
//	public ModelAndView ProductReviewdelet(@PathVariable int boardCode, @PathVariable int productCode) {
//		rService.productReviewDelete(boardCode);
//		return new ModelAndView("redirect:/productDetail/" + productCode);
//	}
}
