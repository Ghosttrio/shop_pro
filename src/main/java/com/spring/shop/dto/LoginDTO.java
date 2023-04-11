package com.spring.shop.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class LoginDTO {

	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String email;
	private String addr;
	private String phone;
	
	
	private String order_id;
	private String order_product_id;
	private String order_account_id;
	private String order_size;
	private int order_num;
	private String order_price;
	private String order_addr;


	private int review_num;
	private int review_parentNum;
	private String review_productId;
	private String review_userId;
	private String review_content;
	private int review_rate;
	private String review_productNickname;
	
	private String cart_id;
	private String cart_userId;
	private String cart_productId;
	
	
	
	
}
