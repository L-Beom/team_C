package com.spring.myapp.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class GoodsReplyVO {
	private String goodsCode;
	private String goodsName;
	private String replyNumber;
	private String userid;
	private String replyData;
	private int replyRating;
	private Date replyDate;
}
