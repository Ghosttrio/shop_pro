package com.spring.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.dto.LoginDTO;

@Repository
public class LoginDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void insertMembers(LoginDTO loginDTO) {
		sqlSession.insert("mapper.login.signup", loginDTO);
	}
}
