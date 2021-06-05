package proj21_shoes.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.RegisterRequest;

public class RegisterRequestValidator implements Validator { // dto에 있는 항목들(이름,이메일,패스워드.패스워드확인 등 모두 점검하겠당

	private static final String emailRegExp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private Pattern pattern;

	public RegisterRequestValidator() {
		this.pattern = Pattern.compile(emailRegExp);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberDetail.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegisterRequest regReq = (RegisterRequest) target;
		if (regReq.getEmail() == null || regReq.getEmail().trim().isEmpty()) {
			errors.rejectValue("email", "required");
		} else {
			Matcher matcher = pattern.matcher(regReq.getEmail());
			if (!matcher.matches()) {
				errors.rejectValue("email", "bad");
			}
		}
		//dto에 있는 필드이름들과 같아야 하는 애들
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required"); //이름
		ValidationUtils.rejectIfEmpty(errors, "password", "required");//비밀번호
		ValidationUtils.rejectIfEmpty(errors, "confirmPassword", "required");//비밀번호확인
		if (!regReq.getMemberPwd().isEmpty()) {  //공백 없고
			if (!regReq.isPasswordEqualToConfirmPassword()) {//비밀번호와 비밀번호 확인이틀리면
				errors.rejectValue("confirmPassword", "nomatch");  //이렇게 적어주고 에러명 label.properties 파일에도 적어줘야한당
			}
		}
	
	}

}
