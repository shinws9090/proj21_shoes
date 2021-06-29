package proj21_shoes.controller;

import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.Member;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.exeption.MemberNotMatchException;
import proj21_shoes.exeption.QuitMemberException;
import proj21_shoes.mapper.MemberMapper;
import proj21_shoes.service.AuthService;
import proj21_shoes.service.FindMemberIdPwService;
import proj21_shoes.service.GetMemberDetailService;
import proj21_shoes.service.ModifyMemberDetailService;
@Controller
public class FindMemberIdPwController {
	
	@Autowired
	private AuthService authService;  
	@Autowired
	private MemberMapper mapper;  //서비스로 곧 바까줄꺼에여!!!
	@Autowired
	private ModifyMemberDetailService modifyService;
	@Autowired
	private GetMemberDetailService getMemberDetailService;
	
	
	@Autowired
	private FindMemberIdPwService findService;
	
	//아이디/ 비밀번호 찾기 화면 가기
		@RequestMapping("/find/findIdPw")  //dto 새로 하나 만들어야함. 확인용 변수만 들어간걸로
		public String findForm() {	
			
			return "/find/findIdPw";

		}
		//아이디찾기 화면가기
		@RequestMapping("/find/findId")  //dto 새로 하나 만들어야함. 확인용 변수만 들어간걸로
			public String findId(MemberDetail memberDetail ) {	
				
				return "/find/findId";

			}
		//아이디 찾기 결과화면
		@PostMapping("/findId")
		public String findId2( @Param("memberName") String memberName, @Param("email") String email,@ModelAttribute("memberDetail") MemberDetail memberDetail, HttpSession session,HttpServletResponse response, Errors errors) {
			System.out.println("name >>> "+ memberDetail.getMemberName());
			System.out.println("email >>> "+ memberDetail.getEmail());
			
			memberName = memberDetail.getMemberName();
			email = memberDetail.getEmail();
			System.out.println("memberName>>>"+memberName);
			
		//	String name = memberDetail.getMemberName();
			//String email = memberDetail.getEmail();
			
			MemberDetail memberId = findService.selectMemberByNameEmail(memberName,email);
			try {
				
				
				if(memberId==null) {
					throw new  MemberNotMatchException();
				}
				Member member =mapper.selectMemberById(memberId.getMemberId());
				if(member.isQuitState()) {
					throw new QuitMemberException();
				}
			
				session.setAttribute("memberId", memberId);  // jsp에 보내주기! 요고 해줘야 jsp 에서 받을수 있당
				ModelAndView mav = new ModelAndView();
				mav.addObject("memberId",memberId);
				mav.setViewName("/find/findIdS");		
				return "/find/findIdS";
			
			}catch (MemberNotMatchException e) {
				errors.reject("memberNotMatchException");
				return"/find/findId";
			}catch(QuitMemberException e) {
				errors.reject("quitMemberException");
				return"/find/findId";
			}
			
			
		
			
		}
		
	
			//비밀번호찾기 화면 가기
		@RequestMapping("/find/findPw")  //dto 새로 하나 만들어야함. 확인용 변수만 들어간걸로
			public String findPw(MemberDetail memberDetail) {	
				
				return "/find/findPw";

			}
			
			//비번찾기 결과화면
			@PostMapping("find/findPwS")
			public String findPw2(
					@Param("memberId") String memberId,
					@Param("memberName") String memberName,
					@Param("email") String email, 
					 @ModelAttribute("memberDetail") MemberDetail memberDetail, 
					HttpSession session,
					HttpServletResponse response, 
					Errors errors) {
				if(errors.hasErrors()) {
					return"/find/findPw";
				}
				
				System.out.println("id >>>" + memberDetail.getMemberId());
				System.out.println("name >>> "+ memberDetail.getMemberName());
				System.out.println("email >>> "+ memberDetail.getEmail());
				
				
				memberId = memberDetail.getMemberId();
				memberName = memberDetail.getMemberName();
				email = memberDetail.getEmail();
		//		System.out.println("memberName>>>"+memberName);
				
			//	String name = memberDetail.getMemberName();
				//String email = memberDetail.getEmail();
				
				MemberDetail memberPwd= findService.selectPwdByIdNameEmail(memberId,memberName,email);
				try {
				
				if(memberPwd==null) {
					throw new  MemberNotMatchException();
				}
				Member member =mapper.selectMemberById(memberId);
				if(member.isQuitState()) {
					throw new QuitMemberException();
				}
				////////////////
				/////////여기서 랜덤비밀번호로 update해서  보내주기
				System.out.println("기존 비밀번호 >> " + memberPwd.getMemberPwd());
				String newPW = randomAlphaWord(5);
				System.out.println("변경할 비밀번호 (랜덤 5 자리 )>> " + newPW );
				modifyService.updateMemberPW(memberId, newPW);
				MemberDetail selMemberDetail =getMemberDetailService.getMemberDetail(memberId);
				System.out.println("변경한 비밀번호 >> " + selMemberDetail.getMemberPwd());		
				session.setAttribute("newPW", newPW);  // jsp에 보내주기! 요고 해줘야 jsp 에서 받을수 있당			
				ModelAndView mav = new ModelAndView();
				mav.addObject("newPW",newPW);
				mav.setViewName("/find/findPwS");
			
				return "/find/findPwS";
				}catch (NullPointerException e) {
					errors.reject("memberNotMatchException");
					return"/find/findPw";
				}catch (MemberNotMatchException e) {
					errors.reject("memberNotMatchException");
					return"/find/findPw";
				}
				
			
				
			}
			public static String randomAlphaWord(int wordLength) {

				Random r = new Random();

				StringBuilder sb = new StringBuilder(wordLength);

				

				for(int i = 0; i < wordLength; i++) {

					char tmp = (char) ('a' + r.nextInt('z' - 'a'));

					

					sb.append(tmp);

				}

				

				return sb.toString();

			}

			
			
			

}
