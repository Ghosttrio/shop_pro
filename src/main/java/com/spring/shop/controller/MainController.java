package com.spring.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.shop.dto.LoginDTO;
import com.spring.shop.dto.ManagerDTO;
import com.spring.shop.service.LoginService;
import com.spring.shop.service.ManagerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired
	public ManagerService managerService;
	@Autowired
	public LoginService loginService;
	@Autowired
	public LoginDTO loginDTO;
	
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
	
	
	
}
