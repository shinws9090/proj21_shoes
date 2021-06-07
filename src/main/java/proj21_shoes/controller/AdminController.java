package proj21_shoes.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.Product;
import proj21_shoes.service.GetMemberDetailListService;
import proj21_shoes.service.ProductService;

@Controller
public class AdminController {
	@Autowired
	private ProductService productService;

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

	@GetMapping("/orderMgt")
	public ModelAndView orderList() {
//		List<Order> order = 
		return new ModelAndView("admin/orderMgt");
	}

//	@RequestMapping(value = "/admin/product/productReg", method = RequestMethod.GET)
//	public String registerProduct() throws Exception {
//		return "admin/product/productReg";
//	}
	
	@GetMapping("/productReg")
	public String registerProduct(Product product) {
//		productService.insertProduct(product);
		return "redirect:/admin/productMgt";
	}

}
