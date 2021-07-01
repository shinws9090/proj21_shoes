package proj21_shoes.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import proj21_shoes.commend.MemberDetailUpdateCommend;



public class MemberDetailUpdateValidator implements Validator { // dto에 있는 항목들(이름,이메일,패스워드.패스워드확인 등 모두 점검하겠당

	private static final String emailRegExp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private Pattern pattern;

	public MemberDetailUpdateValidator() {
		this.pattern = Pattern.compile(emailRegExp);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberDetailUpdateCommend.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		//기존비번
		MemberDetailUpdateCommend regReq = (MemberDetailUpdateCommend) target;
		if (regReq.getConfirmPassword() == null || regReq.getConfirmPassword().trim().isEmpty()) {
			errors.rejectValue("confirmPassword", "required");
		}
		//변경할비번
		if (regReq.getMemberPwd() == null || regReq.getMemberPwd().trim().isEmpty()) {
			errors.rejectValue("memberPwd", "required");
		}
//		//회원이름
		if (regReq.getMemberName() == null || regReq.getMemberName().trim().isEmpty()) {
			errors.rejectValue("memberName", "required");
		}
//		//생년월일
//		//연락처
//		//우편번호
//		//주소
//		//상세주소
//		
//		if(memberUpdate.getBirthday() == null ) {
//		errors.rejectValue("birthday", "required");
//	}
//	
//	if(memberUpdate.getMemberName() ==null || memberUpdate.getMemberName().trim().isEmpty()) {
//		errors.rejectValue("memberName", "required");
//	}
//	if(memberUpdate.getTel()==null || memberUpdate.getTel().trim().isEmpty()) {
//		errors.rejectValue("tel", "required");
//	}
//	if(memberUpdate.getZipCode()==null || memberUpdate.getZipCode().trim().isEmpty()) {
//		errors.rejectValue("zipCode", "required");
//	}
//	if(memberUpdate.getEmail()==null || memberUpdate.getEmail().trim().isEmpty()) {
//		errors.rejectValue("email", "required");
//	}
//	if(memberUpdate.getAddress()==null || memberUpdate.getAddress().trim().isEmpty()) {
//		errors.rejectValue("address", "required");
//	}
//	if(memberUpdate.getDetailAddress()==null || memberUpdate.getDetailAddress().trim().isEmpty()) {
//		errors.rejectValue("detailAddress", "required");
//	}
	
		
		
		
		
		
		
		if (regReq.getEmail() == null || regReq.getEmail().trim().isEmpty()) {
			errors.rejectValue("email", "required");
		} else {
			Matcher matcher = pattern.matcher(regReq.getEmail());
			if (!matcher.matches()) {
				errors.rejectValue("email", "bad");
			}
		}
		//dto에 있는 필드이름들과 같아야 하는 애들
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
//		ValidationUtils.rejectIfEmpty(errors, "password", "required");
//		ValidationUtils.rejectIfEmpty(errors, "confirmPassword", "required");
//		if (!regReq.getPassword().isEmpty()) {
//			if (!regReq.isPasswordEqualToConfirmPassword()) {
//				errors.rejectValue("confirmPassword", "nomatch");  //이렇게 적어주고 에러명 label.properties 파일에도 적어줘야한당
//			}
//		}
	}

}
