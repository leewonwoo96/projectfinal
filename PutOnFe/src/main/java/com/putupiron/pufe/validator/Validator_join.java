package com.putupiron.pufe.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.putupiron.pufe.dto.JoinData;

public class Validator_join implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return JoinData.class.isAssignableFrom(clazz); 
	}

	@Override
	public void validate(Object target, Errors errors) {
		JoinData jd = (JoinData)target;
		if(!jd.getUser_pw().equals(jd.getPw_confirm()))
			errors.rejectValue("user_pw","비밀번호가 일치하지 않습니다.");
		if(jd.getTerms_user()==null)
			errors.rejectValue("terms_user","모든 약관에 동의하셔야 합니다.");
		if(jd.getTerms_club()==null)
			errors.rejectValue("terms_club", "모든 약관에 동의하셔야 합니다.");
	}
}
