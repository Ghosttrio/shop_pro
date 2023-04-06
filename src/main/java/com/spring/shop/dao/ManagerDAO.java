package com.spring.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.dto.ManagerDTO;

@Repository
public class ManagerDAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	public void addProduct(ManagerDTO managerDTO) {
		sqlSession.insert("mapper.manager.addProduct", managerDTO);
	}
	
	public List selectProduct() {
		List selectProduct =  sqlSession.selectList("mapper.manager.selectProduct");
		return selectProduct;
	}
	
	public void deleteProduct(String product_code) {
		sqlSession.delete("mapper.manager.deleteProduct", product_code);
	}
	public void updateProduct(ManagerDTO managerDTO) {
		sqlSession.update("mapper.manager.updateProduct", managerDTO);
	}
	
	public List selectProduct_update(String product_code) {
		List selectProduct =  sqlSession.selectList("mapper.manager.selectProduct_update", product_code);
		return selectProduct;
	}
	
}
