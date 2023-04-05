package com.spring.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.dao.LoginDAO;
import com.spring.shop.dto.LoginDTO;

@Service
public class LoginService {

	@Autowired
	public LoginDAO loginDAO;
	
	@Autowired
	private LoginDTO dto;
	
//	회원가입
	public void insertMembers(LoginDTO loginDTO) {
		loginDAO.insertMembers(loginDTO);
	}
	
//	로그인 회원정보 조회
	public LoginDTO selectMembers(LoginDTO loginDTO) {
		dto = loginDAO.selectMembers(loginDTO);
		return dto;
	}
	
}
