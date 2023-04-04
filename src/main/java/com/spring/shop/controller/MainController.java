package com.spring.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

//	메인화면
	@GetMapping("/main")
	public String home(){
		System.out.println("메인 출력");
		return "main/main";
	}
	
//	로그인
	@GetMapping("/login")
	public String login(){
		System.out.println("로그인 출력");
		return "login/login";
	}
	
//	회원가입
	@GetMapping("/signup")
	public String signup(){
		System.out.println("회원가입 출력");
		return "signup/signup";
	}
	
//	고객센터
	@GetMapping("/service")
	public String service(){
		System.out.println("고객센터 출력");
		return "service/service";
	}
	
//	관리자페이지(메인)
	@GetMapping("/manager_main")
	public String manager_main(){
		System.out.println("관리자페이지 메인 출력");
		return "manager/manager_main";
	}
	
//	관리자페이지(로그인)
	@GetMapping("/manager_login")
	public String manager_login(){
		System.out.println("관리자페이지 로그인 출력");
		return "manager/manager_login";
	}
	

//	마이페이지(계정마다 출력)
	@GetMapping("/mypage")
	public String mypage(){
		System.out.println("마이페이지 출력");
		return "mypage/mypage";
	}
	
//	제품상세(제품마다출력)
	@GetMapping("/info")
	public String info(){
		System.out.println("제품상세 출력");
		return "info/info";
	}
}
