package proj21_shoes.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javafx.util.converter.LocalDateTimeStringConverter;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Category;
import proj21_shoes.dto.Employee;
import proj21_shoes.dto.Image;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.Product;
import proj21_shoes.dto.ProductPost;
import proj21_shoes.service.GetMemberDetailListService;
import proj21_shoes.service.ProductPostService;
import proj21_shoes.service.ProductService;

@Controller
public class AdminController {
	protected static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductPostService productPostService;

	@Autowired
	private GetMemberDetailListService memListService;

//	관리자 페이지 연결용
	@RequestMapping("/adminMain")
	public String Admin() {
		logger.info("관리자 페이지 이동");
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

	@RequestMapping("/memberMgt")
	public ModelAndView memberDetailList() {
		List<MemberDetail> members = memListService.getMemberDetailLists();
		return new ModelAndView("admin/memberMgt", "members", members);
	}

	@RequestMapping("/productMgt")
	public ModelAndView productList() {
		List<Product> product = productService.productByAll();
		return new ModelAndView("admin/productMgt", "product", product);
	}

	@RequestMapping("/orderMgt")
	public ModelAndView orderList() {
//		List<Order> order = 
		return new ModelAndView("admin/orderMgt");
	}

	@GetMapping("/viewProductReg")
	public String viewRegisterProduct(Product product) {
		logger.info("상품 등록 페이지 접속");

		return "admin/product/productReg";
	}

	/*
	 * @PostMapping("/productReg")
	 * 
	 * @ResponseBody public String registerProduct(@RequestBody Product product) {
	 * 
	 * System.out.println(product); productService.insertProduct(product);
	 * 
	 * return "redirect:productMgt"; }
	 */

	@PostMapping("/productReg")
	@Transactional
	public String registerProduct(HttpServletRequest request) {

//		Product newProduct = new Product(product.getProductCode(), product.getProductName(), product.getBrand(),
//				product.getGender(), product.getCategory(), product.getMaterial(), product.getSeason(),
//				product.getMadeDate(), product.getCostPrice(), product.getSellPrice(), product.getRegistDate(),
//				product.getCumulativeRegistCount(), product.getCumulativeSellCount(), product.getEmployee());

		Product product = new Product();
		product.setProductCode(Integer.parseInt(request.getParameter("productCode")));
		product.setProductName(request.getParameter("productName"));
		product.setBrand(new Brand(Integer.parseInt(request.getParameter("brand"))));
		product.setGender(request.getParameter("gender"));
		product.setCategory(new Category(Integer.parseInt(request.getParameter("category"))));
		product.setMaterial(request.getParameter("material"));
		product.setSeason(request.getParameter("season"));
		product.setMadeDate(LocalDateTime.now());
		product.setCostPrice(Integer.parseInt(request.getParameter("costPrice")));
		product.setSellPrice(Integer.parseInt(request.getParameter("sellPrice")));
		product.setRegistDate(LocalDateTime.now());
		product.setEmployee(new Employee(Integer.parseInt(request.getParameter("employee"))));

		ProductPost productpost = new ProductPost();
		productpost.setProductCode(Integer.parseInt(request.getParameter("productCode")));
		productpost.setProductMainImage(new byte[12]);
		productpost.setContent(request.getParameter("content"));
		List<Image> list = new ArrayList<Image>();
		productpost.setImages(list);

//		System.out.println(newProduct);
		System.out.println(product);
		System.out.println(productpost);

//		productService.insertProduct(newProduct);
		productService.insertProduct(product);
		productPostService.insertProductPost(productpost);

		return "redirect:productMgt";
	}

}
