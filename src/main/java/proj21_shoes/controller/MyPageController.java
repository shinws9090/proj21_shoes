package proj21_shoes.controller;

import java.time.LocalDateTime;

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

import proj21_shoes.commend.MemberDetailUpdateCommend;
import proj21_shoes.dto.Grade;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.exeption.MemberNotFoundException;
import proj21_shoes.service.GetMemberDetailService;
import proj21_shoes.service.GetMyPageService;
import proj21_shoes.service.ModifyMemberDetailService;

@Controller
public class MyPageController {
	@Autowired
	GetMyPageService service;
	@Autowired
	ModifyMemberDetailService service2;
	@Autowired
	GetMemberDetailService service3;
	
	//private Member
	//
	
	@RequestMapping("/myPage")  //마이페이지로 이동
	public String myPage( ) {
		return"/myPage/myPage";
	}
	
	
	@GetMapping("/myPage/{memberId}")  // <마이페이지에서 '회원정보 변경'을  누르면 --> myPage2로 이동 
	public String myPage (@PathVariable("memberId") String memberId,
			@ModelAttribute("memberDetailUpdateCommend") MemberDetailUpdateCommend memberUpdate, 
			MemberDetail  memberDetail, HttpSession session,HttpServletResponse response, Errors errors) {  
		//같은 페이지로 보내주기때문에 모델어트리뷰트 있어야한다!!!!!!!
		
		MemberDetail member = service3.getMemberDetail(memberId); //주소에 찍힌 id로  멤버검색후 데이터 담아서
		if(member ==null) {
			throw new MemberNotFoundException();
		}
		session.setAttribute("member", member);  // jsp에 보내주기! 요고 해줘야 jsp 에서 받을수 있당
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		mav.setViewName("myPage/modifyForm");
		System.out.println(member);

		return "/myPage/modifyForm";
	}
	
	@PostMapping("/myPage/modify/{memberId}")
	public String modify(@PathVariable("memberId") String memberId, @ModelAttribute("memberDetailUpdateCommend") 
	@Valid MemberDetailUpdateCommend memberUpdate, MemberDetail  memberDetail, HttpSession session,
	HttpServletResponse response, Errors errors) {
		MemberDetail member = service3.getMemberDetail(memberId); //주소에 찍힌 id로  멤버검색후 데이터 담아서
		session.setAttribute("member", member);  // jsp에 보내주기! 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		mav.setViewName("myPage/modifyForm");
		if (errors.hasErrors()) { //에러 있으면
			System.out.println(1);
			System.out.println(errors);
			return "/myPage/modifyForm";  //일로 돌려보내고
		}
		if (!memberUpdate.isPasswordEqualToConfirmPassword()) {//패스워드 불일치해도 돌려보내고
			errors.rejectValue("confirmPassword", "nomatch");
			return  "/myPage/modifyForm";
		}
		MemberDetail updateMember =new MemberDetail(memberUpdate.getMemberId(),memberUpdate.getMemberPwd(),memberUpdate.getMemberName(),memberUpdate.isGender(),memberUpdate.getBirthday(),memberUpdate.getEmail(),memberUpdate.getTel(),memberUpdate.getZipCode(),memberUpdate.getAddress(),memberUpdate.getDetailAddress()); 
		//위에서 담은 아이디 가져와서 담기
		service2.modifyMemberDetail(updateMember);
		return "/myPage/modifyForm";
		
	}
	
	
	
	

}
