package proj21_shoes.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.ModifyMyNormalQnACommend;
import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.MyReviewCommend;
import proj21_shoes.commend.NormalQnARegistCommand;
import proj21_shoes.commend.Pagination;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.Order;
import proj21_shoes.dto.ReView;
import proj21_shoes.dto.ReviewImage;
import proj21_shoes.service.MyPageService;
import proj21_shoes.service.MyReviewService;
import proj21_shoes.service.ProductReviewService;

@Controller
public class MyReviewController {
	
	@Autowired
	MyReviewService reviewService;
	@Autowired
	MyPageService getMyPageService;
	@Autowired
	private ProductReviewService rService;
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
		
		
		///////////////////////리뷰작성하러가기 버튼 누르면
		@GetMapping("/ProductReviewInsertAndUpdateForm/{memberId}/{productCode},{commend},{boardCode}")
		public ModelAndView ProductReviewInsertAndUpdateForm(
				@PathVariable int productCode, 
				@PathVariable int boardCode,
				@PathVariable String commend, 
				@PathVariable String memberId, 
				HttpSession session,
				HttpServletResponse response) throws IOException {
			Member member1 = (Member) session.getAttribute("sessionMember");
			if (member1 == null) {
				return new ModelAndView("redirect:/login/loginForm");
			}
			List<Integer> orderCode = rService.selectOrderCode(member1.getMemberCode(), productCode);
			if(orderCode.size()==0) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('주문정보가 없습니다.')");
				out.println("history.back()");
				out.println("</script>");
				return null;
			}
			MyPageSelectCommend memberPageSelectComment = getMyPageService.showMyPageById(memberId);
			System.out.println("memberPageSelectComment>>>"+ memberPageSelectComment);
			ModelAndView mav = new ModelAndView("/myPage/myProductReviewRegist", "orderCode", orderCode.get(0));
			mav.addObject("commend", commend);
			mav.addObject("boardCode", boardCode);
			mav.addObject("productCode", productCode);
			mav.addObject("memberPageSelectComment", memberPageSelectComment);
			session.setAttribute("memberPageSelectComment", memberPageSelectComment); 
			mav.setViewName("myPage/myProductReviewRegist");
			if (commend.equals("update")) {
				mav.addObject("reView", rService.selectReviewbyBoardCode(boardCode));
			}
			return mav;
		}
		//작성하러가기 누르면
		@PostMapping("/myProductReviewRegist")
		public ModelAndView ProductReviewInsertAndUpdate(ReView reView, @RequestParam(value = "commend") String commend,
				@RequestParam(value = "orderNum") int orderNum, @RequestParam(value = "productCode") int productCode,
				HttpSession session, MultipartHttpServletRequest request) {
			Member member = (Member) session.getAttribute("sessionMember");
			if (member == null) {
				return new ModelAndView("redirect:/login/loginForm");
			}
			ReviewImage image = new ReviewImage();

			
			reView.setOrderCode(new Order(orderNum));
			System.out.println(reView);
			if (commend.equals("insert")) {
				rService.productReviewInsert(reView);
			} else if (commend.equals("update")) {
				rService.productReviewUpdate(reView);
			}

			// 파일 start

			image.setBoardCode(reView.getBoardCode());

			String imageFolder = "reView\\" + image.getBoardCode();
			System.out.println("imageFolder : " + imageFolder);

			String pathImages = request.getSession().getServletContext().getRealPath("/") + "images\\" + imageFolder + "\\";
			System.out.println("pathImages : " + pathImages);
			try {

				List<MultipartFile> mfsList = request.getFiles("filename[]");
				for (MultipartFile mfs : mfsList) {

					String savedNames = mfs.getOriginalFilename();
					File savedir = new File(pathImages);
					File savedFiles = new File(pathImages + savedNames);
					if (!savedir.exists()) {

						savedir.mkdir();
//						System.out.println("폴더를 생성합니다.");
//						System.out.println("폴더가 존재하는지 체크 true/false : " + savedir.exists());
						savedFiles = new File(pathImages + savedNames);
						mfs.transferTo(savedFiles);
					} else {
//						System.out.println("이미 해당 폴더가 존재합니다.");
						savedFiles = new File(pathImages + savedNames);
						mfs.transferTo(savedFiles);
					}
					image.setImage(savedNames);
					System.out.println("pathImages+++ : " + pathImages + savedNames);
					System.out.println("image>>>" + image);
					rService.imageInsert(image);
				}
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			// 파일 end

			return new ModelAndView("redirect:/productDetail/" + productCode);
		}

		@GetMapping("ProductReviewDelete/{boardCode},{productCode}/{memberId}")
		public ModelAndView ProductReviewdelet(@PathVariable String memberId, @PathVariable int boardCode, @PathVariable int productCode) {
			rService.productReviewDelete(boardCode);
			rService.imageDelete(boardCode);
			return new ModelAndView("redirect:/productDetail/" + productCode);
		}
	
	
	
	}
