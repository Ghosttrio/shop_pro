package com.spring.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shop.dto.ManagerDTO;
import com.spring.shop.service.ManagerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired
	public ManagerService managerService;
	@Autowired
	public ManagerDTO managerDTO;
	
//	메인화면
	@GetMapping("/main")
	public String home(Model model, HttpSession session){
		System.out.println("메인 출력");
		
		
		
		List product_type = managerService.selectProduct_type();
		model.addAttribute("product_type",product_type);
		
		
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		
		
		
//		전체 상품 정보 출력
		List productList_all = managerService.selectProduct();
		model.addAttribute("productList_all",productList_all);
		
//		랭킹 출력
		List product_ranking = managerService.product_ranking();
		model.addAttribute("product_ranking",product_ranking);
		
		
		
		
		
		return "main/main";
	}
	
//	로그인
	@GetMapping("/login")
	public String login(){
		System.out.println("로그인 출력");
		return "login/login";
	}
	
//	회원가입
	@GetMapping("/signup")
	public String signup(){
		System.out.println("회원가입 출력");
		return "signup/signup";
	}
	
//	관리자페이지
	@GetMapping("/manager")
	public String manager_main(Model model){
		System.out.println("관리자페이지 메인 출력");	
		List productList = managerService.selectProduct();
		model.addAttribute("productList",productList);
		
		return "manager/manager";
	}
	 
//	관리자페이지 상품 추가
	@GetMapping("/add")
	public String manager_add(){
		System.out.println("관리자페이지 추가창 출력");
		return "manager/add";
	}
	
//	관리자페이지 상품 수정
	@GetMapping("/update")
	public String manager_update(Model model,
			@RequestParam("product_code") String product_code){
		System.out.println("관리자페이지 수정창 출력");
		
		List productList = managerService.selectProduct_update(product_code);
		model.addAttribute("productList",productList);
		return "manager/update";
	}

//	마이페이지(계정마다 출력)
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session){
		System.out.println("마이페이지 출력");
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		return "mypage/mypage";
	}
	
	
	
	
	
	
	
	
	
	
//	제품리스트(제품카테고리마다 출력)
	@GetMapping("/product")
	public String product(Model model, HttpSession session,
			@RequestParam("product_type") String product_type,
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum
			){
		System.out.println("카테고리 : " + product_type + "출력");
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		
//		페이징
		int section_ = Integer.parseInt(((section==null) ? "1" : section));
		int pageNum_ = Integer.parseInt(((pageNum==null) ? "1" : pageNum));
		
		int total_product = managerService.selectProduct_type(product_type);
		Map map = new HashMap();
		map.put("total_product", total_product);
		map.put("section", section_);
		map.put("pageNum", pageNum_);
		map.put("product_type", product_type);
		
		
		managerDTO.setSection(section_);
		managerDTO.setPageNum(pageNum_);
		managerDTO.setProduct_type(product_type);
		
		
		List productList = managerService.selectProduct_paging(managerDTO);
		/*
		 * articlesMap.put("section", section_); articlesMap.put("pageNum", pageNum_);
		 * model.addAttribute("articlesMap", articlesMap);
		 * model.addAttribute("memberList",session.getAttribute("id"));
		 */
		
		
		model.addAttribute("mapNum", map);
		model.addAttribute("productList", productList);
		
		return "product/product";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	제품상세(제품마다출력)
	@GetMapping("/info")
	public String info(Model model, HttpSession session,
			@RequestParam("product_code") String product_code,
//			리뷰페이징용 페이징 넘버
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum
			){
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		System.out.println("코드번호 : " + product_code + " 제품상세 출력");
		List productList = managerService.selectProduct(product_code);
		model.addAttribute("productList",productList);
		
		
//		리뷰창
		int section_ = Integer.parseInt(((section==null) ? "1" : section));
		int pageNum_ = Integer.parseInt(((pageNum==null) ? "1" : pageNum));
		managerDTO.setSection(section_);
		managerDTO.setPageNum(pageNum_);
		managerDTO.setProduct_code(product_code);
		
		List reviewList = managerService.selectReview(managerDTO);
		model.addAttribute("reviewList",reviewList);
		
		return "product/info";
	}
	
	
//	주문창
	@GetMapping("/order")
	public String order(Model model, HttpSession session){
		System.out.println("결제창출력");
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		return "pay/order";
	}
	
	
//	결제완료창
	@GetMapping("/complete")
	public String complete(Model model, HttpSession session){
		System.out.println("결제완료창 출력");
		return "pay/complete";
	}
	
//	결제실패창
	@GetMapping("/fail")
	public String fail(Model model, HttpSession session){
		System.out.println("결제실패창 출력");
		return "pay/fail";
	}
	
//	결제취소창
	@GetMapping("/cancel")
	public String cancel(Model model, HttpSession session){
		System.out.println("결제취소창 출력");
		return "pay/cancel";
	}
}
