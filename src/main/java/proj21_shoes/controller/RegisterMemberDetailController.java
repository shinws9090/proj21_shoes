package proj21_shoes.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import proj21_shoes.dto.RegisterRequest;
import proj21_shoes.exeption.DuplicateMemberException;
import proj21_shoes.service.RegisterMemberDetailService;

@Controller
public class RegisterMemberDetailController {
	@Autowired
	private RegisterMemberDetailService service;

	@RequestMapping("/register/step1")
	public String handleStep1() {
		return "/register/step1";
	}

	@PostMapping("/register/step2")  //가입정보 입력
	public String handleStep2(@RequestParam(value = "agree", defaultValue = "false") Boolean agree,
			RegisterRequest registerRequest) {
		if (!agree) {
//			errors.reject("email","duplicate");  //수정하기
			return "register/step1";
		}
		return "register/step2";
	}

	@GetMapping("/register/step2") //주소창에서 이래찍으면
	public String handleStep2Get() {
		return "redirect:/register/step1";  //step1로 쫓아낸당
	}


	@PostMapping("/register/step3")
	public String handleStep3(@Valid RegisterRequest regReq,Errors errors) {
		// 커맨드 객체(RegisterRequest 객체) 검증
		System.out.println("regReq.getBirthday() >> " + regReq.getBirthday());
		System.out.println(regReq.getMemberId());
		
		
		if (errors.hasErrors()) { //에러 있으면
			System.out.println(1);
			System.out.println(errors);
			return "register/step2";  //일로 돌려보내고
		}
		if (regReq.isGender()) {
			System.out.println("여");
			
		}
		if (!regReq.isGender()) {
			System.out.println("남");
			
		}
		
		
		if (!regReq.isPasswordEqualToConfirmPassword()) {//패스워드 불일치해도 돌려보내고
			errors.rejectValue("confirmPassword", "nomatch");
			return "register/step2";
		}

		try {
			service.regist(regReq);  //입력쓰
			return "/register/step3";
		} catch (DuplicateMemberException e) {
			errors.rejectValue("id", "duplicate");
			return "/register/step2";
		}

	}
}
