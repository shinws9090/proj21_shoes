package proj21_shoes.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.commend.MyQnaCommand;
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
	
	//@Autowired
	
	@GetMapping("/myPage/myQnA/{memberId}")
	public String myQnaBoard(@PathVariable("memberId") String memberId,HttpSession session,HttpServletResponse response) {
		List<MyQnaCommand> myQnaList =myQnaService.selectbyId(memberId);
		MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);

		if(myQnaList ==null) {
			System.out.println("리스트 없당");
			//throw new ListNotFoundException();
		}
	
		
//		MemberDetail member =mdtService.getMemberDetail(memberId);
		session.setAttribute("member", member);
		session.setAttribute("myQnaList", myQnaList);  // 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView();
		mav.addObject("myQnaList",myQnaList);
		mav.addObject("member",member);

	//	mav.setViewName("myPage/qna/{memberId}");
		System.out.println(myQnaList);
		
		return "/myPage/myQnA";
		
	}
	//문의내역 상세보기
	@GetMapping("/myPage/myQnADetail/{memberId}/{boardCode}")
	public String myQnaDetail(@PathVariable("memberId") String memberId, @PathVariable("boardCode") int boardCode,HttpSession session,HttpServletResponse response) {
		System.out.println("memberId>>"+ memberId );
		System.out.println("boardCode>>"+ boardCode );
		MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
		MyQnaCommand myQnADetail =myQnaService.selectbyBoardCode(boardCode);

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
		mav.setViewName("/myPage/myQnADetail");
		System.out.println(myQnADetail);
		
		return "/myPage/myQnADetail";
		
	}
	
	
	
	
	

}
