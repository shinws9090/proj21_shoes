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

import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.NormalQnARegistCommand;
import proj21_shoes.dto.Member;
import proj21_shoes.mapper.MemberMapper;
import proj21_shoes.service.GetMemberDetailService;
import proj21_shoes.service.MyPageService;
import proj21_shoes.service.MyQnaService;

@Controller
public class MyQnaController {
	@Autowired
	MyPageService getMyPageService;
	@Autowired
	GetMemberDetailService mdtService;
	@Autowired
	MyQnaService myQnaService;
	
	@Autowired
	MemberMapper memberMapper;
	
	//상품문의내역 페이지
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
	
		
	//일반문의내역 페이지
		@GetMapping("/myPage/myNormalQnA/{memberId}")
		public String myNormalQnABoard(@PathVariable("memberId") String memberId,HttpSession session,HttpServletResponse response) {
			List<MyQnaViewCommand> myQnAList =myQnaService.selectNormalQnAbyId(memberId);
			MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);

			if (myQnAList == null  || myQnAList.size()==0 )  {
				System.out.println("리스트 없당");
				return"/myPage/myNormarQnANull";
			}
		
			
//			MemberDetail member =mdtService.getMemberDetail(memberId);
			session.setAttribute("member", member);
			session.setAttribute("myQnAList", myQnAList);  // 요고 해줘야 jsp 에서 받을수 있당
			ModelAndView mav = new ModelAndView();
			mav.addObject("myQnAList",myQnAList);
			mav.addObject("member",member);

		//	mav.setViewName("myPage/qna/{memberId}");
			System.out.println(myQnAList);
			
			return "/myPage/myNormarQnA";
			
		}
		
		
		//상품문의상세내역 페이지
		@GetMapping("/myPage/myProductQnADetail/{memberId}/{boardCode}")
		public String myProductQnADetail(@PathVariable("memberId") String memberId, @PathVariable("boardCode") int boardCode,HttpSession session,HttpServletResponse response) {
			System.out.println("memberId>>"+ memberId );
			System.out.println("boardCode>>"+ boardCode );
			MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
			MyQnaViewCommand myQnADetail =myQnaService.selectProductQnAbyBoardCode(boardCode);

			if(myQnADetail ==null) {
				System.out.println("리스트 없당");
			
			}
			
//			MemberDetail member =mdtService.getMemberDetail(memberId);
			session.setAttribute("member", member);
			session.setAttribute("myQnADetail", myQnADetail);  // 요고 해줘야 jsp 에서 받을수 있당
			ModelAndView mav = new ModelAndView();
			mav.addObject("myQnADetail",myQnADetail);
			mav.addObject("member",member);
			mav.setViewName("/myPage/myProductQnADetail");
			System.out.println(myQnADetail);
			
			return "/myPage/myProductQnADetail";
			
		}
	//일반문의상세내역 페이지
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
		
//		MemberDetail member =mdtService.getMemberDetail(memberId);
		session.setAttribute("member", member);
		session.setAttribute("myQnADetail", myQnADetail);  // 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView();
		mav.addObject("myQnADetail",myQnADetail);
		mav.addObject("member",member);
		mav.setViewName("/myPage/myNormalQnADetail");
		System.out.println(myQnADetail);
		
		return "/myPage/myNormalQnADetail";
		
	}
	@RequestMapping("/myPage/normalQnARegist/1/{memberId}")  //문의글 작성페이지로 이동
	public String mormalQnAReg(@PathVariable("memberId")  String memberId, NormalQnARegistCommand normalQnARegistCommand, HttpSession session,HttpServletResponse response) {
			// 에러떠서 수정했음! --> NormalQnARegistCommand 객체 + 	@RequestMapping
	
		return "myPage/normalQnARegist";
	}
	
	
	@PostMapping("/myPage/normalQnARegist/2/{memberId}")  //문의글 작성한거 받아서
	public String normalQnARegSuc(@PathVariable("memberId")  String memberId ,@Valid @ModelAttribute NormalQnARegistCommand normalQnARegistCommand,Errors errors,HttpSession session,HttpServletResponse response) {
		
			Member  member = memberMapper.selectMemberById(memberId);
			int selMemberCode = member.getMemberCode();
		//	NormalQnARegistCommand newQnA = new NormalQnARegistCommand(selMemberCode,  normalQnARegistCommand.getTitle(), normalQnARegistCommand.getContent(), normalQnARegistCommand.getReply());
			NormalQnARegistCommand newQnA = new NormalQnARegistCommand(selMemberCode,  normalQnARegistCommand.getTitle(), normalQnARegistCommand.getContent(), normalQnARegistCommand.getReply(), memberId,normalQnARegistCommand.getMemberName());
			myQnaService.insertNormalQnA(newQnA);
			session.setAttribute("newQnA", newQnA);
		
		return "myPage/normalQnARegistS";
	}
	
	
	
	

}
