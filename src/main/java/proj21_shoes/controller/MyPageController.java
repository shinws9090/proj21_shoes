package proj21_shoes.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.MemberDetailUpdateCommend;
import proj21_shoes.commend.MyOrderCommend;
import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.exeption.MemberNotFoundException;
import proj21_shoes.service.GetMemberDetailService;
import proj21_shoes.service.MyPageService;
import proj21_shoes.service.ModifyMemberDetailService;
import proj21_shoes.service.ModifyMemberService;
import proj21_shoes.service.MyOrderService;

@Controller
public class MyPageController {
	@Autowired
	MyPageService getMyPageService;
	@Autowired
	ModifyMemberDetailService modifyService;
	@Autowired
	GetMemberDetailService getMemberService;
	@Autowired
	ModifyMemberService quitMemberService;

	@Autowired
	MyOrderService myOrderService;
	
	//private Member
	//
	
	@RequestMapping("/myPageHome/{memberId}")  //마이페이지로 이동
	public String myPageHome( @PathVariable("memberId") String memberId, HttpSession session,HttpServletResponse response) {
		MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
		List<MyOrderCommend>  myOrderList  =myOrderService.selectMyOrderById(memberId);

		if(member ==null) {
			throw new MemberNotFoundException();
		}
		if(myOrderList ==null) {
			System.out.println("리스트 없당");
		}
		session.setAttribute("member", member);  // 요고 해줘야 jsp 에서 받을수 있당

		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		session.setAttribute("myOrderList", myOrderList);
		mav.addObject("myOrderList",myOrderList);
		System.out.println(member);
		mav.setViewName("myPage/myPage");

		return"/myPage/myPage";
	}
	
	//회원정보 조회
	@GetMapping("/myPage/myPageSel/{memberId}")
	public String myPage (@PathVariable("memberId") String memberId, HttpSession session,HttpServletResponse response) {  //id를 받아와서
		MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
	
		if(member ==null) {
			throw new MemberNotFoundException();
		}
		session.setAttribute("member", member);  // 요고 해줘야 jsp 에서 받을수 있당

		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		mav.setViewName("myPage/myPage2");
		System.out.println(member);




		return "/myPage/myPageSel";
	}

	
	//처음 보여지는 회원정보수정 화면!! 수정된 데이터 받는것도 다시 여기로 되돌아온다!!
	@GetMapping("/myPage/{memberId}")  // <마이페이지에서 '회원정보 변경'을  누르면 --> myPage2로 이동 
	public String myPage (@PathVariable("memberId") String memberId,
			@ModelAttribute("memberDetailUpdateCommend")  MemberDetailUpdateCommend memberUpdate, 
			MemberDetail  memberDetail, HttpSession session,HttpServletResponse response, Errors errors) {  
		//같은 페이지로 보내주기때문에 모델어트리뷰트 있어야한다!!!!!!!
		
		MemberDetail member = getMemberService.getMemberDetail(memberId); //주소에 찍힌 id로  멤버검색후 데이터 담아서
		
		System.out.println("dfjslfjslfjsfjl"+memberUpdate.getMemberId());
		
		if(member ==null) {
			throw new MemberNotFoundException();
		}

		
		session.setAttribute("member", member);  // jsp에 보내주기! 요고 해줘야 jsp 에서 받을수 있당
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		mav.setViewName("myPage/modifyForm");
		System.out.println(member);

		return "/myPage/modifyForm";
	}
	//회원정보수정용  컨트롤러로 이동시킬예정!!
	@PostMapping("/myPage/modify/{memberId}")
	public String modify(@PathVariable("memberId") String memberId,
			@ModelAttribute("memberDetailUpdateCommend") 
	 MemberDetailUpdateCommend memberUpdate,  HttpSession session, HttpServletResponse response, Errors errors) {
		
	MemberDetail memberDetail = getMemberService.getMemberDetail(memberId);


		if (errors.hasErrors()) { //에러 있으면
			System.out.println(1);
			System.out.println(errors);
			return "/myPage/modifyForm";  //일로 돌려보내고
		}
		
			//기존 비밀번호.equls(새로입력받은 번호)
		if(!memberDetail.getMemberPwd().equals(memberUpdate.getConfirmPassword())) {  //기존 비밀번호 불일치시
			System.out.println("기존비밀번호>>> "+ memberDetail.getMemberPwd());
			System.out.println("입력받은 기존비번>>> "+ memberUpdate.getConfirmPassword());
			errors.rejectValue("confirmPassword", "nomatch");
			return  "/myPage/modifyForm";

		}
		

//		MemberDetail member = getMemberService.getMemberDetail(memberId); //주소에 찍힌 id로  멤버검색후 데이터 담아서
//		session.setAttribute("member", member);  // jsp에 보내서 보여주기! 요고 해줘야 jsp 에서 받을수 있당
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("member",member);
//		mav.setViewName("myPage/modifyForm");
		
		MemberDetail updateMember =new MemberDetail(memberUpdate.getMemberId(),memberUpdate.getMemberPwd(),memberUpdate.getMemberName(),memberUpdate.isGender(),memberUpdate.getBirthday(),memberUpdate.getEmail(),memberUpdate.getTel(),memberUpdate.getZipCode(),memberUpdate.getAddress(),memberUpdate.getDetailAddress()); 
		//위에서 담은 아이디 가져와서 담기
		try {
		modifyService.modifyMemberDetail(updateMember);  //여기서 수정완료!
		return"/myPage/modifyForm";
		}catch(Exception e) {
			errors.reject("error");
			return"/myPage/modifyForm";
		}
	}
	
	
	///회원탈퇴 -비번확인 페이지로 보내기
	
	@GetMapping("/myPage/quitMember/{memberId}")  // <마이페이지에서 '회원정보 변경'을  누르면 --> myPage2로 이동 
	public String quitMemberFome (@PathVariable("memberId") String memberId,
			@ModelAttribute("memberDetailUpdateCommend")  MemberDetailUpdateCommend memberUpdate, 
			MemberDetail  memberDetail, HttpSession session,HttpServletResponse response, Errors errors) {  
		//같은 페이지로 보내주기때문에 모델어트리뷰트 있어야한다!!!!!!!
		
		MemberDetail member = getMemberService.getMemberDetail(memberId); //주소에 찍힌 id로  멤버검색후 데이터 담아서
		
		if(member ==null) {
			throw new MemberNotFoundException();
		}

		
		session.setAttribute("member", member);  // jsp에 보내주기! 요고 해줘야 jsp 에서 받을수 있당
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		mav.setViewName("myPage/quitMember");
		System.out.println(member);

		return "/myPage/quitMember";
	}
	
	@PostMapping("/myPage/quitMember/{memberId}")
	public String quitMemberSec(@PathVariable("memberId") String memberId,
			@ModelAttribute("memberDetailUpdateCommend") 
	 MemberDetailUpdateCommend memberUpdate,  HttpSession session, HttpServletResponse response, Errors errors) {
	MemberDetail memberDetail = getMemberService.getMemberDetail(memberId);
	Member member = quitMemberService.selectMemberById(memberId);
	System.out.println();


		if (errors.hasErrors()) { //에러 있으면
			System.out.println(1);
			System.out.println(errors);
			return "/myPage/quitMember";  //일로 돌려보내고
		}
		
			//기존 비밀번호.equls(새로입력받은 번호)
		if(!memberDetail.getMemberPwd().equals(memberUpdate.getConfirmPassword())) {  //기존 비밀번호 불일치시
			System.out.println("기존비밀번호>>> "+ memberDetail.getMemberPwd());
			System.out.println("입력받은 기존비번>>> "+ memberUpdate.getConfirmPassword());
			errors.rejectValue("confirmPassword", "nomatch");
			return "/myPage/quitMember";

		}

		//위에서 담은 아이디 가져와서 담기
		try {
		quitMemberService.modifyMember(memberId);  //여기서 탈퇴!

		System.out.println("member.setQuitState(true)>>>" + member.isQuitState());
		//세션없애기
		session.invalidate(); //세션제거하고
		return"/myPage/quitS";  //탈퇴되었습니다 화면 띄우기
		}catch(Exception e) {
			errors.reject("error");
			return"/myPage/modifyForm";
		}
	}
	
	//회원정보 조회
	@PostMapping("/grade/{memberId}")
	public String grade (@PathVariable("memberId") String memberId, HttpSession session,HttpServletResponse response) {  //id를 받아와서
		MyPageSelectCommend member = getMyPageService.showMyPageById(memberId);
	
		if(member ==null) {
			throw new MemberNotFoundException();
		}
		session.setAttribute("member", member);  // 요고 해줘야 jsp 에서 받을수 있당

		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		mav.setViewName("myPage/myPage2");
		System.out.println(member);


		return "/grade/grade";
	}
	
	@GetMapping("/grade/{memberId}")  
	public String noView () {  //id를 받아와서


		return "/grade/noView";
	}
	
	

}