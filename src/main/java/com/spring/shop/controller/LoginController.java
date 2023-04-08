package com.spring.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shop.dto.LoginDTO;
import com.spring.shop.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
	public LoginService loginService;
	
	@Autowired
	public LoginDTO loginDTO;
	
	@Autowired
	public LoginDTO dto;
	
//	회원가입
	@PostMapping("/signup.do")
	public String signup(
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("addr") String addr) {
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		System.out.println(email);
		System.out.println(addr);
		
		loginDTO.setId(id);
		loginDTO.setPw(pw);
		loginDTO.setName(name);
		loginDTO.setEmail(email);
		loginDTO.setAddr(addr);
		
		loginService.insertMembers(loginDTO);
		
		return "redirect:/login";
	}
	
//	로그인
	@PostMapping("/login.do")
	public String loginDo(
			Model model, HttpSession session,
			@RequestParam("id") String id,
			@RequestParam("pw") String pw) {
		
		loginDTO.setId(id);
		loginDTO.setPw(pw);

	    dto = loginService.selectMembers(loginDTO);
//		널값이면 다시입력 출력 아니면 로그인
		if(dto==null) {
			System.out.println("로그인실패");
			model.addAttribute("loginInfo", null);
			return "redirect:/login";
		} else {
			System.out.println("로그인실행");
			session.setAttribute("id", id);
			String sessionId = (String) session.getAttribute("id");
			model.addAttribute("loginInfo", sessionId);
			return "main/main";
		}
		
	}
	
}
