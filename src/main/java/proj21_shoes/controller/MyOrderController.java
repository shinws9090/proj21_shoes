package proj21_shoes.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.MyOrderCommend;
import proj21_shoes.service.MyOrderService;

@Controller
public class MyOrderController {
	
	
	
	@Autowired
	MyOrderService myOrderService;
	
	
	@GetMapping("/myPage/myOrder/{memberId}")
	public String myOrder(@PathVariable("memberId") String memberId,HttpSession session,HttpServletResponse response) {
		List<MyOrderCommend>  myOrderList  =myOrderService.selectMyOrderById(memberId);
		
		if(myOrderList ==null) {
			System.out.println("리스트 없당");
		}
		session.setAttribute("myOrderList", myOrderList);  // 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView();
		mav.addObject("myOrderList",myOrderList);
	//	mav.setViewName("myPage/qna/{memberId}");
		System.out.println(myOrderList);
		return "/myPage/myOrder";
	}
	
	
	
	

}
