package proj21_shoes.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import proj21_shoes.dto.Member;
import proj21_shoes.service.GetMemberDetailListService;
import proj21_shoes.service.GetMemberDetailService;
import proj21_shoes.service.ProductPostService;
import proj21_shoes.service.ProductService;
import proj21_shoes.service.RegisterMemberService;

@RestController
public class RestAdminController {
	protected static final Logger logger = LoggerFactory.getLogger(RestAdminController.class);

	/*
	 * @Autowired private ProductService productService;
	 * 
	 * @Autowired private ProductPostService productPostService;
	 * 
	 * @Autowired private GetMemberDetailListService memListService;
	 * 
	 * @Autowired private GetMemberDetailService memDeService;
	 * 
	 * @Autowired private RegisterMemberService memService;
	 * 
	 * @GetMapping("/memberMgt") public ResponseEntity<Object> MemberDetail() {
	 * System.out.println("멤버 리스트"); return
	 * ResponseEntity.ok(memListService.getMemberDetailLists()); }
	 * 
	 * @GetMapping("/memberMgt/{no}") public ResponseEntity<Object>
	 * MemberDetail(@PathVariable int no, HttpServletResponse response) { Member
	 * member = memService.selectByMCode(no); if (member == null) { return
	 * ResponseEntity.status(HttpStatus.NOT_FOUND).build(); } return
	 * ResponseEntity.ok(member); }
	 */

}