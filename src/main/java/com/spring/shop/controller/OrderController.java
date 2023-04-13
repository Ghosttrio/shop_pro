package com.spring.shop.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shop.dto.LoginDTO;
import com.spring.shop.dto.ManagerDTO;
import com.spring.shop.service.LoginService;
import com.spring.shop.service.ManagerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
	@Autowired
	public ManagerService managerService;
	@Autowired
	public LoginService loginService;
	@Autowired
	public LoginDTO loginDTO;
	
	@Autowired
	public ManagerDTO managerDTO;
	
	

	
//	주문창
	@GetMapping("/order")
	public String order(Model model, HttpSession session,
			@RequestParam("code") String product_code,
			@RequestParam("total_price") String total_price,
			@RequestParam("product_num") String product_num,
			@RequestParam("size") String size
			){
		System.out.println("결제창출력");
		String sessionId = (String) session.getAttribute("id");
		model.addAttribute("loginInfo", sessionId);
		
		
		List productList = managerService.selectProduct(product_code);
		model.addAttribute("productList", productList);
		
		
		List userInfo = loginService.selectMembers(sessionId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("total_price", total_price);
		model.addAttribute("product_num", product_num);
		model.addAttribute("size", size);
		
		return "pay/order";
	}
	
	
	
	
	
//	결제완료창
    @RequestMapping("/complete")
	public String complete(Model model, HttpSession session,
			@RequestParam Map<String, Object> map,
			@RequestParam(value="command", required=false) String command,
			@RequestParam(value="id", required=false) String id
			){
		
    	int leftLimit = 97; // letter 'a'
	    int rightLimit = 122; // letter 'z'
	    int targetStringLength = 10;
	    Random random = new Random();
	    String generatedString = random.ints(leftLimit, rightLimit + 1)
	                                   .limit(targetStringLength)
	                                   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	                                   .toString();
	    System.out.println(generatedString);
	    
	    map.put("order_id", generatedString);
    	
    	
		if(command==null) {
			System.out.println("결제완료창 출력");
			String sessionId = (String) session.getAttribute("id");
			model.addAttribute("loginInfo", sessionId);
			model.addAttribute("result", map);
			System.out.println(map.toString());
			List productList = managerService.selectProduct(map.get("product_code").toString());
			model.addAttribute("productList",productList);
//			주문내역 테이블에 인서트하기
			loginService.insert_order(map);
			return "pay/complete";
		}else {
			System.out.println("주문내역 출력");
			String sessionId = (String) session.getAttribute("id");
			model.addAttribute("loginInfo", sessionId);
			model.addAttribute("result", map);
			
			List orderInfo = loginService.order_list(id);
			model.addAttribute("orderInfo", orderInfo);
			return "mypage/mypage";
		}
		
	}
}
