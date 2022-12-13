package com.spring.myapp.service;

import java.util.List;

import com.spring.myapp.domain.GoodsOrderListVO;
import com.spring.myapp.domain.GoodsReplyVO;
import com.spring.myapp.domain.GoodsVO;

public interface AdminService {

	// 상품등록
	public void register(GoodsVO vo) throws Exception;

	// 상품목록
	public List<GoodsVO> goodslist() throws Exception;

	// 상품조회
	public GoodsVO goodsView(String goodsCode) throws Exception;

	// 상품 수정
	public void goodsModify(GoodsVO vo) throws Exception;

	// 상품 삭제
	public void goodsDelete(String goodsCode) throws Exception;

	// 댓글목록
	public List<GoodsReplyVO> goodsReplylist() throws Exception;

	// 상품 주문 목록
	public List<GoodsOrderListVO> goodsOrderList() throws Exception;

	// 상품 주문상태 변경
	public void goodsOrderModify(String orderId) throws Exception;

	// 총 수익
	public int getTotalIncome() throws Exception;

	// 총 댓글 수
	public int getTotalReply() throws Exception;

	// 총 상품 갯수
	public int getGoodsTotal() throws Exception;

	// 총 회원 수
	public int getTotalUser() throws Exception;

	// 그래프용 카테고리별 상품 갯수
	public int getGoodsTotalByClassification(String firstClassification) throws Exception;

	// 그래프용 월별 총 수익
	public int getGoodsTotalIncomeByMonth() throws Exception;
}