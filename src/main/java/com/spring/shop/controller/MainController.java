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

@Controller
public class MainController {

	@Autowired
	public ManagerService managerService;
	@Autowired
	public ManagerDTO managerDTO;
	
//	메인화면
	@GetMapping("/main")
	public String home(){
		System.out.println("메인 출력");
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
	public String mypage(){
		System.out.println("마이페이지 출력");
		return "mypage/mypage";
	}
	
	
	
	
	
	
	
	
	
	
//	제품리스트(제품카테고리마다 출력)
	@GetMapping("/product")
	public String product(Model model,
			@RequestParam("product_type") String product_type,
			@RequestParam(value="section", required=false) String section,
			@RequestParam(value="pageNum", required=false) String pageNum
			){
		System.out.println("카테고리 : " + product_type + "출력");
		
		
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
	public String info(Model model,
			@RequestParam("product_code") String product_code
			){
		System.out.println("코드번호 : " + product_code + " 제품상세 출력");
		List productList = managerService.selectProduct(product_code);
		model.addAttribute("productList",productList);
		
		return "product/info";
	}
}
