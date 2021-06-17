package proj21_shoes.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.MyQnaCommand;
import proj21_shoes.exeption.ListNotFoundException;
import proj21_shoes.service.GetMemberDetailService;
import proj21_shoes.service.MyQnaService;

@Controller
public class MyQnaController {
	
	@Autowired
	GetMemberDetailService mdtService;
	@Autowired
	MyQnaService myQnaService;
	
	//@Autowired
	
	@GetMapping("/myPage/qna/{memberId}")
	public String myQnaBoard(@PathVariable("memberId") String memberId,HttpSession session,HttpServletResponse response) {
		List<MyQnaCommand> myQnaList =myQnaService.selectbyId(memberId);
		if(myQnaList ==null) {
			System.out.println("리스트 없당");
			//throw new ListNotFoundException();
		}
		
//		MemberDetail member =mdtService.getMemberDetail(memberId);
//	
		session.setAttribute("myQnaList", myQnaList);  // 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView();
		mav.addObject("myQnaList",myQnaList);
	//	mav.setViewName("myPage/qna/{memberId}");
		System.out.println(myQnaList);
		
		return "/myPage/qna";
		
	}
	
	@GetMapping("/myPage/myOrder/{memberId}")
	public String myOrder(@PathVariable("memberId") String memberId,HttpSession session, HttpServletResponse response) {
		
		return"myPage/myOrder";
				
	}
	
	

}
