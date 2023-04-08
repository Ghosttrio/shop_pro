package com.spring.shop.dao;

import java.util.List;
import java.util.Map;

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
	
	public List selectProduct(String product_code) {
		List selectProduct =  sqlSession.selectList("mapper.manager.selectProduct_product", product_code);
		return selectProduct;
	}
	
	
	public List selectReview(ManagerDTO managerDTO) {
		List selectReview =  sqlSession.selectList("mapper.manager.selectReview", managerDTO);
		return selectReview;
	}
	
	
	
	
	public int selectProduct_type(String product_type) { 
		int selectProduct = sqlSession.selectOne("mapper.manager.selectProduct_type", product_type);
		return selectProduct; 
	}
	 
	
	public List selectProduct_paging(ManagerDTO managerDTO) {
		List selectProduct =  sqlSession.selectList("mapper.manager.selectProduct_paging", managerDTO);
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
