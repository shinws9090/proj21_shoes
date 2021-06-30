package proj21_shoes.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import proj21_shoes.dto.Member;
import proj21_shoes.dto.Order;
import proj21_shoes.dto.Product;
import proj21_shoes.dto.ReView;
import proj21_shoes.dto.ReviewImage;
import proj21_shoes.service.ProductReviewService;
import proj21_shoes.service.ProductService;

@RestController
public class ProductDetailReviewController {

	@Autowired
	private ProductReviewService rService;
	@Autowired
	private ProductService service;

	@GetMapping("/ProductReviewDetail/{boardCode}")
	public ModelAndView myProductReviewDetail(@PathVariable("boardCode") int boardCode, HttpSession session,
			HttpServletResponse response) {
		System.out.println("boardCode>>" + boardCode);
		ReView reView = rService.selectReviewbyBoardCode(boardCode);

		if (reView == null) {
			System.out.println("리스트 없");

		}
		Product product = service.productByCode(reView.getProductCode());
		
		ModelAndView mav = new ModelAndView("/product/ProductReviewDetail");
		mav.addObject("reView", reView);
		mav.addObject("product", product);
		System.out.println(reView);

		return mav;
	}

	@GetMapping("/ProductReviewInsertAndUpdateForm/{productCode},{commend},{boardCode}")
	public ModelAndView ProductReviewInsertAndUpdateForm(
			@PathVariable int productCode, 
			@PathVariable int boardCode,
			@PathVariable String commend, 
			HttpSession session,
			HttpServletResponse response) throws IOException {
		Member member = (Member) session.getAttribute("sessionMember");
		if (member == null) {
			return new ModelAndView("redirect:/login/loginForm");
		}
		List<Integer> orderCode = rService.selectOrderCode(member.getMemberCode(), productCode);
		if(orderCode.size()==0) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주문정보가 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}
		ModelAndView mav = new ModelAndView("/product/productReviewRegist", "orderCode", orderCode.get(0));
		mav.addObject("commend", commend);
		mav.addObject("boardCode", boardCode);
		mav.addObject("productCode", productCode);
		if (commend.equals("update")) {
			mav.addObject("reView", rService.selectReviewbyBoardCode(boardCode));
		}
		return mav;
	}

	@PostMapping("/productReviewRegist")
	public ModelAndView ProductReviewInsertAndUpdate(ReView reView, @RequestParam(value = "commend") String commend,
			@RequestParam(value = "orderNum") int orderNum,
			HttpSession session, MultipartHttpServletRequest request) {
		Member member = (Member) session.getAttribute("sessionMember");
		if (member == null) {
			return new ModelAndView("redirect:/login/loginForm");
		}
		ReviewImage image = new ReviewImage();

		
		reView.setOrderCode(new Order(orderNum));
		System.out.println(reView);
		if (commend.equals("insert")) {
			rService.productReviewInsert(reView);
		} else if (commend.equals("update")) {
			rService.productReviewUpdate(reView);
		}

		// 파일 start

		image.setBoardCode(reView.getBoardCode());

		String imageFolder = "reView\\" + image.getBoardCode();
		System.out.println("imageFolder : " + imageFolder);

		String pathImages = request.getSession().getServletContext().getRealPath("/") + "images\\" + imageFolder + "\\";
		System.out.println("pathImages : " + pathImages);
		try {

			List<MultipartFile> mfsList = request.getFiles("filename[]");
			for (MultipartFile mfs : mfsList) {

				String savedNames = mfs.getOriginalFilename();
				File savedir = new File(pathImages);
				File savedFiles = new File(pathImages + savedNames);
				if (!savedir.exists()) {

					savedir.mkdir();
//					System.out.println("폴더를 생성합니다.");
//					System.out.println("폴더가 존재하는지 체크 true/false : " + savedir.exists());
					savedFiles = new File(pathImages + savedNames);
					mfs.transferTo(savedFiles);
				} else {
//					System.out.println("이미 해당 폴더가 존재합니다.");
					savedFiles = new File(pathImages + savedNames);
					mfs.transferTo(savedFiles);
				}
				image.setImage(savedNames);
				System.out.println("pathImages+++ : " + pathImages + savedNames);
				System.out.println("image>>>" + image);
				rService.imageInsert(image);
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		// 파일 end

		return new ModelAndView("redirect:/productDetail/" + reView.getProductCode());
	}

	@GetMapping("ProductReviewDelete/{boardCode},{productCode}")
	public ModelAndView ProductReviewdelet(@PathVariable int boardCode, @PathVariable int productCode) {
		rService.productReviewDelete(boardCode);
		rService.imageDelete(boardCode);
		return new ModelAndView("redirect:/productDetail/" + productCode);
	}
}
