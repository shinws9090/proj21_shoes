package proj21_shoes.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.ModifyMyNormalQnACommend;
import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.MyReviewCommend;
import proj21_shoes.commend.NormalQnARegistCommand;
import proj21_shoes.commend.Pagination;
import proj21_shoes.service.MyPageService;
import proj21_shoes.service.MyReviewService;

@Controller
public class MyReviewController {
	
	@Autowired
	MyReviewService reviewService;
	@Autowired
	MyPageService getMyPageService;
	
	//페이징 (좌측메뉴 나의 상품후기 클릭시

	@RequestMapping("/myPage/myReview/{memberId}")
	   public ModelAndView myReviewBoard(
			 @PathVariable("memberId") String memberId,
	         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
	         @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
	         @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session,
	         HttpServletResponse response) throws Exception {
		 MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
		 System.out.println();
		 
		 
	      ModelAndView mav = new ModelAndView();

	      int listCnt4 = reviewService.MyReviewCount(memberId);
	      Pagination pagination4 = new Pagination(currentPage, cntPerPage, pageSize);
	      pagination4.setTotalRecordCount(listCnt4);
	      session.setAttribute("pagination4", pagination4);
	      session.setAttribute("member", member);

	      mav.setViewName("/myPage/myReview");
	      mav.addObject("pagination4", pagination4);
	      mav.addObject("myReviewList", reviewService.SelectMyReviewList(memberId, pagination4));
	      return mav;
	   }
	
	

		
		//상품리뷰   상세보기 클릭시
		@GetMapping("/myPage/myReview/myReviewDetail/{memberId}/{boardCode}")
		public String myReviewBoardDetail(@PathVariable("memberId") String memberId, @PathVariable("boardCode") int boardCode,HttpSession session,HttpServletResponse response) {
			System.out.println("memberId>>"+ memberId );
			System.out.println("boardCode>>"+ boardCode );
			MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
			MyReviewCommend myReviewDetail =reviewService.selectMyReviewByBoardCode(boardCode);

			if(myReviewDetail ==null) {
				System.out.println("리스트 없당");
			
			}
			int productCode = myReviewDetail.getProductCode();
			
			session.setAttribute("member", member);
			session.setAttribute("productCode", productCode);  // 요고 해줘야 jsp 에서 받을수 있당
			session.setAttribute("myReviewDetail", myReviewDetail);  // 요고 해줘야 jsp 에서 받을수 있당
			ModelAndView mav = new ModelAndView();
			mav.addObject("myReviewDetail",myReviewDetail);
			mav.addObject("member",member);
			mav.setViewName("/myPage/myReviewDetail");
			System.out.println(myReviewDetail);
			
			return "/myPage/myReviewDetail";
			
		}
   
	
//	
//	//'일반'문의내역 페이지에서 [일반문의글 작성하러가기] 클릭시
//	@RequestMapping("/myPage/normalQnARegist/1/{memberId}") 
//	public String mormalQnAReg(@PathVariable("memberId")  String memberId, NormalQnARegistCommand normalQnARegistCommand, HttpSession session,HttpServletResponse response) {
//		return "myPage/normalQnARegist";
//	}
//	
//
//	
//	// 상품리뷰 상세보기 페이지에서  [글수정하러가기]  클릭시 //////////////////////////////////////////////////////////////////////////////
//	@RequestMapping("/myPage/{boardCode}/{memberId}/modify")
//	public String modifyMyNormalQnA( @PathVariable("boardCode") int boardCode,
//			@PathVariable("memberId") String memberId, @ModelAttribute("modifyMyNormalQnA") ModifyMyNormalQnACommend modifyMyNormalQnA,
//			MyQnaViewCommand myQnADetail , Errors errors, HttpSession session,HttpServletResponse response) {
//		System.out.println(session.getAttribute("myQnaDetail"));
//				
//		if (errors.hasErrors()) { 
//			System.out.println(1);
//			System.out.println(errors);
//			System.out.println("무슨에러고");
//			return "/myPage/myNormalQnADetail"; //일로 돌려보내고
//		}
//		if(myQnADetail.getReply()!= null) {
//			System.out.println("답변글이 있어서 수정할수 없당.");
//			if(myQnADetail.getProductCode()<0) {
//			return "/myPage/myNormalQnADetail";
//			}else {			
//				return "/myPage/myProductQnADetail";
//}
//		}
//		
//	System.out.println("modifyMyNormalQnA  수정하기 페이지로 넘어오는것 >> " + modifyMyNormalQnA);
//		return"/myPage/modifyMyNormalQnA";
//	}
			//미작성한 후기내역
		@RequestMapping("/myPage/myReviewPlz/{memberId}")
		   public ModelAndView myReviewPlzBoard(
				 @PathVariable("memberId") String memberId,
		         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
		         @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
		         @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session,
		         HttpServletResponse response) throws Exception {
			 MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
			 System.out.println();
			 
			 
		      ModelAndView mav = new ModelAndView();

		      int listCnt5 = reviewService.MyReviewPlzListCount(memberId);
		      Pagination pagination5 = new Pagination(currentPage, cntPerPage, pageSize);
		      pagination5.setTotalRecordCount(listCnt5);
		      session.setAttribute("pagination5", pagination5);
		      session.setAttribute("member", member);

		      mav.setViewName("/myPage/myPlzReview");
		      mav.addObject("pagination5", pagination5);
		      mav.addObject("myReviewPlzList", reviewService.SelectReviewPlzList(memberId, pagination5));
		      return mav;
		   }
	
	
	
	}
