package proj21_shoes.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.Qna;
import proj21_shoes.service.MyQnaService;
import proj21_shoes.service.ProductQnaService;

@RestController
public class ProductDetailQnaController {

	@Autowired
	private MyQnaService myQnaService;
	@Autowired
	private ProductQnaService qService;

	// 상품문의상세내역 페이지
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


	@GetMapping("/ProductQnAInsertAndUpdateForm/{productCode},{commend},{boardCode}")
	public ModelAndView ProductQnAInsertAndUpdateForm(@PathVariable int productCode, @PathVariable int boardCode,
			@PathVariable String commend) {
		ModelAndView mav = new ModelAndView("/product/productQnARegist", "productCode", productCode);
		mav.addObject("commend", commend);
		mav.addObject("boardCode", boardCode);
		return mav;
	}

	@PostMapping("/productQnARegist")
	public ModelAndView ProductQnAInsertAndUpdate(Qna qna, @RequestParam(name = "commend") String commend,
			HttpSession session) {
		Member member = (Member) session.getAttribute("sessionMember");
		if (member == null) {
			return new ModelAndView("redirect:/login/loginForm");
		}
		qna.setMember(member);
		if (commend.equals("insert")) {
			qService.productQnAInsert(qna);
		} else if (commend.equals("update")) {
			qService.productQnAUpdate(qna);
		}
		return new ModelAndView("redirect:/productDetail/" + qna.getProductCode());
	}

	@GetMapping("ProductQnADelete/{boardCode},{productCode}")
	public ModelAndView ProductQnAdelet(@PathVariable int boardCode, @PathVariable int productCode) {
		qService.productQnADelete(boardCode);
		return new ModelAndView("redirect:/productDetail/" + productCode);
	}
}
