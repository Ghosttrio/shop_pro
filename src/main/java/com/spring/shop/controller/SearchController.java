package com.spring.shop.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.shop.service.ManagerService;

@RestController
public class SearchController {

	@Autowired
	ManagerService managerService;
	
//	상품 검색 실행
    @GetMapping("/search.do")
    public List search() {
    	List productList = managerService.selectProduct();
        return productList;
    }

}
