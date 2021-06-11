package proj21_shoes.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.service.ModifyMemberDetailService;

@Controller
public class ModifyMemberDetailController {

	@Autowired
	ModifyMemberDetailService servis;

	/*
	 * @GetMapping("/myPage/modify/{memberId}") public String
	 * modify(@PathVariable("memberId") @ModelAttribute("memberDetail") MemberDetail
	 * memberDetail) {
	 * 
	 * return"/myPage/modify"; }
	 */
	
	
	//mypage2(내상세정보)에서 정보변경을 누르면 실행!거!

	@PostMapping("/modify/{memberId}")//나의 정보 수정
	public String myPageUpdate (@PathVariable("memberId") @ModelAttribute("memberDetail") MemberDetail memberDetail, HttpSession session,HttpServletResponse response){
		
		return  "/myPage/modify";
	
	}
	
	

}
