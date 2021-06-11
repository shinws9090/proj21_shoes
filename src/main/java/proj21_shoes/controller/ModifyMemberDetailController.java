package proj21_shoes.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.service.GetMemberDetailService;
import proj21_shoes.service.GetMyPageService;
import proj21_shoes.service.ModifyMemberDetailService;

@Controller
public class ModifyMemberDetailController {

	@Autowired
	GetMyPageService service;
	@Autowired
	ModifyMemberDetailService service2;
	@Autowired
	GetMemberDetailService service3;
	
	@PostMapping("/modify/{memberId}")//나의 정보 수정
	public String myPageUpdate (@PathVariable("memberId") @ModelAttribute("memberDetail") MemberDetail memberDetail, HttpSession session,HttpServletResponse response){
		
		return  "/myPage/modify";
	
	}
	
	

}
