package com.spring.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.dao.LoginDAO;
import com.spring.shop.dto.LoginDTO;

@Service
public class LoginService {

	@Autowired
	public LoginDAO loginDAO;
	
	public void insertMembers(LoginDTO loginDTO) {
		loginDAO.insertMembers(loginDTO);
	}
}
