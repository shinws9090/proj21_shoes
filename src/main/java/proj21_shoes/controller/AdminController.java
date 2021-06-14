package proj21_shoes.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Category;
import proj21_shoes.dto.Employee;
import proj21_shoes.dto.Image;
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

	@RequestMapping("/memberMgt")
	public ModelAndView memberDetailList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/memberMgt");
		return mav;
	}

	@RequestMapping("/productMgt")
	public ModelAndView productList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/productMgt");
		return mav;
	}

	@RequestMapping("/read")
	public ModelAndView productDetail(@RequestParam(value = "productCode") long productCode) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("productCode", productCode);
		mav.setViewName("admin/productDetailMgt");
		return mav;
	}

	@RequestMapping("/orderMgt")
	public ModelAndView orderList() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/orderMgt");

		return mav;
	}

//	@GetMapping("/viewProductReg")
//	public String viewRegisterProduct(Product product) {
//		logger.info("상품 등록 페이지 접속");
//
//		return "admin/product/productReg";
//	}

	@RequestMapping("/viewProductReg")
	public ModelAndView productReg() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/product/productReg");
		return mav;
	}

	/*
	 * @PostMapping("/productReg")
	 * 
	 * @Transactional public String registProduct( @RequestBody Product product,
	 * HttpServletRequest request) {
	 * 
	 * 
	 * logger.info("등록되나요?"); System.out.println(regProduct.getProductCode());
	 * regProduct.setMadeDate(LocalDateTime.now());
	 * regProduct.setRegistDate(LocalDateTime.now()); regProduct.getMadeDate();
	 * regProduct.getRegistDate();
	 * 
	 * Product product = new Product(regProduct.getProductCode(),
	 * regProduct.getProductName(), regProduct.getBrand(), regProduct.getGender(),
	 * regProduct.getCategory(), regProduct.getMaterial(), regProduct.getSeason(),
	 * regProduct.getMadeDate(), regProduct.getCostPrice(),
	 * regProduct.getSellPrice(), regProduct.getRegistDate(),
	 * regProduct.getCumulativeRegistCount(), regProduct.getCumulativeSellCount(),
	 * regProduct.getEmployee());
	 * 
	 * productService.insertProduct(product);
	 * 
	 * return "/admin/product/productReg";
	 * 
	 * 
	 * Product product = new Product();
	 * product.setProductCode(Integer.parseInt(request.getParameter("productCode")))
	 * ; product.setProductName(request.getParameter("productName"));
	 * product.setBrand(new Brand(Integer.parseInt(request.getParameter("brand"))));
	 * product.setGender(request.getParameter("gender")); product.setCategory(new
	 * Category(Integer.parseInt(request.getParameter("category"))));
	 * product.setMaterial(request.getParameter("material"));
	 * product.setSeason(request.getParameter("season"));
	 * product.setMadeDate(LocalDateTime.now());
	 * product.setCostPrice(Integer.parseInt(request.getParameter("costPrice")));
	 * product.setSellPrice(Integer.parseInt(request.getParameter("sellPrice")));
	 * product.setRegistDate(LocalDateTime.now()); product.setEmployee(new
	 * Employee(Integer.parseInt(request.getParameter("employee"))));
	 * 
	 * ProductPost productpost = new ProductPost();
	 * productpost.setProductCode(Integer.parseInt(request.getParameter(
	 * "productCode"))); // productpost.setProductMainImage(new byte[12]);
	 * productpost.setContent(request.getParameter("content")); List<Image> list =
	 * new ArrayList<Image>(); productpost.setImages(list);
	 * 
	 * System.out.println(product); productService.insertProduct(product);
	 * 
	 * System.out.println(productpost);
	 * productPostService.insertProductPost(productpost);
	 * 
	 * return "redirect:productMgt";
	 * 
	 * }
	 */

	@RequestMapping("/viewProductMod")
	public ModelAndView productMod() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/product/productMod");
		return mav;
	}

}