package proj21_shoes.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.ModifyMyNormalQnACommend;
import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.NormalQnARegistCommand;
import proj21_shoes.commend.Pagination;
import proj21_shoes.dto.Member;
import proj21_shoes.exeption.MyNormalQnAEmptyException;
import proj21_shoes.mapper.MemberMapper;
import proj21_shoes.service.GetMemberDetailService;
import proj21_shoes.service.MyPageService;
import proj21_shoes.service.MyQnaService;

@Controller
public class MyQnaController {
	
	@Autowired
	GetMemberDetailService getMemberService;
	@Autowired
	MyPageService getMyPageService;
	@Autowired
	GetMemberDetailService mdtService;
	@Autowired
	MyQnaService myQnaService;
	
	@Autowired
	MemberMapper memberMapper;
	
	//페이징 (좌측메뉴 나의 '상품'문의 클릭시  

	@RequestMapping("/myPage/myProductQnA/{memberId}")
	   public ModelAndView myProductQnABoard(
			 @PathVariable("memberId") String memberId,
	         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
	         @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
	         @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session,
	         HttpServletResponse response) throws Exception {
		  MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
	      ModelAndView mav = new ModelAndView();

	      int listCnt1 = myQnaService.MyPdQnACount(memberId);
	      Pagination pagination1 = new Pagination(currentPage, cntPerPage, pageSize);
	      pagination1.setTotalRecordCount(listCnt1);
	      session.setAttribute("pagination1", pagination1);
	      session.setAttribute("member", member);

	      mav.setViewName("/myPage/myProductQnA");
	      mav.addObject("pagination1", pagination1);
	      mav.addObject("myPdQna", myQnaService.SelectMyPdQnAList(memberId, pagination1));
	      return mav;
	   }
	
	
	//페이징)좌측메뉴 나의 '일반'문의 클릭시

	@RequestMapping("/myPage/myNormalQnA/{memberId}")
	   public ModelAndView myNormalQnABoard(
			 @PathVariable("memberId") String memberId,
	         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
	         @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
	         @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session,
	         HttpServletResponse response) throws Exception {
		
	  	  MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
	      ModelAndView mav = new ModelAndView();
	      int listCnt2 = myQnaService.MyNmQnACount(memberId);
	      Pagination pagination2 = new Pagination(currentPage, cntPerPage, pageSize);
	      pagination2.setTotalRecordCount(listCnt2);
	      session.setAttribute("pagination2", pagination2);
	      session.setAttribute("member", member);
	      mav.setViewName("/myPage/myNormarQnA");
	      mav.addObject("pagination2", pagination2);
	      mav.addObject("myNmQna", myQnaService.SelectMyNmQnAList(memberId, pagination2));
	      return mav;
	   }
	

		
		//'상품'문의   상세보기 클릭시
		@GetMapping("/myPage/myProductQnADetail/{memberId}/{boardCode}")
		public String myProductQnADetail(@PathVariable("memberId") String memberId, @PathVariable("boardCode") int boardCode,HttpSession session,HttpServletResponse response) {
			System.out.println("memberId>>"+ memberId );
			System.out.println("boardCode>>"+ boardCode );
			MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
			MyQnaViewCommand myQnADetail =myQnaService.selectProductQnAbyBoardCode(boardCode);

			if(myQnADetail ==null) {
				System.out.println("리스트 없당");
			
			}
			int productCode = myQnADetail.getProductCode();
			
			session.setAttribute("member", member);
			session.setAttribute("productCode", productCode);  // 요고 해줘야 jsp 에서 받을수 있당
			session.setAttribute("myQnADetail", myQnADetail);  // 요고 해줘야 jsp 에서 받을수 있당
			ModelAndView mav = new ModelAndView();
			mav.addObject("myQnADetail",myQnADetail);
			mav.addObject("member",member);
			mav.setViewName("/myPage/myProductQnADetail");
			System.out.println(myQnADetail);
			
			return "/myPage/myProductQnADetail";
			
		}
    //'일반'문의 상세보기 클릭시 
	@GetMapping("/myPage/myNormalQnADetail/{memberId}/{boardCode}")
	public String myNormarQnADetail(@PathVariable("memberId") String memberId, @PathVariable("boardCode") int boardCode,HttpSession session,HttpServletResponse response) {
		System.out.println("memberId>>"+ memberId );
		System.out.println("boardCode>>"+ boardCode );
		MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
		MyQnaViewCommand myQnADetail =myQnaService.selectNormalQnAbyBoardCode(boardCode);

		if(myQnADetail ==null) {
			System.out.println("리스트 없당");
		}
		
		session.setAttribute("member", member);
		session.setAttribute("myQnADetail", myQnADetail);  // 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView();
		mav.addObject("myQnADetail",myQnADetail);
		mav.addObject("member",member);
		mav.setViewName("/myPage/myNormalQnADetail");
		System.out.println(myQnADetail);
		
		return "/myPage/myNormalQnADetail";
		
	}
	
	
	//'일반'문의내역 페이지에서 [일반문의글 작성하러가기] 클릭시
	@RequestMapping("/myPage/normalQnARegist/1/{memberId}") 
	public String mormalQnAReg(@PathVariable("memberId")  String memberId, NormalQnARegistCommand normalQnARegistCommand, HttpSession session,HttpServletResponse response) {
		return "myPage/normalQnARegist";
	}
	
	//'일반'문의글 작성 페이지에서 [작성완료] 클릭시
	@PostMapping("/myPage/normalQnARegist/2/{memberId}")  
	public String normalQnARegSuc(@PathVariable("memberId")  String memberId ,@Valid @ModelAttribute NormalQnARegistCommand normalQnARegistCommand,Errors errors,HttpSession session,HttpServletResponse response) {
		if (errors.hasErrors()) { 
			System.out.println(1);
			System.out.println(errors);
			return "myPage/normalQnARegist";  //일로 돌려보내고
		}
		try {
			Member  member = memberMapper.selectMemberById(memberId);
			int selMemberCode = member.getMemberCode();
		//	NormalQnARegistCommand newQnA = new NormalQnARegistCommand(selMemberCode,  normalQnARegistCommand.getTitle(), normalQnARegistCommand.getContent(), normalQnARegistCommand.getReply());
			NormalQnARegistCommand newQnA = new NormalQnARegistCommand(selMemberCode,  normalQnARegistCommand.getTitle(), normalQnARegistCommand.getContent(),  memberId,normalQnARegistCommand.getMemberName());
			myQnaService.insertNormalQnA(newQnA);
			session.setAttribute("newQnA", newQnA);
			return "myPage/normalQnARegistS";
		}catch(MyNormalQnAEmptyException e) {
			errors.reject("title", "required");
			errors.reject("content", "required");
			return "myPage/normalQnARegist";  //일로
		}
			
		}
			
	
	
	// 일반 or상품문의 내역 상세보기 페이지에서  [글수정하러가기]  클릭시 //////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/myPage/{boardCode}/{memberId}/modify")
	public String modifyMyNormalQnA( @PathVariable("boardCode") int boardCode,
			@PathVariable("memberId") String memberId, @ModelAttribute("modifyMyNormalQnA") ModifyMyNormalQnACommend modifyMyNormalQnA,
			MyQnaViewCommand myQnADetail , Errors errors, HttpSession session,HttpServletResponse response) {
		System.out.println(session.getAttribute("myQnaDetail"));
				
		if (errors.hasErrors()) { 
			System.out.println(1);
			System.out.println(errors);
			System.out.println("무슨에러고");
			return "/myPage/myNormalQnADetail"; //일로 돌려보내고
		}
		if(myQnADetail.getReply()!= null) {
			System.out.println("답변글이 있어서 수정할수 없당.");
			if(myQnADetail.getProductCode()<0) {
			return "/myPage/myNormalQnADetail";
			}else {			
				return "/myPage/myProductQnADetail";
}
		}
		
	System.out.println("modifyMyNormalQnA  수정하기 페이지로 넘어오는것 >> " + modifyMyNormalQnA);
		return"/myPage/modifyMyNormalQnA";
	}

	//문의글 수정하기 페이지에서[수정완료] 클릭시 
	@PostMapping("/myPage/{boardCode}/{memberId}/modify/2")  
	public String normalQnAModifySuc(@PathVariable("boardCode") int boardCode, @PathVariable("memberId")  String memberId ,
			@Valid @ModelAttribute("modifyMyNormalQnA") ModifyMyNormalQnACommend modifyMyNormalQnA, Errors errors, HttpSession session,HttpServletResponse response) {

		System.out.println("modifyMyNormalQnA title >>> "+ modifyMyNormalQnA.getTitle());
	
		if (errors.hasErrors() ) { 
			System.out.println(1);
			System.out.println(errors);
			return "/myPage/modifyMyNormalQnA"; 
		}
		
		if(modifyMyNormalQnA.getTitle()== null || modifyMyNormalQnA.getContent()== null) {
			System.out.println("널이다");
			errors.reject("title", "required");
			errors.reject("content", "required");
			return "/myPage/modifyMyNormalQnA"; //돌려보내기
		}
		
		//에러없으면
		try {
	
			ModifyMyNormalQnACommend updateQnA = new ModifyMyNormalQnACommend(boardCode, modifyMyNormalQnA.getTitle(), modifyMyNormalQnA.getContent());
			myQnaService.updateNormalQnA(updateQnA);
			session.setAttribute("updateQnA", updateQnA);
			ModelAndView mav = new ModelAndView();
			mav.addObject("updateQnA",updateQnA);
			return "myPage/normalQnAModifyS"; 
			
		}catch(MyNormalQnAEmptyException e) {
			errors.reject("title", "required");
			errors.reject("content", "required");
			return "/myPage/modifyMyNormalQnA"; 
		}catch(Exception e) {
			return "/myPage/modifyMyNormalQnA"; //돌려보내기 (같은 상품문의와 일반문의 둘다 동일jsp 사용-> if문으로 조건두고 띄워줄부분 구분)
			
		}
	
	
	
	
	}
}