package proj21_shoes.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.Member;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.Product;
import proj21_shoes.service.GetMemberDetailListService;
import proj21_shoes.service.ProductService;

@Controller
public class AdminController {
	@Autowired
	ProductService productService;

	@Autowired
	private GetMemberDetailListService memListService;

//	관리자 페이지 연결용
	@GetMapping("/adminMain")
	public String Admin() {
		return "admin/adminMain";
	}

//	@RequestMapping("/memberMgt")
//	public String list(@ModelAttribute("cmd") Model model) {
//
//		List<MemberDetail> members = memListService.getMemberDetailLists();
//		model.addAttribute("members", members);
//
//		return "admin/memberMgt";
//	}

	@GetMapping("/memberMgt")
	public ModelAndView memberDetailList() {
		List<MemberDetail> members = memListService.getMemberDetailLists();
		return new ModelAndView("admin/memberMgt", "members", members);
	}

	@GetMapping("/productMgt")
	public ModelAndView productList() {
		List<Product> product = productService.productByAll();
		return new ModelAndView("admin/productMgt", "product", product);
	}

}
