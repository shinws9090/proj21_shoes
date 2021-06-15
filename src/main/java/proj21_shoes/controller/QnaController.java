package proj21_shoes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import proj21_shoes.service.GetMemberDetailService;

@Controller
public class QnaController {
	
	@Autowired
	GetMemberDetailService mdtService;
	
	//@Autowired
	
	@GetMapping("/myPage/qna")
	public String myQnaBoard() {
		
		return "/myPage/qna";
		
	}
	
	

}
