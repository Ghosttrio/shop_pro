package com.spring.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
//	상품 추가
	@PostMapping("/add.do")
	public String add(
			@RequestParam("product_code") String product_code,
			@RequestParam("product_name") String product_name,
			@RequestParam("product_price") int product_price,
			@RequestParam("product_brand") String product_brand,
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
