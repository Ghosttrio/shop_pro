package com.spring.shop.service;

import java.util.List;

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
	
//	아이디 중복체크
	public List idCheck() {
		List list = loginDAO.idCheck();
		return list;
	}
	
//	회원정보 수정창 출력
	public List selectMembers(String id) {
		List list = loginDAO.selectMembers(id);
		return list;
	}
	
//	회원정보 수정 실행
	public void updateMember(LoginDTO loginDTO) {
		loginDAO.updateMember(loginDTO);
	}
	
//	주문내역 출력
	public List order_list(String id) {
		List list = loginDAO.order_list(id);
		return list;
	}
	
	
//	리뷰작성 내역 출력
	public List review_list(String id) {
		List review_list = loginDAO.review_list(id);
		return review_list;
	}
	
	
//	장바구니 목록 출력
	public List cart_list(String id) {
		List cart_list = loginDAO.cart_list(id);
		return cart_list;
	}
	
	
	public void insertCart(LoginDTO loginDTO) {
		loginDAO.insertCart(loginDTO);
	}
	
	
	
}
