package proj21_shoes.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.commend.MemberDetailUpdateCommend;
import proj21_shoes.commend.MyOrderCommend;
import proj21_shoes.commend.MyPWConfirmCommand;
import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.exeption.DuplicateMemberException;
import proj21_shoes.exeption.MemberNotFoundException;
import proj21_shoes.service.GetMemberDetailService;
import proj21_shoes.service.ModifyMemberDetailService;
import proj21_shoes.service.ModifyMemberService;
import proj21_shoes.service.MyOrderService;
import proj21_shoes.service.MyPageService;

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
		MyPageSelectCommend memberGrade = getMyPageService.showMyPageById(memberId);
		if(member ==null) {
			throw new MemberNotFoundException();
		}
		if(myOrderList ==null) {
			System.out.println("리스트 없당");
		}
		session.setAttribute("member", member);  // 요고 해줘야 jsp 에서 받을수 있당
		session.setAttribute("memberGrade", memberGrade);  // jsp에 보내주기! 요고 해줘야 jsp 에서 받을수 있당
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		mav.addObject("memberGrade",memberGrade);
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
		MyPageSelectCommend memberGrade = getMyPageService.showMyPageById(memberId);
	//	System.out.println("dfjslfjslfjsfjl"+memberUpdate.getMemberId());
		
		if(member ==null) {
			throw new MemberNotFoundException();
		}

		
		session.setAttribute("member", member);  // jsp에 보내주기! 요고 해줘야 jsp 에서 받을수 있당
		session.setAttribute("memberGrade", memberGrade);  // jsp에 보내주기! 요고 해줘야 jsp 에서 받을수 있당
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		mav.addObject("memberGrade",memberGrade);
		mav.setViewName("myPage/modifyForm");
		System.out.println(member);

		return "/myPage/modifyForm";
	}
	//회원정보수정 입력페이지에서 저장 누를시 
	@PostMapping("/myPage/modify/{memberId}")
	public String modify(@PathVariable("memberId") String memberId2,
			@Valid @ModelAttribute("memberDetailUpdateCommend")  MemberDetailUpdateCommend memberUpdate,BindingResult bindingResult,
			 @Param("memberId") String memberId, @Param("confirmPassword") String confirmPassword, HttpSession session, HttpServletResponse response, Errors errors) {
	
		System.out.println("여기냐1");
		MemberDetail memberDetail = getMemberService.getMemberDetail(memberId2);
		MyPWConfirmCommand myPWConfirmCommand = modifyService.selectConfirmPw(memberId, confirmPassword);
		
		if (errors.hasErrors()) { //에러 있으면
			System.out.println(1);
			System.out.println(errors);
			
			return "/myPage/modifyForm";  //일로 돌려보내고
			
		}

		try {
			
			
			//기존 비밀번호.equls(새로입력받은 번호) 
		if(!memberDetail.getMemberPwd().equals(myPWConfirmCommand.getMemberPwd())) {  //기존 비밀번호 불일치시
			System.out.println("기존비밀번호>>> "+ memberDetail.getMemberPwd());
			System.out.println("입력받은 기존비번>>> "+ memberUpdate.getConfirmPassword());
			errors.rejectValue("confirmPassword", "nomatch");
			return  "/myPage/modifyForm";
		}
		if(memberDetail.getMemberPwd()==null) {  //기존 비밀번호 불일치시
			System.out.println("기존비밀번호>>> "+ memberDetail.getMemberPwd());
			System.out.println("입력받은 기존비번>>> "+ memberUpdate.getConfirmPassword());
			errors.rejectValue("confirmPassword", "nomatch");
			return  "/myPage/modifyForm";
		}
		
		
		}catch (NullPointerException e) {
			errors.rejectValue("confirmPassword", "nomatch");
			return  "/myPage/modifyForm";
		}
		
	System.out.println("일로넘어오냐");

		
		//위에서 담은 아이디 가져와서 담기
		try {
		
			MemberDetailUpdateCommend updateMember =new MemberDetailUpdateCommend(memberUpdate.getMemberId(),memberUpdate.getMemberPwd(),memberUpdate.getMemberName(),memberUpdate.isGender(),memberUpdate.getBirthday(),memberUpdate.getEmail(),memberUpdate.getTel(),memberUpdate.getZipCode(),memberUpdate.getAddress(),memberUpdate.getDetailAddress()); 
		modifyService.modifyMemberDetail(updateMember);  //여기서 수정완료!
		ModelAndView mav = new ModelAndView();
		mav.addObject("updateMember",updateMember);
		MemberDetail memberDetail2 = getMemberService.getMemberDetail(memberId);

		System.out.println("변경된 비밀번호>>> "+ memberDetail2.getMemberPwd());
		
		
//		PrintWriter out = response.getWriter();
//		out.println("<script>");
//		out.println("alert('수정완료')");
//		out.println("</script>");
		System.out.println("수정완료");
		return"redirect:/myPage/myPageSel/" + memberId;
		
		}catch (DuplicateMemberException e) {
			errors.rejectValue("email", "duplicate");
			return  "/myPage/modifyForm";
		}
		catch(Exception e) {
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
	
	
	///탈퇴버튼 클릭시
	@PostMapping("/myPage/quitMember/{memberId}")
	public String quitMemberSec(@PathVariable("memberId") String memberId2,
			@ModelAttribute("memberDetailUpdateCommend")  MemberDetailUpdateCommend memberUpdate, 
			@Param("memberId") String memberId, @Param("confirmPassword") String confirmPassword,  HttpSession session, HttpServletResponse response, Errors errors) {
	MemberDetail memberDetail = getMemberService.getMemberDetail(memberId2);
	Member member = quitMemberService.selectMemberById(memberId2);
	MyPWConfirmCommand myPWConfirmCommand = modifyService.selectConfirmPw(memberId, confirmPassword);
	System.out.println();


		if (errors.hasErrors()) { //에러 있으면
			System.out.println(1);
			System.out.println(errors);
			return "/myPage/quitMember";  //일로 돌려보내고
		}

		
		try {
			//기존 비밀번호.equls(새로입력받은 번호)
		if(!memberDetail.getMemberPwd().equals(myPWConfirmCommand.getMemberPwd())) {  //기존 비밀번호 불일치시
			System.out.println("기존비밀번호>>> "+ memberDetail.getMemberPwd());
			System.out.println("입력받은 기존비번>>> "+ memberUpdate.getConfirmPassword());
			errors.rejectValue("confirmPassword", "nomatch");
			return "/myPage/quitMember";

		}
		}catch (NullPointerException e) {
			errors.rejectValue("confirmPassword", "nomatch");
			return "/myPage/quitMember";
			// TODO: handle exception
		}
//		MemberDetail confirmPw = modifyService.selectConfirmPw(memberId, memberUpdate.getConfirmPassword());
//		System.out.println("confirmPw>>>>>"+confirmPw);
//		if(confirmPw==null){
//			System.out.println("confirmPw>>>"+confirmPw);
//			System.out.println("기존비밀번호>>> "+ memberDetail.getMemberPwd());
//			System.out.println("입력받은 기존비번>>> "+ confirmPw);
//			errors.rejectValue("confirmPassword", "nomatch");
//			return "/myPage/quitMember";
//		}
		

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