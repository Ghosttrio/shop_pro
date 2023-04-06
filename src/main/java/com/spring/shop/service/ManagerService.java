package com.spring.shop.service;

import java.util.List;

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
