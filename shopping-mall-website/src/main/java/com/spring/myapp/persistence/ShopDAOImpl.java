package com.spring.myapp.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myapp.domain.CartListVO;
import com.spring.myapp.domain.CartVO;
import com.spring.myapp.domain.GoodsReplyListVO;
import com.spring.myapp.domain.GoodsReplyRatingVO;
import com.spring.myapp.domain.GoodsReplyVO;
import com.spring.myapp.domain.GoodsVO;
import com.spring.myapp.domain.OrderVO;
import com.spring.myapp.domain.OrderedGoodsVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "shopMapper";

	@Override
	public List<GoodsVO> goodsList(String firstClassification) throws Exception {
		return sql.selectList(namespace + ".goodsViewList", firstClassification);
	}

	@Override
	public GoodsVO goodsView(String goodsName) throws Exception {
		return sql.selectOne(namespace + ".goodsViewOne", goodsName);
	}

	@Override
	public GoodsVO goodsViewByGoodsCode(String goodsCode) throws Exception {
		return sql.selectOne(namespace + ".goodsViewByGoodsCode", goodsCode);
	}

	@Override
	public void registerReply(GoodsReplyVO reply) throws Exception {
		sql.insert(namespace + ".registerReply", reply);
	}

	@Override
	public List<GoodsReplyListVO> replyList(String goodsName) throws Exception {
		return sql.selectList(namespace + ".replyList", goodsName);
	}

	@Override
	public void deleteReply(String replyNumber) throws Exception {
		sql.delete(namespace + ".deleteReply", replyNumber);
	}

	@Override
	public String idCheck(String replyNumber) throws Exception {
		return sql.selectOne(namespace + ".replyUserIdCheck", replyNumber);
	}

	@Override
	public GoodsReplyVO selectReplyByNumber(String replyNumber) throws Exception {
		return sql.selectOne(namespace + ".replySelect", replyNumber);
	}

	@Override
	public void replyModify(GoodsReplyVO vo) throws Exception {
		sql.update(namespace + ".replyModify", vo);
	}

	@Override
	public void addCart(CartVO cart) throws Exception {
		sql.insert(namespace + ".addCart", cart);
	}

	@Override
	public List<GoodsReplyRatingVO> goodsReplyList(String firstClassification) throws Exception {
		return sql.selectList(namespace + ".replyCount", firstClassification);
	}

	@Override
	public List<CartListVO> cartList(String userid) throws Exception {
		return sql.selectList(namespace + ".cartList", userid);
	}

	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
	}

	@Override
	public void deleteAllCart(String userId) throws Exception {
		sql.delete(namespace + ".deleteAllCart", userId);
	}
	
	@Override
	public void deleteAllCartByGoodsCode(String goodsCode) throws Exception {
		sql.delete(namespace + ".deleteCartByGoodsCode", goodsCode);
	}

	@Override
	public void orderCart(OrderVO vo) throws Exception {
		sql.insert(namespace + ".addOrder", vo);
	}

	@Override
	public void orderCartGoods(OrderedGoodsVO vo) throws Exception {
		sql.insert(namespace + ".addOrderGoods", vo);
	}

	@Override
	public List<OrderedGoodsVO> getOrderedGoods(String orderId) throws Exception {
		return sql.selectList(namespace + ".getOrderItems", orderId);
	}

	@Override
	public List<OrderedGoodsVO> getOrderedGoodsByEmail(String userId) throws Exception {
		return sql.selectList(namespace + ".getOrderItemsByEmail", userId);
	}

	@Override
	public void decreaseStock(GoodsVO vo) throws Exception {
		sql.update(namespace + ".goodsStockDecrease", vo);
	}
}