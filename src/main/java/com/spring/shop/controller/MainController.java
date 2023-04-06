package com.spring.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shop.service.ManagerService;

@Controller
public class MainController {

	@Autowired
	public ManagerService managerService;
	
	
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
	
//	제품상세(제품마다출력)
	@GetMapping("/info")
	public String info(){
		System.out.println("제품상세 출력");
		return "info/info";
	}
}
