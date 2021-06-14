package proj21_shoes.controller;

import java.net.URI;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Category;
import proj21_shoes.dto.Employee;
import proj21_shoes.dto.Image;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.Product;
import proj21_shoes.dto.ProductPost;
import proj21_shoes.exeption.DuplicateMemberException;
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

	@PostMapping("/productMgt")
	public ResponseEntity<Object> newProduct(@RequestBody Product product, ProductPost productPost) {
		System.out.println("newProduct > " + product);		
		
		try {
			product.setMadeDate(LocalDateTime.now());
			URI uri = URI.create("/api/productMgt" + product.getProductCode());
			
			return ResponseEntity.created(uri).body(product.getProductCode());
		} catch (DuplicateMemberException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}

}