package com.spring.myapp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private int cartNumber;
	private String userid;
	private String goodsCode;
	private String goodsName;
	private int cartStock;
	private Date cartAddedDate;
}
