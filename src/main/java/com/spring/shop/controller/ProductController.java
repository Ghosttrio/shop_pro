package com.spring.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shop.dto.LoginDTO;
import com.spring.shop.dto.ManagerDTO;
import com.spring.shop.service.LoginService;
import com.spring.shop.service.ManagerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	@Autowired
	public ManagerService managerService;
	@Autowired
	public LoginService loginService;
	@Autowired
	public LoginDTO loginDTO;
	
	@Autowired
	public ManagerDTO managerDTO;
	
	

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
		model.addAttribute("code", product_code);
		
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
		
		Double avg_rate = managerService.avg_rate(product_code);
		model.addAttribute("avg_rate", avg_rate);
		
		
		
		
		
		int total_review = managerService.total_review(product_code);
		Map map = new HashMap();
		map.put("total_review", total_review);
		map.put("section", section_);
		map.put("pageNum", pageNum_);
		map.put("product_code", product_code);
		model.addAttribute("mapNum", map);
		
		return "product/info";
	}
}
