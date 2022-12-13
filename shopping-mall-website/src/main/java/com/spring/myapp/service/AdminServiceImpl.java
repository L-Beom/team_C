package com.spring.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myapp.domain.GoodsOrderListVO;
import com.spring.myapp.domain.GoodsReplyVO;
import com.spring.myapp.domain.GoodsVO;
import com.spring.myapp.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	// 상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);
	}

	// 상품목록
	@Override
	public List<GoodsVO> goodslist() throws Exception {
		return dao.goodslist();
	}

	// 상품조회
	@Override
	public GoodsVO goodsView(String goodsCode) throws Exception {
		return dao.goodsView(goodsCode);
	}

	// 상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		dao.goodsModify(vo);
	}

	// 상품 삭제
	@Override
	public void goodsDelete(String goodsCode) throws Exception {
		dao.goodsDelete(goodsCode);
	}

	@Override
	public List<GoodsReplyVO> goodsReplylist() throws Exception {
		return dao.goodsReplylist();
	}

	@Override
	public List<GoodsOrderListVO> goodsOrderList() throws Exception {
		return dao.goodsOrderList();
	}

	@Override
	public void goodsOrderModify(String orderId) throws Exception {
		dao.goodsOrderModify(orderId);
	}

	@Override
	public int getGoodsTotal() throws Exception {
		return dao.getGoodsTotal();
	}

	@Override
	public int getTotalIncome() throws Exception {
		return dao.getTotalIncome();
	}

	@Override
	public int getTotalReply() throws Exception {
		return dao.getTotalReply();
	}

	@Override
	public int getTotalUser() throws Exception {
		return dao.getTotalUser();
	}

	@Override
	public int getGoodsTotalByClassification(String firstClassification) throws Exception {
		return dao.getGoodsTotalByClassification(firstClassification);
	}

	@Override
	public int getGoodsTotalIncomeByMonth() throws Exception {
		return dao.getGoodsTotalIncomeByMonth();
	}

}
