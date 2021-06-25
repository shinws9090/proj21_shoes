package proj21_shoes.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.MyOrderCommend;
import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.commend.Pagination;
import proj21_shoes.exeption.MemberNotFoundException;
import proj21_shoes.service.MyOrderService;
import proj21_shoes.service.MyPageService;

@Controller
public class MyOrderController {
	
	
	@Autowired
	MyPageService getMyPageService;
	@Autowired
	MyOrderService myOrderService;
	
	@RequestMapping("/myPage/myOrder/{memberId}")
	   public ModelAndView myOrder(
			  @PathVariable("memberId") String memberId,
	         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
	         @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
	         @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session,
	         HttpServletResponse response) throws Exception {
	  //    UserAuthInfo user = (UserAuthInfo) session.getAttribute("authInfo");
		MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
	      ModelAndView mav = new ModelAndView();

	      int listCnt3 = myOrderService.MyOrderCount(memberId);
	      Pagination pagination3 = new Pagination(currentPage, cntPerPage, pageSize);
	      pagination3.setTotalRecordCount(listCnt3);
	      session.setAttribute("pagination3", pagination3);
	      session.setAttribute("member", member);
	      mav.setViewName("/myPage/myOrder");
	      mav.addObject("pagination3", pagination3);
	      mav.addObject("myOrderList", myOrderService.selectMyOrderListById(memberId, pagination3));
	      return mav;
	   }
	
	
	
	/*페이징 하기 전 
	 * @GetMapping("/myPage/myOrder/{memberId}") public String
	 * myOrder(@PathVariable("memberId") String memberId,HttpSession
	 * session,HttpServletResponse response) { MyPageSelectCommend member =
	 * getMyPageService.showMyPageById(memberId); List<MyOrderCommend> myOrderList
	 * =myOrderService.selectMyOrderById(memberId); if(member ==null) { throw new
	 * MemberNotFoundException(); } if(myOrderList ==null) {
	 * System.out.println("리스트 없당"); return"/myPage/myOrderNull"; }
	 * session.setAttribute("member", member); session.setAttribute("myOrderList",
	 * myOrderList); // 요고 해줘야 jsp 에서 받을수 있당 ModelAndView mav = new ModelAndView();
	 * mav.addObject("myOrderList",myOrderList); mav.addObject("member",member); //
	 * mav.setViewName("myPage/qna/{memberId}"); System.out.println(myOrderList);
	 * return "/myPage/myOrder"; }
	 */
	
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
