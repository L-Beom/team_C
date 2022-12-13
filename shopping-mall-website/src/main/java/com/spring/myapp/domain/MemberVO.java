package com.spring.myapp.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String email;
	private String password;
	private String username;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private Date regedate;
	private int verify;
}
