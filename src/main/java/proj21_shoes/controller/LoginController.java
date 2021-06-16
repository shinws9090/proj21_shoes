package proj21_shoes.controller;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import proj21_shoes.commend.LoginCommand;
import proj21_shoes.commend.LoginCommand2;
import proj21_shoes.dto.Member;
import proj21_shoes.exeption.QuitMemberException;
import proj21_shoes.exeption.WrongIdPasswordException;
import proj21_shoes.mapper.MemberMapper;
import proj21_shoes.service.AuthService;
import proj21_shoes.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private AuthService authService;  
	
	@Autowired
	private LoginService service;
	@Autowired
	private MemberMapper mapper;  //서비스로 곧 바까줄꺼에여!!!
	
	
	//로그인 화면
	@GetMapping("/login/loginForm")
	public String form(LoginCommand loginComaand, @CookieValue(value = "REMEMBER", required = false) Cookie cookie) {	
		
		if(cookie!=null) {
			loginComaand.setMemberId(cookie.getValue());
			loginComaand.setRememberId(true);
		}
		return "/login/loginForm";

	}
	//로그인완료 화면
	@PostMapping("/login/loginSuccess")
	public String submit(@Param("memberId") String memberId, @Param("memberPwd") String memberPwd, @ModelAttribute LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) {
	//	new LoginCommandValidator().validate(loginCommand, errors);
		if (errors.hasErrors())
			return "/login/loginForm";
		try {
			
			
		//	AuthInfoCommend authInfo = authService.authenicate(loginCommand.getMemberId(), loginCommand.getMemberPwd());
			LoginCommand2 loginIdPw =service.loginIdPw(memberId,memberPwd);
			System.out.println("아이디>>> "+memberId);
			System.out.println("비번>>> "+memberPwd);
			Member member =mapper.selectMemberById(memberId);
			if(loginIdPw==null) {
				System.out.println(loginIdPw);
				throw new WrongIdPasswordException();
			}
			if(member.isQuitState()) {
				throw new QuitMemberException();
			}
	
			
			session.setAttribute("authInfo", loginIdPw);

			Member sessionMember = authService.memberVo(memberId);
			session.setAttribute("member", sessionMember);  //이제 jsp에서 이 이름으로 객체 가져다쓰기
			
			Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getMemberId());
			rememberCookie.setPath("/");
			if (loginCommand.isRememberId()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);
			} else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);
			return "/login/loginSuccess";
		} catch (WrongIdPasswordException ex) {
			errors.reject("idPasswordNotMatching");
			return "/login/loginForm";
		}catch (QuitMemberException ex) {
			errors.reject("quitMemberException");
			return "/login/loginForm";

	   }

	
	}
	
	
	
	
	
}

