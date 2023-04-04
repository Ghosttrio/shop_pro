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
	private String email;
	private String addr;
	
}
