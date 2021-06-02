package proj21_shoes.controller; //회원가입 화면에서 가입 버튼 누르면 필요한애들은??

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import proj21_shoes.dto.RegisterRequest;
import proj21_shoes.exeption.DuplicateMemberException;
import proj21_shoes.service.RegisterMemberDetailService;

@Controller
//@RequestMapping("")
public class SignUpController { //

	@Autowired
	private RegisterMemberDetailService service;

	@RequestMapping("/register/step1") // 약관동의페이지
	public String handleStep1() {
		return "/register/step1";
	}

	@PostMapping("/register/step2")
	public String handleStep2(@RequestParam(value = "agree", defaultValue = "false") Boolean agree) {
		if (!agree) {
			return "register/step1";
		}
		return "register/step2";
	}

	
	@PostMapping("/register/step3")
	public String handleStep3(@Valid RegisterRequest regReq, Errors errors) {
		// 커맨드 객체(RegisterRequest 객체) 검증
		if (errors.hasErrors())
			return "register/step2";

		if (!regReq.isPasswordEqualToConfirmPassword()) {
			errors.rejectValue("confirmPassword", "nomatch");
			return "register/step2";
		}

		try {
//			service.registerMemberDetail(regReq);
			return "/register/step3";
		} catch (DuplicateMemberException e) {
			errors.rejectValue("email", "duplicate");
			return "/register/step2";
		}

	}
	 

}
