package com.spring.myapp.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myapp.domain.GoodsOrderListVO;
import com.spring.myapp.domain.GoodsReplyVO;
import com.spring.myapp.domain.GoodsVO;



@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "adminMapper";

	// 상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
	}

	// 상품목록
	@Override
	public List<GoodsVO> goodslist() throws Exception {
		return sql.selectList(namespace + ".goodslist");
	}

	// 상품조회
	@Override
	public GoodsVO goodsView(String goodsCode) throws Exception {
		return sql.selectOne(namespace + ".goodsView", goodsCode);
	}

	// 상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		sql.update(namespace + ".goodsModify", vo);
	}

	// 상품 삭제
	@Override
	public void goodsDelete(String goodsCode) throws Exception {
		sql.delete(namespace + ".goodsDelete", goodsCode);
	}

	@Override
	public List<GoodsReplyVO> goodsReplylist() throws Exception {
		return sql.selectList(namespace + ".goodsReply");
	}

	@Override
	public List<GoodsOrderListVO> goodsOrderList() throws Exception {
		return sql.selectList(namespace + ".goodsOrderList");
	}

	@Override
	public void goodsOrderModify(String orderId) throws Exception {
		sql.update(namespace + ".goodsOrderModify", orderId);
	}

	@Override
	public int getTotalIncome() throws Exception {
		return sql.selectOne(namespace + ".totalIncome");
	}

	@Override
	public int getGoodsTotal() throws Exception {
		return sql.selectOne(namespace + ".goodsSum");
	}

	@Override
	public int getTotalReply() throws Exception {
		return sql.selectOne(namespace + ".goodsReplySum");
	}

	@Override
	public int getTotalUser() throws Exception {
		return sql.selectOne(namespace + ".memberSum");
	}

	@Override
	public int getGoodsTotalByClassification(String firstClassification) throws Exception {
		return sql.selectOne(namespace + ".goodsTotalByClassification", firstClassification);
	}

	@Override
	public int getGoodsTotalIncomeByMonth() throws Exception {
		return sql.selectOne(namespace + ".goodsTotalIncomeByMonth");
	}

}