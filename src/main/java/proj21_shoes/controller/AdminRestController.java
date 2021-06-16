package proj21_shoes.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shoes.dto.Member;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.Product;
import proj21_shoes.service.GetMemberDetailListService;
import proj21_shoes.service.GetMemberDetailService;
import proj21_shoes.service.ProductPostService;
import proj21_shoes.service.ProductService;
import proj21_shoes.service.RegisterMemberService;

@RestController
@RequestMapping("/api")
public class AdminRestController {
	protected static final Logger logger = LoggerFactory.getLogger(AdminRestController.class);

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductPostService productPostService;

	@Autowired
	private GetMemberDetailListService memListService;

	@Autowired
	private GetMemberDetailService memDeService;

	@Autowired
	private RegisterMemberService memService;

	@GetMapping("/memberMgt")
	public ResponseEntity<Object> MemberDetail() {
		System.out.println("멤버 리스트");

		List<MemberDetail> members = memListService.getMemberDetailLists();

		return ResponseEntity.ok(members);
	}

	@GetMapping("/memberMgt/{no}")
	public ResponseEntity<Object> MemberDetail(@PathVariable int no, HttpServletResponse response) {
		Member member = memService.selectByMCode(no);
		if (member == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(member);
	}

	@GetMapping("/productMgt")
	public ResponseEntity<Object> PorductList() {
		System.out.println("제품 리스트");

		List<Product> products = productService.productByAll();

		return ResponseEntity.ok(products);
	}

	@GetMapping("/productMgt/{no}")
	public ResponseEntity<Object> ProductDetail(@PathVariable int no, HttpServletResponse response) {
		Product productDeatil = productService.productByCode(no);
		if (productDeatil == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(productDeatil);
	}

	/*
	 * @PostMapping("/productMgt/")
	 * 
	 * @Transactional public ResponseEntity<Object> newProduct(HttpServletRequest
	 * request) { try { Product product = new Product();
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
	 * "productCode"))); productpost.setProductMainImage("image.jpg");
	 * productpost.setContent(request.getParameter("content")); List<Image> list =
	 * new ArrayList<Image>(); productpost.setImages(list);
	 * 
	 * System.out.println(product); productService.insertProduct(product);
	 * 
	 * System.out.println(productpost);
	 * productPostService.insertProductPost(productpost);
	 * 
	 * URI uri = URI.create("/api/productMgt/" + product.getProductCode());
	 * 
	 * return ResponseEntity.created(uri).body(product.getProductCode()); } catch
	 * (DuplicateMemberException e) { return
	 * ResponseEntity.status(HttpStatus.CONFLICT).build(); } }
	 */

}