package com.spring.shop.controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shop.dto.LoginDTO;
import com.spring.shop.service.LoginService;
import com.spring.shop.service.ManagerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageController {
	
	@Autowired
	public LoginService loginService;
	@Autowired
	public ManagerService managerService;
	@Autowired
	public LoginDTO loginDTO;
	
//	회원정보 수정창 출력
	@GetMapping("/account_update")
	public String account_update(Model model, HttpSession session,
			@RequestParam("id") String id) {
		System.out.println("회원정보 수정창 출력");
		System.out.println(id);

		List userInfo = loginService.selectMembers(id);
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		
		model.addAttribute("userInfo", userInfo);
		
		return "mypage/mypage";
	}
	
//	회원정보 수정 실행
	@PostMapping("/account_update.do")
	public String account_update_do(Model model,
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			@RequestParam("name") String name,
			@RequestParam("nickname") String nickname,
			@RequestParam("email") String email,
			@RequestParam("addr") String addr,
			@RequestParam("phone") String phone
			) {
		System.out.println("회원정보 수정 실행");
		
		loginDTO.setId(id);
		loginDTO.setPw(pw);
		loginDTO.setName(name);
		loginDTO.setNickname(nickname);
		loginDTO.setAddr(addr);
		loginDTO.setPhone(phone);
		
		loginService.updateMember(loginDTO);
		
		
		return "redirect:/mypage";
	}
	
	
//	주문내역 출력
	@GetMapping("/order_list")
	public String order_list(Model model, HttpSession session,
			@RequestParam("id") String id) {
		System.out.println("주문내역 출력");
		List productList = managerService.selectProduct();
		model.addAttribute("productList",productList);
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		List orderInfo = loginService.order_list(id);
		model.addAttribute("orderInfo", orderInfo);
		return "mypage/mypage";
	}
	
	
	
	
	
	
//	리뷰작성내역 출력
	@GetMapping("/review_list")
	public String review_list(Model model, HttpSession session,
			@RequestParam("id") String id) {
		System.out.println("주문내역 출력");
		List productList = managerService.selectProduct();
		model.addAttribute("productList",productList);
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		
		
		List reviewInfo = loginService.review_list(id);
		model.addAttribute("reviewInfo", reviewInfo);
		
		
		return "mypage/mypage";
	}
	
	
	
//	장바구니 입력
	@PostMapping("/cart")
	public String cart(Model model, HttpSession session,
			@RequestParam("code") String product_code) {
		System.out.println("장바구니 입력");
		String sessionId = (String) session.getAttribute("id");
		
		int leftLimit = 97; // letter 'a'
	    int rightLimit = 122; // letter 'z'
	    int targetStringLength = 10;
	    Random random = new Random();
	    String generatedString = random.ints(leftLimit, rightLimit + 1)
	                                   .limit(targetStringLength)
	                                   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	                                   .toString();
	    System.out.println(generatedString);
		
		
		loginDTO.setCart_id(generatedString);
		loginDTO.setCart_userId(sessionId);
		loginDTO.setCart_productId(product_code);
		loginService.insertCart(loginDTO);
		
		return "redirect:/info?product_code="+product_code;
	}
	
//	장바구니내역 출력
	@GetMapping("/cart_list")
	public String cart_list(Model model, HttpSession session,
			@RequestParam("id") String id) {
		System.out.println("장바구니 출력");
		List productList = managerService.selectProduct();
		model.addAttribute("productList",productList);
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		
		
		List cartInfo = loginService.cart_list(id);
		model.addAttribute("cartInfo", cartInfo);
		
		
		return "mypage/mypage";
	}
}
