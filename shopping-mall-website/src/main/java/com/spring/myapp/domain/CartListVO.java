package com.spring.myapp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartListVO {
	private int cartNumber;
	private String userid;
	private String goodsCode;
	private String goodsName;
	private int cartStock;
	private Date cartAddedDate;
	
	// 추가된것
	private String firstClassification;
	private String secondClassification;
	private String brand;
	private int goodsPrice;
	private int goodsDiscountRate;
	private String goodsDescription;
	private String goodsImage;
	private String goodsThumbnailImage;
}
