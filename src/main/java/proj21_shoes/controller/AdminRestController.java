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

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.Notice;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.Product;
import proj21_shoes.dto.ProductPost;
import proj21_shoes.dto.ReView;
import proj21_shoes.service.GetMemberDetailListService;
import proj21_shoes.service.GetMemberDetailService;
import proj21_shoes.service.MyQnaService;
import proj21_shoes.service.MyReviewService;
import proj21_shoes.service.NoticeService;
import proj21_shoes.service.OrderOptionService;
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

	@Autowired
	MyQnaService myQnaService;

	@Autowired
	NoticeService noticeService;

	@Autowired
	MyReviewService myReviewService;

	@Autowired
	OrderOptionService orderOptionService;

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

		List<Product> products = productService.productByOnlyProuct();

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

	@GetMapping("/productPostMgt")
	public ResponseEntity<Object> PorductPostList() {
		System.out.println("제품 리스트");

		List<ProductPost> productPosts = productPostService.productPostByAll();
		return ResponseEntity.ok(productPosts);
	}

	@GetMapping("/productMod/{no}")
	public ResponseEntity<Object> ProductModify(@PathVariable int no, HttpServletResponse response) {
		Product productModify = productService.productByCode(no);
		if (productModify == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(productModify);
	}
	
	@GetMapping("/orderOption")
	public ResponseEntity<Object> orderOptionList() {

		List<OrderOption> orderOptions = orderOptionService.orderOptionByAllList();
		return ResponseEntity.ok(orderOptions);
	}
	
	@GetMapping("/orderOption/{no}")
	public ResponseEntity<Object> orderOptionList(@PathVariable int no, HttpServletResponse response) {
		List<OrderOption> orderOption = orderOptionService.orderOptionByProductCode(no);
		if (orderOption == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(orderOption);
	}

	@GetMapping("/qnaBoard")
	public ResponseEntity<Object> qnaBoardList() {
		System.out.println("문의게시판");
		List<MyQnaViewCommand> qnaBoard = myQnaService.selectQnAbyAll();
		return ResponseEntity.ok(qnaBoard);
	}

	@GetMapping("/noticeBoard")
	public ResponseEntity<Object> noticeBoardList() {
		System.out.println("문의게시판");
		List<Notice> noticeBoard = noticeService.selectNoticebyAllList();
		return ResponseEntity.ok(noticeBoard);
	}

	@GetMapping("/reviewBoard")
	public ResponseEntity<Object> reviewBoardList() {
		System.out.println("문의게시판");
		List<ReView> reviewBoard = myReviewService.selectReviewbyAllList();
		return ResponseEntity.ok(reviewBoard);
	}

}