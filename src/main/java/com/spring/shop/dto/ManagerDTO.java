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
	private int product_price;
	private String product_explain;
	private String product_image;
	private String product_type;
	private String product_type2;
	
	private int section;
	private int pageNum;
	private int total_product;
	
	
	private int review_num;
	private int review_parentNum;
	private String review_productId;
	private String review_userId;
	private String review_content;
	private int review_rate;
	private String review_productNickname;
	
	
	
}
