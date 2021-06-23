package proj21_shoes.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import proj21_shoes.commend.ModifyMyNormalQnA;
import proj21_shoes.commend.RegisterRequest;



public class NormalQnAModifyValidatorValidator implements Validator { // dto에 있는 항목들(이름,이메일,패스워드.패스워드확인 등 모두 점검하겠당

	

	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterRequest.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ModifyMyNormalQnA modifyMyNormalQnA = (ModifyMyNormalQnA) target;
		if (modifyMyNormalQnA.getTitle() == null || modifyMyNormalQnA.getTitle().trim().isEmpty()) {
			errors.rejectValue("title", "required");
		} 
		if (modifyMyNormalQnA.getContent() == null || modifyMyNormalQnA.getContent().trim().isEmpty()) {
			errors.rejectValue("content", "required");
		} 
		
	}

}
