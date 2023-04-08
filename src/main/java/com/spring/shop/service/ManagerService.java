package com.spring.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.dao.ManagerDAO;
import com.spring.shop.dto.ManagerDTO;

@Service
public class ManagerService {

	@Autowired
	public ManagerDAO managerDAO;
	
	
	public void addProduct(ManagerDTO managerDTO) {
		managerDAO.addProduct(managerDTO);
	}
	
	public List selectProduct() {
		List selectProduct = managerDAO.selectProduct();
		return selectProduct;
	}
	
	public List selectProduct(String product_code) {
		List selectProduct = managerDAO.selectProduct(product_code);
		return selectProduct;
	}
	
	
//	상품코드에 맞는 리뷰출력
	public List selectReview(ManagerDTO managerDTO) {
		List selectReview = managerDAO.selectReview(managerDTO);
		return selectReview;
	}
	
	
	
	public int selectProduct_type(String product_type) { 
		int selectProduct = managerDAO.selectProduct_type(product_type); 
		return selectProduct; 
	}
	 
	
	public List selectProduct_paging(ManagerDTO managerDTO) {
		List selectProduct = managerDAO.selectProduct_paging(managerDTO);
		return selectProduct;
	}

	
	public void deleteProduct(String product_code) {
		managerDAO.deleteProduct(product_code);
	}
	public void updateProduct(ManagerDTO managerDTO) {
		managerDAO.updateProduct(managerDTO);
	}
	
	public List selectProduct_update(String product_code) {
		List selectProduct = managerDAO.selectProduct_update(product_code);
		return selectProduct;
	}
	
	
	
}
