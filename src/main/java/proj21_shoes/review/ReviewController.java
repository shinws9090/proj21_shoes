package proj21_shoes.review;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.ReviewCommand;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.ReView;
import proj21_shoes.service.ReviewDetailService;


@RestController
@RequestMapping("/api")

public class ReviewController {


	@Autowired
	private ReviewService service;
	
	@Autowired
	private ReviewDetailService rService;
	
	@GetMapping("/reviewRead/{productCode}")
	public ModelAndView reviewDetail(@PathVariable("productCode") int productCode,HttpSession session,HttpServletResponse response) {
		System.out.println("productCode>>"+ productCode );
		ReviewCommand reviewRead =rService.selectReviewByProductCode(productCode);

		if(reviewRead ==null) {
			System.out.println("리스트 없");
		
		}
		session.setAttribute("reviewRead", reviewRead);  // 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView("/review/reviewRead");
		mav.addObject("reviewRead",reviewRead);
		System.out.println(reviewRead);
		
		return mav;
	}
	@GetMapping("/ReviewInsertAndUpdateForm/{productCode},{commend},{boardCode}")
	public ModelAndView ReviewInsertAndUpdateForm(@PathVariable int productCode, @PathVariable int boardCode,
			@PathVariable String commend) {
		ModelAndView mav = new ModelAndView("/review/reviewRead", "productCode", productCode);
		mav.addObject("commend", commend);
		mav.addObject("boardCode", boardCode);
		return mav;
	}

	@PostMapping("/reviewRead")
	public ModelAndView ReviewInsertAndUpdate(ReView review, @RequestParam(name = "commend") String commend,
			HttpSession session) {
		Member member = (Member) session.getAttribute("sessionMember");
		if (member == null) {
			return new ModelAndView("redirect:/login/loginForm");
		}
		review.setMember(member);
		if (commend.equals("insert")) {
			rService.productReviewInsert(review);
		} else if (commend.equals("update")) {
			rService.productReviewUpdate(review);
		}
		return new ModelAndView("redirect:/productDetail/" + review.getBoardCode());
	}

	@GetMapping("ReviewDelete/{boardCode},{productCode}")
	public ModelAndView ReviewDelete(@PathVariable int boardCode, @PathVariable int productCode) {
		rService.productReviewDelete(boardCode);
		return new ModelAndView("redirect:/productDetail/" + productCode);
	}
	
}



