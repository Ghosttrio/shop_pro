package com.spring.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shop.dto.LoginDTO;
import com.spring.shop.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	public LoginService loginService;
	
	@Autowired
	public LoginDTO loginDTO;
	
	
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
	
}
