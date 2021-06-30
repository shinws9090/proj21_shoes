package proj21_shoes.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.commend.MyReviewCommend;
import proj21_shoes.commend.PageMaker;
import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Category;
import proj21_shoes.dto.Employee;
import proj21_shoes.dto.Image;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.Notice;
import proj21_shoes.dto.OrderOption;
import proj21_shoes.dto.Product;
import proj21_shoes.dto.ProductPost;
import proj21_shoes.service.BrandService;
import proj21_shoes.service.CategoryService;
import proj21_shoes.service.EmployeeService;
import proj21_shoes.service.GetMemberDetailListService;
import proj21_shoes.service.ImageService;
import proj21_shoes.service.MemberService;
import proj21_shoes.service.MyQnaService;
import proj21_shoes.service.MyReviewService;
import proj21_shoes.service.NoticeService;
import proj21_shoes.service.OrderOptionService;
import proj21_shoes.service.ProductPostService;
import proj21_shoes.service.ProductService;

@Controller
public class AdminController {
	protected static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private BrandService brandService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductPostService productPostService;

	@Autowired
	private ImageService imageService;

	@Autowired
	private OrderOptionService orderOptionService;

	@Autowired
	private GetMemberDetailListService memListService;

	@Autowired
	private MyQnaService myQnaService;

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private MyReviewService myReviewService;

	@RequestMapping("/admin/adminMain") // 관리자메인 화면
	public String Admin() {
		logger.info("관리자 페이지 이동");
		return "admin/adminMain";
	}

	@RequestMapping("/admin/memberMgt") // 멤버관리 화면
	public void memberDetailList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		List<Member> memberList = memberService.findAll(scri);
		model.addAttribute("memberList", memberList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(noticeService.countInfoList(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping("/admin/productMgt") // 제품관리 화면
	public ModelAndView productList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/productMgt");
		return mav;
	}

	@RequestMapping("/admin/productDetailMgt") // 제품상세 화면
	public ModelAndView productDetail(@RequestParam(value = "productCode") long productCode) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("productCode", productCode);
		mav.setViewName("admin/product/productDetailMgt");
		return mav;
	}

	@RequestMapping("/admin/orderMgt") // 주문관리 화면
	public ModelAndView orderList() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/orderMgt");

		return mav;
	}

	@RequestMapping("/admin/boardMgt") // 주문관리 화면
	public ModelAndView boardList() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/boardMgt");

		return mav;
	}

	@GetMapping("/admin/product/productReg")
	public void getProductRegister(Model model) {
		System.out.println("상품등록페이지");
		List<Brand> brandList = brandService.brandList();
		model.addAttribute("brandList", JSONArray.fromObject(brandList));

		List<Category> categoryList = categoryService.categoryList();
		model.addAttribute("categoryList", JSONArray.fromObject(categoryList));

		List<Employee> employeeList = employeeService.employeeList();
		model.addAttribute("employeeList", JSONArray.fromObject(employeeList));
	}

	@PostMapping("/admin/product/productReg")
	@Transactional
	public String postProductRegister(MultipartHttpServletRequest request, MultipartFile file)
			throws IOException, Exception {
		System.out.println("상품등록실행");

		Product product = new Product();
		product.setProductCode(Integer.parseInt(request.getParameter("productCode")));
		product.setProductName(request.getParameter("productName"));
		product.setBrand(new Brand(Integer.parseInt(request.getParameter("brand"))));
		product.setGender(request.getParameter("gender"));
		product.setCategory(new Category(Integer.parseInt(request.getParameter("category"))));
		product.setMaterial(request.getParameter("material"));
		product.setSeason(request.getParameter("season"));
		product.setMadeDate(
				LocalDate.parse(request.getParameter("madeDate"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		product.setCostPrice(Integer.parseInt(request.getParameter("costPrice")));
		product.setSellPrice(Integer.parseInt(request.getParameter("sellPrice")));
		product.setRegistDate(
				LocalDate.parse(request.getParameter("registDate"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		product.setCumulativeRegistCount(Integer.parseInt(request.getParameter("cumulativeRegistCount")));
		product.setCumulativeSellCount(Integer.parseInt(request.getParameter("cumulativeSellCount")));
		product.setEmployee(new Employee(Integer.parseInt(request.getParameter("employee"))));

		System.out.println(product);
		productService.insertProduct(product);

		ProductPost productpost = new ProductPost();
		productpost.setProductCode(Integer.parseInt(request.getParameter("productCode")));
		productpost.setContent(request.getParameter("content"));

		String pathMainImage = request.getSession().getServletContext().getRealPath("/") + "images/";
		MultipartFile mf = request.getFile("productMainImage");
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + mf.getOriginalFilename();
		File savedFile = new File(pathMainImage + savedName);
		mf.transferTo(savedFile);
		productpost.setProductMainImage(savedName);

		System.out.println(productpost);
		productPostService.insertProductPost(productpost);

		System.out.println("메인이미지 등록");

		Image image = new Image();
		image.setProductCode(Integer.parseInt(request.getParameter("productCode")));

		String imageFolder = request.getParameter("productCode");
		System.out.println("imageFolder : " + imageFolder);

		String pathImages = request.getSession().getServletContext().getRealPath("/") + "images/" + imageFolder + "/";
		System.out.println("pathImages : " + pathImages);

		MultipartFile mfs = request.getFile("images");
		String savedNames = uuid.toString() + "_" + mfs.getOriginalFilename();
		File savedFiles = new File(pathImages + savedNames);
		mfs.transferTo(savedFiles);
		image.setImage(savedNames);

		System.out.println(image);
		imageService.insertImage(image);

		return "redirect:/admin/productMgt";
	}

	@GetMapping("/admin/product/productPostReg")
	public void getProductPostRegister(Model model) {
		System.out.println("상품판매글등록페이지");

		List<Product> productList = productService.productByOnlyProuct();
		model.addAttribute("productList", JSONArray.fromObject(productList));

	}

	@GetMapping("/admin/product/productMod")
	public void productModify(@RequestParam(value = "productCode") int productCode, Model model) {
		Product products = productService.productByCode(productCode);
		model.addAttribute("products", products);

		List<Brand> brandList = brandService.brandList();
		model.addAttribute("brandList", JSONArray.fromObject(brandList));

		List<Category> categoryList = categoryService.categoryList();
		model.addAttribute("categoryList", JSONArray.fromObject(categoryList));

		List<Employee> employeeList = employeeService.employeeList();
		model.addAttribute("employeeList", JSONArray.fromObject(employeeList));

	}

	@PostMapping("/admin/product/productMod")
	@Transactional
	public String postProductModify(HttpServletRequest request) throws Exception, IOException {
		System.out.println("상품수정실행");

		Product product = new Product();
		product.setProductCode(Integer.parseInt(request.getParameter("productCode")));
		product.setProductName(request.getParameter("productName"));
		product.setBrand(new Brand(Integer.parseInt(request.getParameter("brand"))));
		product.setGender(request.getParameter("gender"));
		product.setCategory(new Category(Integer.parseInt(request.getParameter("category"))));
		product.setMaterial(request.getParameter("material"));
		product.setSeason(request.getParameter("season"));
		product.setMadeDate(
				LocalDate.parse(request.getParameter("madeDate"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		product.setCostPrice(Integer.parseInt(request.getParameter("costPrice")));
		product.setSellPrice(Integer.parseInt(request.getParameter("sellPrice")));
		product.setRegistDate(
				LocalDate.parse(request.getParameter("registDate"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		product.setCumulativeRegistCount(Integer.parseInt(request.getParameter("cumulativeRegistCount")));
		product.setCumulativeSellCount(Integer.parseInt(request.getParameter("cumulativeSellCount")));
		product.setEmployee(new Employee(Integer.parseInt(request.getParameter("employee"))));

		productService.updateProduct(product);
		System.out.println(product);

		ProductPost productPost = new ProductPost();
		productPost.setProductCode(Integer.parseInt(request.getParameter("productCode")));
		productPost.setContent(request.getParameter("content"));

		productPostService.updateProductPostContent(productPost);
		System.out.println(productPost);
		;

		return "redirect:/admin/productMgt";
	}

	@GetMapping("/admin/product/productImageMod")
	public void productImageModify(@RequestParam(value = "productCode") int productCode, Model model) {
		Product products = productService.productByCode(productCode);
		model.addAttribute("products", products);

		List<Brand> brandList = brandService.brandList();
		model.addAttribute("brandList", JSONArray.fromObject(brandList));

		List<Category> categoryList = categoryService.categoryList();
		model.addAttribute("categoryList", JSONArray.fromObject(categoryList));

		List<Employee> employeeList = employeeService.employeeList();
		model.addAttribute("employeeList", JSONArray.fromObject(employeeList));

	}

	@PostMapping("/admin/product/productImageMod")
	@Transactional
	public String postProductImageModify(MultipartHttpServletRequest request, MultipartFile file)
			throws Exception, IOException {
		System.out.println("상품수정실행");

		Product product = new Product();
		product.setProductCode(Integer.parseInt(request.getParameter("productCode")));

		product.setRegistDate(
				LocalDate.parse(request.getParameter("registDate"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));

		product.setEmployee(new Employee(Integer.parseInt(request.getParameter("employee"))));

		productService.updateProductRegDateEmp(product);
		System.out.println(product);

		ProductPost productpost = new ProductPost();
		productpost.setProductCode(Integer.parseInt(request.getParameter("productCode")));

		String pathMainImage = request.getSession().getServletContext().getRealPath("/") + "images/";
		MultipartFile mf = request.getFile("productMainImage");
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + mf.getOriginalFilename();
		File savedFile = new File(pathMainImage + savedName);
		mf.transferTo(savedFile);
		productpost.setProductMainImage(savedName);

		productPostService.updateProductPostImage(productpost);
		System.out.println(productpost);

		Image image = new Image();
		image.setProductCode(Integer.parseInt(request.getParameter("productCode")));

		String imageFolder = request.getParameter("productCode");
		System.out.println("imageFolder : " + imageFolder);

		String pathImages = request.getSession().getServletContext().getRealPath("/") + "images/" + imageFolder + "/";
		System.out.println("pathImages : " + pathImages);

		MultipartFile mfs = request.getFile("images");
		String savedNames = uuid.toString() + "_" + mfs.getOriginalFilename();
		File savedFiles = new File(pathImages + savedNames);
		mfs.transferTo(savedFiles);
		image.setImage(savedNames);

		System.out.println(image);
		imageService.updateImage(image);

		return "redirect:/admin/productMgt";
	}

	@GetMapping("/admin/product/productDel")
	public String productDelete(@RequestParam(value = "productCode") int productCode) {
		productService.deleteProduct(productCode);
		return "redirect:/admin/productMgt";
	}

	@GetMapping("/admin/product/productOrderOption")
	public void productOrderOptionRegister(@RequestParam(value = "productCode") int productCode, Model model) {
		Product products = productService.productByCode(productCode);
		model.addAttribute("products", products);

		List<OrderOption> orderOptionListByProductCode = orderOptionService.orderOptionByProductCode(productCode);
		model.addAttribute("orderOptionListByProductCode", JSONArray.fromObject(orderOptionListByProductCode));

	}

	@PostMapping("/admin/product/productOrderOption")
	public String postProductOrderOptionRegister(HttpServletRequest request) {

		OrderOption orderOption = new OrderOption();

		orderOption.setProductCode(Integer.parseInt(request.getParameter("productCode")));
		orderOption.setStyleCode(Integer.parseInt(request.getParameter("styleCode")));
		orderOption.setSize(Integer.parseInt(request.getParameter("size")));
		orderOption.setStock(Integer.parseInt(request.getParameter("stock")));
		orderOption.setColor(request.getParameter("color"));
		orderOptionService.insertOrderOption(orderOption);

		return "redirect:/admin/product/productOrderOption?productCode="
				+ Integer.parseInt(request.getParameter("productCode"));
	}

	@GetMapping("/admin/product/productOrderOptionMod")
	public void productOrderOptionModify(@RequestParam(value = "productCode") int productCode, Model model) {
		Product products = productService.productByCode(productCode);
		model.addAttribute("products", products);

		List<OrderOption> orderOptionListByProductCode = orderOptionService.orderOptionByProductCode(productCode);
		model.addAttribute("orderOptionListByProductCode", JSONArray.fromObject(orderOptionListByProductCode));
	}

	@PostMapping("/admin/product/productOrderOptionMod")
	public String postProductOrderOptionModify(HttpServletRequest request) {

		OrderOption orderOption = new OrderOption();
		orderOption.setProductCode(Integer.parseInt(request.getParameter("productCode")));
		orderOption.setStyleCode(Integer.parseInt(request.getParameter("styleCode")));
		orderOption.setSize(Integer.parseInt(request.getParameter("size")));
		orderOption.setStock(Integer.parseInt(request.getParameter("stock")));
		orderOption.setColor(request.getParameter("color"));
		orderOptionService.updateOrderOption(orderOption);

		return "redirect:/admin/product/productOrderOption?productCode="
				+ Integer.parseInt(request.getParameter("productCode"));
	}

	@GetMapping("/admin/product/productOrderOptionDel")
	public String productOrderOptionDelete(HttpServletRequest request) {

		OrderOption orderOption = new OrderOption();
		orderOption.setProductCode(Integer.parseInt(request.getParameter("productCode")));
		orderOption.setStyleCode(Integer.parseInt(request.getParameter("styleCode")));
		orderOption.setSize(Integer.parseInt(request.getParameter("size")));
		orderOption.setColor(request.getParameter("color"));

		orderOptionService.deleteOrderOption(orderOption);

		return "redirect:/admin/product/productOrderOption?productCode="
				+ Integer.parseInt(request.getParameter("productCode"));
	}

	@GetMapping("/admin/product/brandReg")
	public void getBrandRegister(Model model) {
		List<Brand> brandList = brandService.brandList();
		model.addAttribute("brandList", JSONArray.fromObject(brandList));
	}

	@PostMapping("/admin/product/brandReg")
	public String postBrandRegister(HttpServletRequest request) {

		Brand brand = new Brand();
		brand.setBrandCode(Integer.parseInt(request.getParameter("brandCode")));
		brand.setBrandName(request.getParameter("brandName"));
		brand.setBrandEngName(request.getParameter("brandEngName"));

		brandService.insertBrand(brand);
		System.out.println(brand);

		return "redirect:/admin/product/brandReg";
	}

	@GetMapping("/admin/product/brandMod")
	public void getBrandModify(Model model) {
		List<Brand> brandList = brandService.brandList();
		model.addAttribute("brandList", JSONArray.fromObject(brandList));
	}

	@PostMapping("/admin/product/brandMod")
	public String postBrandModify(HttpServletRequest request) {

		Brand brand = new Brand();
		brand.setBrandCode(Integer.parseInt(request.getParameter("brandCode")));
		brand.setBrandName(request.getParameter("brandName"));
		brand.setBrandEngName(request.getParameter("brandEngName"));

		brandService.updateBrand(brand);
		System.out.println(brand);

		return "redirect:/admin/product/brandReg";
	}

	@GetMapping("/admin/product/brandDel")
	public String getBrandDelete(@RequestParam(value = "brandCode") int brandCode) {
		try {
			brandService.deleteBrand(brandCode);
			System.out.println("브랜드 삭제");
		} catch (DataIntegrityViolationException e) {
			System.out.println("외래키 에러");
		}
		return "redirect:/admin/product/brandReg";
	}

	@GetMapping("/admin/product/categoryReg")
	public void getCategoryRegister(Model model) {
		List<Category> categoryList = categoryService.categoryList();
		model.addAttribute("categoryList", JSONArray.fromObject(categoryList));
	}

	@PostMapping("/admin/product/categoryReg")
	public String postCategoryRegister(HttpServletRequest request) {

		Category category = new Category();
		category.setProductCategoryCode(Integer.parseInt(request.getParameter("productCategoryCode")));
		category.setCategory(request.getParameter("category"));

		categoryService.insertCategory(category);
		System.out.println(category);

		return "redirect:/admin/product/categoryReg";
	}

	@GetMapping("/admin/product/categoryMod")
	public void getCategoryModify(Model model) {
		List<Category> categoryList = categoryService.categoryList();
		model.addAttribute("categoryList", JSONArray.fromObject(categoryList));
	}

	@PostMapping("/admin/product/categoryMod")
	public String postCategoryModify(HttpServletRequest request) {

		Category category = new Category();
		category.setProductCategoryCode(Integer.parseInt(request.getParameter("productCategoryCode")));
		category.setCategory(request.getParameter("category"));

		categoryService.updateCategory(category);
		System.out.println(category);

		return "redirect:/admin/product/categoryReg";
	}

	@GetMapping("/admin/product/categoryDel")
	public String getCategoryDelete(@RequestParam(value = "categoryCode") int categoryCode) {
		try {
			categoryService.deleteCategory(categoryCode);
			System.out.println("카테고리 삭제");
		} catch (DataIntegrityViolationException e) {
			System.out.println("외래키 에러");
		}
		return "redirect:/admin/product/categoryReg";
	}

	// 게시판 관리
	@GetMapping("/admin/board/notice")
	public void noticeBoardAdminMain(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		List<Notice> noticeList = noticeService.findAll(scri);
		model.addAttribute("noticeList", noticeList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(noticeService.countInfoList(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	@GetMapping("/admin/board/mainNotice")
	public void noticeBoardMain(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		List<Notice> noticeList = noticeService.findAll(scri);
		model.addAttribute("noticeList", noticeList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(noticeService.countInfoList(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	@GetMapping("/admin/board/mainNoticeDetail")
	public void noticeBoardMainDetail(Model model, @RequestParam(value = "boardCode") int boardCode) throws Exception {
		Notice noticeView = noticeService.detailView(boardCode);
		model.addAttribute("noticeView", noticeView);
	}

	@GetMapping("/admin/board/qna")
	public void myQnaBoardList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		List<MyQnaViewCommand> qnaList = myQnaService.findAll(scri);
		model.addAttribute("qnaList", qnaList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(myQnaService.countInfoList(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	@GetMapping("/admin/board/review")
	public void reviewBoardList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		List<MyReviewCommend> reviewList = myReviewService.findAll(scri);
		model.addAttribute("reviewList", reviewList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(myQnaService.countInfoList(scri));
		model.addAttribute("pageMaker", pageMaker);
	}
}