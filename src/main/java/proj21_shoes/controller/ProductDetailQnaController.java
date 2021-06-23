package proj21_shoes.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.service.MyQnaService;

@RestController
public class ProductDetailQnaController {
	
	@Autowired
	private MyQnaService myQnaService;
	
	//상품문의상세내역 페이지
	@GetMapping("/ProductQnADetail/{boardCode}")
	public ModelAndView myProductQnADetail(@PathVariable("boardCode") int boardCode,HttpSession session,HttpServletResponse response) {
		System.out.println("boardCode>>"+ boardCode );
		MyQnaViewCommand myQnADetail =myQnaService.selectProductQnAbyBoardCode(boardCode);

		if(myQnADetail ==null) {
			System.out.println("리스트 없");
		
		}
		
		session.setAttribute("myQnADetail", myQnADetail);  // 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView("/product/ProductQnADetail");
		mav.addObject("myQnADetail",myQnADetail);
		System.out.println(myQnADetail);
		
		return mav;
	}
	@GetMapping("/ProductQnAInsert/{productCode}")
	public ModelAndView ProductQnAInsert(@PathVariable("productCode") int productCode) {
		System.out.println("productCode>>"+ productCode );
		return new ModelAndView("/product/productQnARegist","productCode",productCode);
	}
}
