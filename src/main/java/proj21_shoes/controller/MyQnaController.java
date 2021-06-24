package proj21_shoes.controller;

import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.ModifyMyNormalQnACommend;
import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.NormalQnARegistCommand;
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
	
	///////////////////////////////////////좌측메뉴 나의 '상품'문의 클릭시 //////////////////////////////////////////////////////////////////////////////
	@GetMapping("/myPage/myProductQnA/{memberId}")
	public String myProductQnABoard(@PathVariable("memberId") String memberId,HttpSession session,HttpServletResponse response) {
		List<MyQnaViewCommand> myQnAList =myQnaService.selectProductQnAbyId(memberId);
		MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
	
		if (myQnAList == null  || myQnAList.size()==0 ) {
			System.out.println("리스트 없당");
			return"/myPage/myProductQnANull";
		}
		System.out.println(myQnAList);
		System.out.println("길이쓰 >> " + myQnAList.size());
		session.setAttribute("member", member);
		session.setAttribute("myQnAList", myQnAList);  // 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView();
		mav.addObject("myQnAList",myQnAList);
		mav.addObject("member",member);
	//	mav.setViewName("myPage/qna/{memberId}");
		System.out.println(myQnAList);
		return "/myPage/myProductQnA";
		
	}
	
		
	///////////////////////////////////////좌측메뉴 나의 '일반'문의 클릭시 //////////////////////////////////////////////////////////////////////////////
		@GetMapping("/myPage/myNormalQnA/{memberId}")
		public String myNormalQnABoard(@PathVariable("memberId") String memberId,HttpSession session,HttpServletResponse response) {
			List<MyQnaViewCommand> myQnAList =myQnaService.selectNormalQnAbyId(memberId);
			MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
		
			
				System.out.println("답변내용 가져와지나? "+ myQnAList.get(1).getReply());
			if (myQnAList == null  || myQnAList.size()==0 )  {
				System.out.println("리스트 없당");
				return"/myPage/myNormarQnANull";
			}
		
			
			session.setAttribute("member", member);
			session.setAttribute("myQnAList", myQnAList);  // 요고 해줘야 jsp 에서 받을수 있당
			ModelAndView mav = new ModelAndView();
			mav.addObject("myQnAList",myQnAList);
			mav.addObject("member",member);

			System.out.println(myQnAList);
			
			return "/myPage/myNormarQnA";
			
		}
		
		
///////////////////////////////////////'상품'문의 목록에서 상세보기 클릭시 //////////////////////////////////////////////////////////////////////////////
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
///////////////////////////////////////'일반'문의 목록에서 상세보기 클릭시 //////////////////////////////////////////////////////////////////////////////
	@GetMapping("/myPage/myNormalQnADetail/{memberId}/{boardCode}")
	public String myNormarQnADetail(@PathVariable("memberId") String memberId, @PathVariable("boardCode") int boardCode,HttpSession session,HttpServletResponse response) {
		System.out.println("memberId>>"+ memberId );
		System.out.println("boardCode>>"+ boardCode );
		MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
		MyQnaViewCommand myQnADetail =myQnaService.selectNormalQnAbyBoardCode(boardCode);

		if(myQnADetail ==null) {
			System.out.println("리스트 없당");
			//throw new ListNotFoundException();
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
	
	
///////////////////////////////////////'일반'문의 목록에서 일반문의글 작성하러가기 클릭시 //////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/myPage/normalQnARegist/1/{memberId}")  //문의글 작성페이지로 이동
	public String mormalQnAReg(@PathVariable("memberId")  String memberId, NormalQnARegistCommand normalQnARegistCommand, HttpSession session,HttpServletResponse response) {
			// 에러떠서 수정했음! --> NormalQnARegistCommand 객체 + 	@RequestMapping
		return "myPage/normalQnARegist";
	}
	
///////////////////////////////////////'일반'문의 작성하기 화면에서 작성완료 클릭시 //////////////////////////////////////////////////////////////////////////////
	@PostMapping("/myPage/normalQnARegist/2/{memberId}")  //문의글 작성한거 받아서
	public String normalQnARegSuc(@PathVariable("memberId")  String memberId ,@Valid @ModelAttribute NormalQnARegistCommand normalQnARegistCommand,Errors errors,HttpSession session,HttpServletResponse response) {
		if (errors.hasErrors()) { //에러 있으면
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
			
	
	
/////////////////////////////////////// 일반/상품 목록에서 글수정하기  클릭시 //////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/myPage/{boardCode}/{memberId}/modify")
	public String modifyMyNormalQnA( @PathVariable("boardCode") int boardCode,
			@PathVariable("memberId") String memberId, @ModelAttribute("modifyMyNormalQnA") ModifyMyNormalQnACommend modifyMyNormalQnA,
			MyQnaViewCommand myQnADetail , Errors errors, HttpSession session,HttpServletResponse response) {
		System.out.println(session.getAttribute("myQnaDetail"));
				
		if (errors.hasErrors()) { //에러 있으면
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

///////////////////////////////////////일반/상품 문의글 수정하기 화면에서 수정완료 클릭시 //////////////////////////////////////////////////////////////////////////////
	@PostMapping("/myPage/{boardCode}/{memberId}/modify/2")  //문의글 작성한거 받아서
	public String normalQnAModifySuc(@PathVariable("boardCode") int boardCode, @PathVariable("memberId")  String memberId ,
			@Valid @ModelAttribute("modifyMyNormalQnA") ModifyMyNormalQnACommend modifyMyNormalQnA, Errors errors, HttpSession session,HttpServletResponse response) {

		System.out.println("modifyMyNormalQnA title >>> "+ modifyMyNormalQnA.getTitle());
	
		if (errors.hasErrors() ) { //에러 있으면
			System.out.println(1);
			System.out.println(errors);
			return "/myPage/modifyMyNormalQnA"; //돌려보내기
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