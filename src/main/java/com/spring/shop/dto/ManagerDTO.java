package com.spring.shop.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class ManagerDTO {

	
	private String product_code;
	private String product_name;
	private String product_price;
	private String product_brand;
	private String product_option;
	private String product_explain;
	private String product_image;
	
	
	
}
