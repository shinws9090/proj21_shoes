package proj21_shoes.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;

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
import proj21_shoes.dto.Product;
import proj21_shoes.exeption.MemberNotFoundException;
import proj21_shoes.service.MemberService;
import proj21_shoes.service.MyOrderService;
import proj21_shoes.service.MyPageService;
import proj21_shoes.service.MyReviewService;
import proj21_shoes.service.ProductService;

@Controller
public class MyOrderController {
	
	
	@Autowired
	ProductService productService;
	@Autowired
	MyPageService getMyPageService;
	@Autowired
	MyOrderService myOrderService;
	
	@Autowired
	MemberService memberService;
	@Autowired
	MyReviewService reviewService;
	
	//주문내역 페이지
	@RequestMapping("/myPage/myOrder/{memberId}")
	   public ModelAndView myOrder(
			  @PathVariable("memberId") String memberId,
	         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
	         @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
	         @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, MyOrderCommend myOrderDetail,HttpSession session,
	         HttpServletResponse response) throws Exception {
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
	
	//상품상세페이지
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
		
		Product productSelPrice = productService.productByCode(myOrderDetail.getProductCode());
		//1개당 판매가
		int selPrice = productSelPrice.getSellPrice();
		//주문수량
		int orderCount = myOrderDetail.getOrderCount();
		//판매가*주문수량 = 판매가(정가)
		int allSelPrice = productSelPrice.getSellPrice() * myOrderDetail.getOrderCount();
	System.out.println("할인률은?? >>>"+ member.getSalePrice() );
		//할인금액     ---> 총 주문금액 & 할인률
		double gardeHal = allSelPrice * member.getSalePrice();  
//		if (member.getGrade().equals("FAMILY")) {
//	//		gardeHal=allSelPrice * 0.01;       
//				gardeHal=allSelPrice *  member.getSalePrice();   // 0.1;
//		}
//		if (member.getGrade().equals("SILVER")) {
//			gardeHal=allSelPrice * 0.1;
//		}
//		if (member.getGrade().equals("GOLD")) {
//			gardeHal=allSelPrice * 0.1;
//		}
//		if (member.getGrade().equals("VIP")) {
//			gardeHal=allSelPrice * 0.1;
//		}
//		if (member.getGrade().equals("VVIP")) {
//			gardeHal=allSelPrice * 0.1;
//		}
		
		System.out.println("할인금액 >>> "+ gardeHal);
		//실제결제금액 (정가 - 등급별 할인 - 포인트적용금액)
		double lastPrice = allSelPrice - gardeHal; //판매가 -등급별 할인
		//포인트 사용금액(판매가 - 등급할인금액 -실제결제금액 )
		double point = lastPrice-myOrderDetail.getPaymentAmountInt();
		//최종결제금액 = 정가-등급별할인-포인트
		lastPrice = lastPrice-point;
	
		//포인트 사용금액
		//int point = halPrice-
		
		
		System.out.println("상품 1개당 판매가 >> " + selPrice);
		System.out.println("구매수량 >> "+  orderCount);
		System.out.println("판매금액 >> "+ allSelPrice);//1개당 가격 * 갯수
		System.out.println("최종결제금액 >> "+ myOrderDetail.getPaymentAmount());
		System.out.println("할인금액 >> "+gardeHal );
		System.out.println("포인트 사용금액 >> "+point );
		System.out.println("최종결제금액" +lastPrice);
		//상품 1개당 금액 :  productSelPrice
		//MyPriceCommend myPriceCommend= new MyPriceCommend(selPrice,orderCount,gardeHal,lastPrice,point);

		//상품 구매수량
		myOrderDetail.setSelPrice(selPrice);
		myOrderDetail.setAllSelPrice(allSelPrice);
		myOrderDetail.setLastPrice(lastPrice);
		myOrderDetail.setGardeHal(gardeHal);
		myOrderDetail.setPoint(point);
		int pointDel =(int) (myOrderDetail.getLastPriceInt()*0.01);//적립되어있던 금액
		
		session.setAttribute("member", member);
		session.setAttribute("myOrderDetail", myOrderDetail);  // 요고 해줘야 jsp 에서 받을수 있당
	    session.setAttribute("pointDel", pointDel);
		
		//session.setAttribute("myPriceCommend", myPriceCommend);  // 결제금액에 대해서
		ModelAndView mav = new ModelAndView();
		mav.addObject("myOrderDetail",myOrderDetail);
		mav.addObject("member",member);
	//	mav.addObject("myPriceCommend",myPriceCommend);
	//	mav.setViewName("myPage/qna/{memberId}");
		System.out.println(myOrderDetail);
		return "/myPage/myOrderDetail";
	}
	
	//update 구매확정 누를시
	@RequestMapping("/myPage/myOrder/buyConfirm/{orderCode}/{memberId}")
	public ModelAndView myOrderBuyConfirm(@PathVariable("orderCode") int orderCode, @PathVariable("memberId") String memberId,
	         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
	         @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
	         @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, MyOrderCommend myOrderDetail,
	         HttpSession session,
	         HttpServletResponse response) throws Exception {
			MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
			ModelAndView mav = new ModelAndView();
	     
			
			
			System.out.println();
			System.out.println("orderCode>>>  " + orderCode);
		
		
		
				
			//	ModifyMyBuyConfirmCommend updateBuyConfirm = new ModifyMyBuyConfirmCommend(orderCode);
				int updateBuyConfirm =	myOrderService.updateMyBuyConfirm(orderCode);
				System.out.println("구매확정완료");
				System.out.println("updateBuyConfirm>> ");
				reviewService.selectMyReviewByOrderCode(orderCode);
			   
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
	
	//update 주문취소하기 누를시
		@RequestMapping("/myOrderCancel/{orderCode}/{memberId}")
		public ModelAndView myOrderCancel(@PathVariable("orderCode") int orderCode, @PathVariable("memberId") String memberId,
		         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
		         @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
		         @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, MyOrderCommend myOrderDetail,
		         HttpSession session,
		         HttpServletResponse response) throws Exception {
				MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
				MyOrderCommend  pointCancel  =myOrderService.selectMyOrderByOrderCode(orderCode);
			//	MyOrderCommend  myOrderDetail  =myOrderService.selectMyOrderByOrderCode(orderCode);
			//	 String encodedParam = URLEncoder.encode(orderCode + memberId, "UTF-8");
				System.out.println("pointCancel>>>>" + pointCancel);
				if(member ==null) {
					throw new MemberNotFoundException();
				}
				if(pointCancel ==null) {
					System.out.println("주문내역  없당");
				}
				
				Product productSelPrice = productService.productByCode(pointCancel.getProductCode());
				//1개당 판매가
				int selPrice = productSelPrice.getSellPrice();
				//주문수량
				int orderCount = pointCancel.getOrderCount();
				//판매가*주문수량 = 판매가(정가)
				int allSelPrice = productSelPrice.getSellPrice() * pointCancel.getOrderCount();
			
				//할인금액     ---> 수정해야한다
				double gardeHal = allSelPrice * member.getSalePrice();  
//				if (member.getGrade().equals("FAMILY")) {
//			//		gardeHal=allSelPrice * 0.01;       
//						gardeHal=allSelPrice * 0.1;
//				}
//				if (member.getGrade().equals("SILVER")) {
//					gardeHal=allSelPrice * 0.1;
//				}
//				if (member.getGrade().equals("GOLD")) {
//					gardeHal=allSelPrice * 0.1;
//				}
//				if (member.getGrade().equals("VIP")) {
//					gardeHal=allSelPrice * 0.1;
//				}
//				if (member.getGrade().equals("VVIP")) {
//					gardeHal=allSelPrice * 0.1;
//				}
				//실제결제금액 (정가 - 등급별 할인 - 포인트적용금액)
				double lastPrice = allSelPrice - gardeHal; //판매가 -등급별 할인
				//포인트 사용금액(판매가 - 등급할인금액 -실제결제금액 )
				double point = lastPrice-pointCancel.getPaymentAmountInt();
				//최종결제금액 = 정가-등급별할인-포인트
				lastPrice = lastPrice-point;
			
				//포인트 사용금액
				//int point = halPrice-
				
				
				System.out.println("상품 1개당 판매가 >> " + selPrice);
				System.out.println("구매수량 >> "+  orderCount);
				System.out.println("판매금액 >> "+ allSelPrice);//1개당 가격 * 갯수
				System.out.println("최종결제금액 >> "+ pointCancel.getPaymentAmount());
				System.out.println("할인금액 >> "+gardeHal );
				System.out.println("포인트 사용금액 >> "+point );
				System.out.println("최종결제금액" +lastPrice);
				//상품 1개당 금액 :  productSelPrice
				//MyPriceCommend myPriceCommend= new MyPriceCommend(selPrice,orderCount,gardeHal,lastPrice,point);

				//상품 구매수량
				pointCancel.setSelPrice(selPrice);
				pointCancel.setAllSelPrice(allSelPrice);
				pointCancel.setLastPrice(lastPrice);
				pointCancel.setGardeHal(gardeHal);
				pointCancel.setPoint(point);
				int pointDel =(int) (pointCancel.getLastPriceInt()*0.01);//적립되어있던 금액
				
				//사용했던 포인트
			//	double point = pointCancel.getPointInt();
				System.out.println("결제에 사용한 포인트 >> " + point );  //
				//적립되어있던 금액
			//	int pointDel =(int) (pointCancel.getLastPriceInt()*0.1);//적립되어있던 금액
				System.out.println("적립된 포이트 >>> " + pointDel);
				
				System.out.println("기존포인트>> " +member.getPointInt());
				//수정할 포인트
				int updatePoint = (int) ((int)member.getPointInt() +point-pointDel);
				System.out.println("기존포인트 ( " + member.getPointInt()+") +"+"사용한포인트 ("+ point+")-"+"적립된포인트 ( "+pointDel+")"+"= "+((int) ((int)member.getPointInt() +point-pointDel)));
			  
				ModelAndView mav = new ModelAndView();
		     
				
				
				System.out.println();
				System.out.println("orderCode>>>  " + orderCode);
			     
			// 주문취소하면 왜안되냐 포인트환불!!!!!!!!!! System.out.println(); 여기섷 ㅘㄱ인해보기!!!
			
					
				//	ModifyMyBuyConfirmCommend updateBuyConfirm = new ModifyMyBuyConfirmCommend(orderCode);
					int cancelMyOrder =	myOrderService.updateMyCancel(orderCode);
					int cancelPoint = memberService.updateMyPoint(memberId, updatePoint);
					System.out.println("주문취소완료");
					System.out.println("환불완료");
					reviewService.selectMyReviewByOrderCode(orderCode);
				   
				      int listCnt3 = myOrderService.MyOrderCount(memberId);
				      Pagination pagination3 = new Pagination(currentPage, cntPerPage, pageSize);
				      pagination3.setTotalRecordCount(listCnt3);
				      session.setAttribute("pagination3", pagination3);
				      session.setAttribute("member", member);
				 
				      mav.addObject("pagination3", pagination3);
				      mav.addObject("myOrderList", myOrderService.selectMyOrderListById(memberId, pagination3));
				      mav.setViewName("redirect:/myPage/myOrder/"+memberId);
				      
				      PrintWriter out = response.getWriter();
				  //    out.println("<script>");
				    //  out.println("redirect:/myPage/myOrder" + encodedParam);
//				      out.println("history.go(-1)");
				      
				   //   out.println("</script>");
				      return mav  ;	

			
		}
		//취소내역
		@RequestMapping("/myPage/myCancelOrder/{memberId}")
		   public ModelAndView myCancelOrder(
				  @PathVariable("memberId") String memberId,
		         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
		         @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
		         @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, MyOrderCommend myOrderDetail,HttpSession session,
		         HttpServletResponse response) throws Exception {
			  MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
		      ModelAndView mav = new ModelAndView();
		      
		      
		   
		      int listCnt3 = myOrderService.MyCancelOrderCount(memberId);
		      Pagination pagination3 = new Pagination(currentPage, cntPerPage, pageSize);
		      pagination3.setTotalRecordCount(listCnt3);
		      session.setAttribute("pagination3", pagination3);
		      session.setAttribute("member", member);
		      mav.setViewName("/myPage/myCancelOrder");
		      mav.addObject("pagination3", pagination3);
		      mav.addObject("myCancelOrderList", myOrderService.selectMyCancelOrderListById(memberId, pagination3));
		      return mav;
		   }
	
	

}
