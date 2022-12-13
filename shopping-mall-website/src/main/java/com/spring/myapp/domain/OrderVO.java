package com.spring.myapp.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderVO {
	private String orderId;
	private String userId;
	private String orderRecipient;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private int amount;
	private Date orderDate;
}
