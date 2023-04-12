package com.spring.shop.dao;

import java.util.List;
import java.util.Map;

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
		sqlSession.insert("mapper.login.insertCart", loginDTO);
	}
	
	public void insert_order(Map map) {
		sqlSession.insert("mapper.login.insert_order", map);
	}
	
	public int review_max() {
		String review_max = sqlSession.selectOne("mapper.login.review_max");
		

		if(review_max == null) {
			review_max = "0";
			int result =Integer.parseInt(review_max);
			return result; 
		}else {
			int result = Integer.parseInt(review_max);
			return result; 
		}
		
	}
	public void insertReview(LoginDTO loginDTO) {
		sqlSession.insert("mapper.login.insertReview", loginDTO);
	}
	
	public void reviewDelete(int reviewNum) {
		sqlSession.delete("mapper.login.reviewDelete", reviewNum);
	}
	
	public List selectReview(int reviewNum) {
		List list = sqlSession.selectList("mapper.login.selectReview_reviewNum", reviewNum);
		return list;
	}
	
	
	public void updateReview(LoginDTO loginDTO) {
		sqlSession.update("mapper.login.updateReview", loginDTO);
	}
	
}
