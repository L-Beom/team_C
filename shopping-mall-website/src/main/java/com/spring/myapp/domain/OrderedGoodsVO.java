package com.spring.myapp.domain;

import lombok.Data;

@Data
public class OrderedGoodsVO {
	private String orderId;
	private String goodsName;
	private String goodsCode;
	private int cartStock;
	private int goodsPrice;
	private String goodsThumbnailImage;
	private int orderStatus;
}
