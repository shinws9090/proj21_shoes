package proj21_shoes.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.Product;
import proj21_shoes.dto.ProductPost;
import proj21_shoes.service.GetMemberDetailListService;
import proj21_shoes.service.ProductPostService;
import proj21_shoes.service.ProductService;

@Controller
public class AdminController {
	@Autowired
	private ProductService productService;

	@Autowired
	private ProductPostService productPostService;

	@Autowired
	private GetMemberDetailListService memListService;

//	관리자 페이지 연결용
	@RequestMapping("/adminMain")
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
		return "admin/product/productReg";
	}

//	@GetMapping("/productReg")
//	public ModelAndView registerProduct(Product product) {
//		productService.insertProduct(product);
//		
//		return new ModelAndView("admin/productMgt");
//	}

//	@PostMapping("/productReg")
//	@Transactional
//	public String registerProduct(HttpServletRequest request) {
//
//		Product product = new Product();
//		product.setProductCode(Integer.parseInt(request.getParameter("productCode")));
//		product.setProductName(request.getParameter("productName"));
//		product.setBrand(new Brand(Integer.parseInt(request.getParameter("brandCode"))));
//		product.setGender(request.getParameter("gender"));
//		product.setCategory(new Category(Integer.parseInt(request.getParameter("category"))));
//		product.setMaterial(request.getParameter("material"));
//		product.setSeason(request.getParameter("season"));
//		product.setMadeDate(LocalDateTime.now());
//		product.setCostPrice(Integer.parseInt(request.getParameter("costPrice")));
//		product.setSellPrice(Integer.parseInt(request.getParameter("sellPrice")));
//		product.setRegistDate(LocalDateTime.now());
//		product.setEmployee(new Employee(Integer.parseInt(request.getParameter("employee"))));
//
//		ProductPost productpost = new ProductPost();
//		productpost.setProductCode(Integer.parseInt(request.getParameter("productCode")));
//		productpost.setProductMainImage(new byte[12]);
//		productpost.setContent(request.getParameter("content"));
//		List<Image> list = new ArrayList<Image>();
//		productpost.setImages(list);
//
//		System.out.println(product);
//		System.out.println(productpost);
//
//		productService.insertProduct(product);
//		productPostService.insertProductPost(productpost);
//
//		return "admin/productMgt";
//	}

	@PostMapping("/productReg")
	public String registerProduct(@Valid Product regProduct) {

		Product newProduct = new Product(regProduct.getProductCode(), regProduct.getProductName(),
				regProduct.getBrand(), regProduct.getGender(), regProduct.getCategory(), regProduct.getMaterial(),
				regProduct.getSeason(), regProduct.getMadeDate(), regProduct.getCostPrice(), regProduct.getSellPrice(),
				regProduct.getRegistDate(), regProduct.getCumulativeRegistCount(), regProduct.getCumulativeSellCount(), regProduct.getEmployee());

//		regProductpost.getProductCode();
//		regProductpost.getProductMainImage();
//		regProductpost.getContent();
//		regProductpost.getImages();

		System.out.println(newProduct);
//		System.out.println(regProductpost);

		productService.insertProduct(newProduct);//		productPostService.insertProductPost(regProductpost);
//
//		model.addAttribute(regProduct);
//		model.addAttribute(regProductpost);
//		
		return "admin/productMgt";
	}

}
