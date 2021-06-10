package proj21_shoes.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.exeption.MemberNotFoundException;
import proj21_shoes.service.GetMyPageService;

@Controller
public class MyPageController {
	@Autowired
	GetMyPageService service;
	
	//private Member
	//
	
	@RequestMapping("/myPage")
	public String myPage( ) {
		return"/myPage/myPage";
	}
	
	
	@GetMapping("/myPage/{memberId}")
	public String myPage (@PathVariable("memberId") String memberId, HttpSession session,HttpServletResponse response) {  //id를 받아와서
		MyPageSelectCommend member = service.showMyPageById(memberId);
		if(member ==null) {
			throw new MemberNotFoundException();
		}
		session.setAttribute("member", member);  // 요고 해줘야 jsp 에서 받을수 있당
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		mav.setViewName("myPage/myPage2");
		System.out.println(member);
	
		
		

		return "/myPage/myPage2";
	}

}
