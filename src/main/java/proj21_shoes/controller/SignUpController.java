package proj21_shoes.controller;  //회원가입 화면에서 가입 버튼 누르면 필요한애들은??

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.service.RegisterMemberDetailService;

@Controller
//@RequestMapping("")
public class SignUpController { //
	
	@Autowired
	private RegisterMemberDetailService service;
	
	
	
	
	@PostMapping("/register/step3/")
	public ResponseEntity<Object> newMember( MemberDetail memberDetail){
		System.out.println("newMember > "+ memberDetail);
//		try {
//			service.registerMemberDetail(memberDetail);
//			
//			U
//		}
		return null;
	}

}
