package com.spring.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.dto.LoginDTO;

@Repository
public class LoginDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private LoginDTO dto;
	
	public void insertMembers(LoginDTO loginDTO) {
		sqlSession.insert("mapper.login.signup", loginDTO);
	}
	
	public LoginDTO selectMembers(LoginDTO loginDTO) {
		
		dto = sqlSession.selectOne("mapper.login.login", loginDTO);
		
		return dto;
	}
	
	
	public List idCheck() {
		
		List list = sqlSession.selectList("mapper.login.idCheck");
		
		return list;
	}
	
	public List selectMembers(String id) {
		List list = sqlSession.selectList("mapper.login.selectId", id);
		return list;
	}
	
	public void updateMember(LoginDTO loginDTO) {
		sqlSession.update("mapper.login.updateMember", loginDTO);
	}
	
	public List order_list(String id) {
		List order_list = sqlSession.selectList("mapper.login.order_list", id);
		return order_list;
	}
	
	public List review_list(String id) {
		List review_list = sqlSession.selectList("mapper.login.review_list", id);
		return review_list;
	}
	public List cart_list(String id) {
		List cart_list = sqlSession.selectList("mapper.login.cart_list", id);
		return cart_list;
	}
	
	public void insertCart(LoginDTO loginDTO) {
		sqlSession.selectList("mapper.login.insertCart", loginDTO);
	}
	
	
}
