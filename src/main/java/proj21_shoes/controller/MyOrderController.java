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
import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.exeption.MemberNotFoundException;
import proj21_shoes.service.MyOrderService;
import proj21_shoes.service.MyPageService;

@Controller
public class MyOrderController {
	
	
	@Autowired
	MyPageService getMyPageService;
	@Autowired
	MyOrderService myOrderService;
	
	
	@GetMapping("/myPage/myOrder/{memberId}")
	public String myOrder(@PathVariable("memberId") String memberId,HttpSession session,HttpServletResponse response) {
		MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
		List<MyOrderCommend>  myOrderList  =myOrderService.selectMyOrderById(memberId);
		if(member ==null) {
			throw new MemberNotFoundException();
		}
		if(myOrderList ==null) {
			System.out.println("리스트 없당");
		}
		session.setAttribute("member", member);
		session.setAttribute("myOrderList", myOrderList);  // 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView();
		mav.addObject("myOrderList",myOrderList);
		mav.addObject("member",member);
	//	mav.setViewName("myPage/qna/{memberId}");
		System.out.println(myOrderList);
		return "/myPage/myOrder";
	}
	@GetMapping("/myPage/myOrder/orderDetail/{memberId}/{orderCode}")
	public String myOrderDetail(@PathVariable("orderCode") int orderCode, @PathVariable("memberId") String memberId,  HttpSession session,HttpServletResponse response) {
		System.out.println("orderCode >> " + orderCode);
		
		MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
		MyOrderCommend  myOrderDetail  =myOrderService.selectMyOrderByOrderCode(orderCode);
		System.out.println("myOrderDetail>>>>" + myOrderDetail);
		if(member ==null) {
			throw new MemberNotFoundException();
		}
		if(myOrderDetail ==null) {
			System.out.println("주문내역  없당");
		}
		session.setAttribute("member", member);
		session.setAttribute("myOrderDetail", myOrderDetail);  // 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView();
		mav.addObject("myOrderDetail",myOrderDetail);
		mav.addObject("member",member);
	//	mav.setViewName("myPage/qna/{memberId}");
		System.out.println(myOrderDetail);
		return "/myPage/myOrderDetail";
	}
	
	
	
	

}
