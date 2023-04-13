package com.spring.shop.controller;

import java.util.List;

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
public class ReviewController {
	@Autowired
	public ManagerService managerService;
	@Autowired
	public LoginService loginService;
	@Autowired
	public LoginDTO loginDTO;
	
	@Autowired
	public ManagerDTO managerDTO;
	
	


//	리뷰폼
	@GetMapping("/reviewForm")
	public String reviewForm(Model model, HttpSession session,
			@RequestParam("loginInfo") String loginInfo,
			@RequestParam("code") String code
			){
		System.out.println("리뷰작성창 출력");
		
		model.addAttribute("loginInfo", loginInfo);
		model.addAttribute("code", code);
		
		
		return "product/reviewForm";
	}
//	리뷰작성실행
	@GetMapping("/review.do")
	public String reviewDo(Model model, HttpSession session,
			@RequestParam("loginInfo") String loginInfo,
			@RequestParam("code") String code,
			@RequestParam("textarea") String textarea,
			@RequestParam("command") String command,
			@RequestParam(value="writer_rate", required=false) Integer writer_rate,
			@RequestParam(value="review_parentNum", required=false) Integer review_parentNum
			
			){
		System.out.println("리뷰작성실행");
		int review_max = loginService.review_max();
		
		if(command.equals("parent_review")) {
			loginDTO.setReview_max(review_max+1);
			loginDTO.setReview_parentNum(0);
			loginDTO.setReview_productId(code);
			loginDTO.setReview_userId(loginInfo);
			loginDTO.setReview_content(textarea);
			loginDTO.setReview_rate(writer_rate);
		} else if(command.equals("child_review")) {
			System.out.println(review_max);
			System.out.println(review_parentNum);
			System.out.println(code);
			System.out.println(loginInfo);
			System.out.println(textarea);
			
			
			loginDTO.setReview_max(review_max+1);
			loginDTO.setReview_parentNum(review_parentNum);
			loginDTO.setReview_productId(code);
			loginDTO.setReview_userId(loginInfo);
			loginDTO.setReview_content(textarea);
			loginDTO.setReview_rate(0);
		}
		
		
		loginService.insertReview(loginDTO);
		
		
		return "redirect:/info?product_code="+code;
	}

	
	
	
//	부모리뷰 업데이트창 실행
	@GetMapping("/reviewForm_update")
	public String reviewForm_update(Model model, HttpSession session,
			@RequestParam("loginInfo") String loginInfo,
			@RequestParam("code") String code,
			@RequestParam("review_num") int review_num
			){
		System.out.println("부모리뷰작성창 출력");
		
		model.addAttribute("loginInfo", loginInfo);
		model.addAttribute("code", code);
		
		List selectReview = loginService.selectReview(review_num);
		
		model.addAttribute("selectReview", selectReview);
		
		return "product/reviewUpdate";
	}
	


//	부모리뷰 업데이트창 실행
	@GetMapping("/reviewUpdate.do")
	public String parent_review_update(Model model, HttpSession session,
			@RequestParam("loginInfo") String loginInfo,
			@RequestParam("code") String code,
			@RequestParam("textarea") String textarea,
			@RequestParam("review_num") int review_num,
			@RequestParam(value="writer_rate", required=false) Integer writer_rate
			){
		System.out.println("부모리뷰 업데이트창 실행");
		
		loginDTO.setReview_num(review_num);
		loginDTO.setReview_parentNum(0);
		loginDTO.setReview_productId(code);
		loginDTO.setReview_userId(loginInfo);
		loginDTO.setReview_content(textarea);
		loginDTO.setReview_rate(writer_rate);
		loginService.updateReview(loginDTO);
		
		
		
		return "redirect:/info?product_code="+code;
	}

	
	
	
	//	리뷰삭제
	@GetMapping("/review_delete")
	public String reviewDo(Model model, HttpSession session,
			@RequestParam("code") String code,
			@RequestParam("review_num") int review_num
			){
		System.out.println("리뷰삭제");
		
		loginService.reviewDelete(review_num);
		return "redirect:/info?product_code="+code;
	}
	

}
