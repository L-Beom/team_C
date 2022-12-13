package com.spring.myapp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsReplyRatingVO {
	private String goodsCode;
	private String goodsName;
	private String firstClassification;
	private String secondClassification;
	private String brand;
	private int goodsPrice;
	private int goodsStock;
	private int goodsDiscountRate;
	private String goodsDescription;
	private String goodsImage;
	private String goodsThumbnailImage;
	private Date goodsAddedTime;
	
	// 새로 추가
	private double avgReplyRating;
	private int countReply;
}
