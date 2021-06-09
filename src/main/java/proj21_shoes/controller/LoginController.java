package proj21_shoes.controller;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_shoes.commend.AuthInfo;
import proj21_shoes.commend.LoginCommand;
import proj21_shoes.exeption.WrongIdPasswordException;
import proj21_shoes.service.AuthService;

@Controller
public class LoginController {

	@Autowired
	private AuthService authService;  

	@GetMapping("/login/loginForm")
	public String form(LoginCommand loginComaand, @CookieValue(value = "REMEMBER", required = false) Cookie cookie) {	
		
		if(cookie!=null) {
			loginComaand.setMemberId(cookie.getValue());
			loginComaand.setRememberId(true);
		}
		return "/login/loginForm";

	}

	@PostMapping("/login/loginSuccess")
	public String submit(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) {
	//	new LoginCommandValidator().validate(loginCommand, errors);
		if (errors.hasErrors())
			return "/login/loginForm";
		try {
			AuthInfo authInfo = authService.authenicate(loginCommand.getMemberId(), loginCommand.getMemberPwd());
			session.setAttribute("authInfo", authInfo);
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
		}

	}
	

}

