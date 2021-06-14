package proj21_shoes.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.service.AuthService;
import proj21_shoes.service.FindMemberIdPwService;
@Controller
public class FindMemberIdPwController {
	
	@Autowired
	private AuthService authService;  
	
	@Autowired
	private FindMemberIdPwService findService;
	
	//아이디/ 비밀번호 찾기 화면 가기
		@RequestMapping("/login/findIdPw")  //dto 새로 하나 만들어야함. 확인용 변수만 들어간걸로
		public String findForm() {	
			
			return "/login/findIdPw";

		}
		//아이디찾기 화면가기
		@RequestMapping("/login/findId")  //dto 새로 하나 만들어야함. 확인용 변수만 들어간걸로
			public String findId(MemberDetail memberDetail ) {	
				
				return "/login/findId";

			}
		//아이디 찾기 결과화면
		@PostMapping("/findId")
		public String findId2( @Param("memberName") String memberName, @Param("email") String email,@ModelAttribute("memberDetail") MemberDetail memberDetail) {
			System.out.println("name >>> "+ memberDetail.getMemberName());
			System.out.println("email >>> "+ memberDetail.getEmail());
			
			memberName = memberDetail.getMemberName();
			email = memberDetail.getEmail();
			System.out.println("memberName>>>"+memberName);
			
		//	String name = memberDetail.getMemberName();
			//String email = memberDetail.getEmail();
			MemberDetail memberId = findService.selectMemberByNameEmail(memberName,email);
			System.out.println(memberId.getMemberId());
			return "/login/findId";
			
		}
		
		
		
			
			//비밀번호찾기
			@GetMapping("/login/findPw")  //dto 새로 하나 만들어야함. 확인용 변수만 들어간걸로
			public String findPw(@ModelAttribute("memberDetail") MemberDetail memberDetail) {	
				
				return "/login/findPw";

			}
			
			
			
			
			

}
