package com.spring.myapp.domain;

import lombok.Data;

@Data
public class GoodsOrderListVO {
	private String orderId;
	private String goodsName;
	private String goodsCode;
	private String cartStock;
	private String goodsPrice;
	private String orderRecipient;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private String orderStatus;
}
