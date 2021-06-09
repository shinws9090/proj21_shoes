package proj21_shoes.controller;

import java.time.LocalDateTime;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import proj21_shoes.commend.RegisterRequest;
import proj21_shoes.dto.Grade;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.exeption.DuplicateMemberException;
import proj21_shoes.service.RegisterMemberDetailService;
import proj21_shoes.service.RegisterMemberService;

@Controller
public class RegisterMemberDetailController {
	@Autowired
	private RegisterMemberDetailService service;
	@Autowired
	private RegisterMemberService service2;

	@RequestMapping("/register/step1")
	public String handleStep1() {
		return "/register/step1";
	}

	@PostMapping("/register/step2")  //가입정보 입력
	public String handleStep2(@RequestParam(value = "agree", defaultValue = "false") Boolean agree,
			RegisterRequest registerRequest,Errors errors) {
		if (!agree) {
			errors.reject("agree","please");  //수정하기
			return "register/step1";
		}
		return "register/step2";
	}

	@GetMapping("/register/step2") //주소창에서 이래찍으면
	public String handleStep2Get() {
		return "redirect:/register/step1";  //step1로 쫓아낸당
	}

	@Transactional
	@PostMapping("/register/step3")
	public String handleStep3(@Valid RegisterRequest regReq,Errors errors) {
		// 커맨드 객체(RegisterRequest 객체) 검증		
		if (errors.hasErrors()) { //에러 있으면
			System.out.println(1);
			System.out.println(errors);
			return "register/step2";  //일로 돌려보내고
		}
		
		if (!regReq.isPasswordEqualToConfirmPassword()) {//패스워드 불일치해도 돌려보내고
			errors.rejectValue("confirmPassword", "nomatch");
			return "register/step2";
		}

		try {
			MemberDetail member = service.selectById(regReq.getMemberId());//selectById 메서드로 id 중복인지 확인해서
			if (member != null) {
				throw new DuplicateMemberException("dup id " + regReq.getMemberId());
			}
			//입력받은 값을 그대로 객체에 담아주기
			MemberDetail newMember =new MemberDetail(regReq.getMemberId(),regReq.getMemberPwd(),regReq.getMemberName(),regReq.isGender(),regReq.getBirthday(),regReq.getEmail(),regReq.getTel(),regReq.getZipCode(),regReq.getAddress(),regReq.getDetailAddress()); 
			//위에서 담은 아이디 가져와서 담기
			Member newMember2 = new Member(newMember,1000,0,new Grade(5),false,LocalDateTime.now()); //
			service.regist(newMember);
			service2.regist(newMember2); //객체로 담아서 넣어줘야한당

			return "/register/step3";
		} catch (DuplicateMemberException e) {
			errors.rejectValue("memberId", "duplicate");
			errors.rejectValue("email", "duplicate");
			return "/register/step2";
		}

	}
}
