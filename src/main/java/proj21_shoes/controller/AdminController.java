package proj21_shoes.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Category;
import proj21_shoes.dto.Employee;
import proj21_shoes.dto.Product;
import proj21_shoes.service.BrandService;
import proj21_shoes.service.CategoryService;
import proj21_shoes.service.EmployeeService;
import proj21_shoes.service.GetMemberDetailListService;
import proj21_shoes.service.ProductPostService;
import proj21_shoes.service.ProductService;

@Controller
public class AdminController {
	protected static final Logger logger = LoggerFactory.getLogger(AdminController.class);

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
	private GetMemberDetailListService memListService;

	@RequestMapping("/admin/adminMain") // 관리자메인 화면
	public String Admin() {
		logger.info("관리자 페이지 이동");
		return "admin/adminMain";
	}

	@RequestMapping("/admin/memberMgt") // 멤버관리 화면
	public ModelAndView memberDetailList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/memberMgt");
		return mav;
	}

	@RequestMapping("/admin/productMgt") // 제품관리 화면
	public ModelAndView productList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/productMgt");
		return mav;
	}

	/*
	 * @RequestMapping("/viewProductReg") // 제품등록 화면 public ModelAndView
	 * productReg() { ModelAndView mav = new ModelAndView();
	 * mav.setViewName("/admin/product/productReg"); return mav; }
	 */

	@RequestMapping("/admin/read")
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
	public String postProductRegister(HttpServletRequest request, MultipartFile file) {
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

		return "redirect:/admin/productMgt";
	}

	@GetMapping("/admin/product/productPostReg")
	public void getProductPostRegister(Model model) {
		System.out.println("상품판매글등록페이지");

		List<Product> productList = productService.productByOnlyProuct();
		model.addAttribute("productList", JSONArray.fromObject(productList));

	}

	/*
	 * @PostMapping("/productReg")
	 * 
	 * public String newProduct(HttpServletRequest request, MultipartFile file)
	 * throws IOException, Exception {
	 * System.out.println(Integer.parseInt(request.getParameter("productCode")));
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
	 * product.setRegistDate(LocalDateTime.now());
	 * product.setCumulativeRegistCount(Integer.parseInt(request.getParameter(
	 * "cumulativeRegistCount")));
	 * product.setCumulativeSellCount(Integer.parseInt(request.getParameter(
	 * "cumulativeSellCount"))); product.setEmployee(new
	 * Employee(Integer.parseInt(request.getParameter("employee"))));
	 * 
	 * ProductPost productpost = new ProductPost();
	 * productpost.setProductCode(Integer.parseInt(request.getParameter(
	 * "productCode")));
	 * productpost.setProductMainImage(request.getParameter("productMainImage"));
	 * productpost.setContent(request.getParameter("content"));
	 * 
	 * String uploadPath =
	 * "C:\\workspace_web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\proj21_shoes\\";
	 * 
	 * String imgUploadPath = uploadPath + File.separator + "imgUpload"; String
	 * ymdPath = UploadFileUtils.calcPath(imgUploadPath); String fileName = null;
	 * 
	 * if (file != null) { fileName = UploadFileUtils.fileUpload(imgUploadPath,
	 * file.getOriginalFilename(), file.getBytes(), ymdPath); } else { fileName =
	 * uploadPath + File.separator + "images" + File.separator + "none.png"; }
	 * 
	 * productpost.setProductMainImage(File.separator + "imgUpload" + ymdPath +
	 * File.separator + fileName);
	 * 
	 * List<Image> list = new ArrayList<Image>(); productpost.setImages(list);
	 * 
	 * System.out.println(product); productService.insertProduct(product);
	 * 
	 * System.out.println(productpost);
	 * productPostService.insertProductPost(productpost);
	 * 
	 * return "redirect:productMgt"; }
	 */

	@RequestMapping("/viewProductMod")
	public ModelAndView productMod() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/product/productMod");
		return mav;
	}

}