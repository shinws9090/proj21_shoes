package proj21_shoes.controller;  //회원가입 화면에서 가입 버튼 누르면 필요한애들은??

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import proj21_shoes.service.RegisterMemberDetailService;

@Controller
//@RequestMapping("")
public class SignUpController { //
	
	@Autowired
	private RegisterMemberDetailService service;
	
	@RequestMapping("/register/step1")  //약관동의페이지
	public String handleStep1() {
	return "/register/step1";
	}
	
	@RequestMapping("/register/signup")  //회원가입 입력페이지
	public String handleStep2() {
	return "/register/signup";
	}
	
	
	
	
	@PostMapping("/register/step2")
	public String handleStep2(@RequestParam(value = "agree", defaultValue = "false") Boolean agree) {
	if (!agree) {
	return "register/step1";
	}
	return "register/step2";
	}
	
	
	/*
	 * @PostMapping("/register/step3/") public ResponseEntity<Object> newMember(
	 * MemberDetail memberDetail){ System.out.println("newMember > "+ memberDetail);
	 * // try { // service.registerMemberDetail(memberDetail); // // U // } return
	 * null; }
	 */

}
