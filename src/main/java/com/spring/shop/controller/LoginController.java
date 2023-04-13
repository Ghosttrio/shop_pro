package com.spring.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
//	로그인창 출력
	@GetMapping("/login")
	public String login(){
		System.out.println("로그인 출력");
		return "login/login";
	}
	
//	회원가입창 출력
	@GetMapping("/signup")
	public String signup(){
		System.out.println("회원가입 출력");
		return "signup/signup";
	}
	
//	회원가입 실행
	@PostMapping("/signup.do")
	public String signup(
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("addr") String addr) {
		
		loginDTO.setId(id);
		loginDTO.setPw(pw);
		loginDTO.setName(name);
		loginDTO.setEmail(email);
		loginDTO.setAddr(addr);
		
		loginService.insertMembers(loginDTO);
		
		return "redirect:/login";
	}
	
//	로그인 실행
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
			model.addAttribute("message", "error");
			return "login/login";
		} else {
			System.out.println("로그인실행");
			session.setAttribute("id", id);
			return "redirect:/main";
		}
	}
	
//	로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
//	중복체크
    @GetMapping("/idCheck.do")
    @ResponseBody
    public List idCheck() {
    	List idCheck = loginService.idCheck();
        return idCheck;
    }

	
}
