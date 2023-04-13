package com.spring.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shop.dto.ManagerDTO;
import com.spring.shop.service.ManagerService;

@Controller
public class ManagerController {

	@Autowired
	public ManagerDTO managerDTO;
	
	@Autowired
	public ManagerService managerService;
	
//	관리자페이지 메인화면 출력
	@GetMapping("/manager")
	public String manager_main(Model model){
		System.out.println("관리자페이지 메인 출력");	
		List productList = managerService.selectProduct();
		model.addAttribute("productList",productList);
		
		return "manager/manager";
	}
	 
//	관리자페이지 상품 추가창 출력
	@GetMapping("/add")
	public String manager_add(){
		System.out.println("관리자페이지 추가창 출력");
		return "manager/add";
	}
	
//	관리자페이지 상품 수정창 출력
	@GetMapping("/update")
	public String manager_update(Model model,
			@RequestParam("product_code") String product_code){
		System.out.println("관리자페이지 수정창 출력");
		
		List productList = managerService.selectProduct_update(product_code);
		model.addAttribute("productList",productList);
		return "manager/update";
	}
	
//	상품 추가
	@PostMapping("/add.do")
	public String add(
			@RequestParam("product_code") String product_code,
			@RequestParam("product_name") String product_name,
			@RequestParam("product_price") int product_price,
			@RequestParam("product_explain") String product_explain,
			@RequestParam("product_image") String product_image,
			@RequestParam("product_type") String product_type
			) {
		
		managerDTO.setProduct_code(product_code);
		managerDTO.setProduct_name(product_name);
		managerDTO.setProduct_price(product_price);
		managerDTO.setProduct_explain(product_explain);
		managerDTO.setProduct_image(product_image);
		managerDTO.setProduct_type(product_type);
		managerService.addProduct(managerDTO);
		
		
		System.out.println("상품 추가 실행");
		
		return "redirect:/manager";
	}
	
//	상품 삭제
	@PostMapping("/delete.do")
	public String delete(
			@RequestParam("product_code") String product_code
			) {
		managerService.deleteProduct(product_code);
		
		System.out.println("상품 삭제 실행");
		
		return "redirect:/manager";
	}
	
//	상품 수정
	@PostMapping("/update.do")
	public String update(
			@RequestParam("product_code") String product_code,
			@RequestParam("product_name") String product_name,
			@RequestParam("product_price") int product_price,
			@RequestParam("product_explain") String product_explain,
			@RequestParam("product_image") String product_image,
			@RequestParam("product_type") String product_type
			) {
		
		managerDTO.setProduct_code(product_code);
		managerDTO.setProduct_name(product_name);
		managerDTO.setProduct_price(product_price);
		managerDTO.setProduct_explain(product_explain);
		managerDTO.setProduct_image(product_image);
		managerDTO.setProduct_type(product_type);
		managerService.updateProduct(managerDTO);
		
		System.out.println("상품 수정 실행");
		
		return "redirect:/manager";
	}
}
