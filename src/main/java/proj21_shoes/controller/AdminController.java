package proj21_shoes.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Category;
import proj21_shoes.dto.Employee;
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

	@GetMapping("/viewProductReg")
	public ModelAndView viewRegisterProduct() {
		return new ModelAndView("admin/product/productReg");
	}

//	@GetMapping("/productReg")
//	public ModelAndView registerProduct(Product product) {
//		productService.insertProduct(product);
//		
//		return new ModelAndView("admin/productMgt");
//	}

	@RequestMapping(value = "/productReg", method = RequestMethod.GET)
	
	public String registerProduct(HttpServletRequest request) {

		
		
		Product product = new Product();
		product.setProductCode(Integer.parseInt(request.getParameter("productCode")));
		product.setProductName(request.getParameter("productName"));
		product.setBrand(new Brand(Integer.parseInt(request.getParameter("brandCode"))));
		product.setGender(request.getParameter("gender"));
		product.setCategory(new Category(Integer.parseInt(request.getParameter("category"))));
		product.setMaterial(request.getParameter("material"));
		product.setSeason(request.getParameter("season"));
		product.setMadeDate(LocalDateTime.now());
		product.setCostPrice(Integer.parseInt(request.getParameter("costPrice")));
		product.setSellPrice(Integer.parseInt(request.getParameter("sellPrice")));
		product.setRegistDate(LocalDateTime.now());
		product.setEmployee(new Employee(Integer.parseInt(request.getParameter("employee"))));

		System.out.println(product);

		productService.insertProduct(product);

		return "admin/productMgt";
	}
}
