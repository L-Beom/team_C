package com.spring.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myapp.domain.CartListVO;
import com.spring.myapp.domain.CartVO;
import com.spring.myapp.domain.GoodsReplyListVO;
import com.spring.myapp.domain.GoodsReplyRatingVO;
import com.spring.myapp.domain.GoodsReplyVO;
import com.spring.myapp.domain.GoodsVO;
import com.spring.myapp.domain.OrderVO;
import com.spring.myapp.domain.OrderedGoodsVO;
import com.spring.myapp.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	private ShopDAO dao;

	@Override
	public List<GoodsVO> goodsList(String firstClassification) throws Exception {
		return dao.goodsList(firstClassification);
	}

	@Override
	public GoodsVO goodsView(String goodsName) throws Exception {
		return dao.goodsView(goodsName);
	}
	
	@Override
	public GoodsVO goodsViewByGoodsCode(String goodsCode) throws Exception {
		return dao.goodsViewByGoodsCode(goodsCode);
	}
	@Override
	public void registerReply(GoodsReplyVO reply) throws Exception {
		dao.registerReply(reply);
	}

	@Override
	public List<GoodsReplyListVO> replyList(String goodsName) throws Exception {
		return dao.replyList(goodsName);
	}

	@Override
	public void deleteReply(String replyNumber) throws Exception {
		dao.deleteReply(replyNumber);
	}

	@Override
	public String idCheck(String replyNumber) throws Exception {
		return dao.idCheck(replyNumber);
	}

	@Override
	public GoodsReplyVO selectReplyByNumber(String replyNumber) throws Exception {
		return dao.selectReplyByNumber(replyNumber);
	}

	@Override
	public void replyModify(GoodsReplyVO vo) throws Exception {
		dao.replyModify(vo);
	}

	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}

	@Override
	public List<GoodsReplyRatingVO> goodsReplyList(String firstClassification) throws Exception {
		return dao.goodsReplyList(firstClassification);
	}

	@Override
	public List<CartListVO> cartList(String userid) throws Exception {
		return dao.cartList(userid);
	}

	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}

	@Override
	public void deleteAllCart(String userId) throws Exception {
		dao.deleteAllCart(userId);
	}

	@Override
	public void deleteAllCartByGoodsCode(String goodsCode) throws Exception {
		dao.deleteAllCartByGoodsCode(goodsCode);
	}
	
	@Override
	public void orderCart(OrderVO vo) throws Exception {
		dao.orderCart(vo);
	}

	@Override
	public void orderCartGoods(OrderedGoodsVO vo) throws Exception {
		dao.orderCartGoods(vo);
	}

	@Override
	public List<OrderedGoodsVO> getOrderedGoods(String orderId) throws Exception {
		return dao.getOrderedGoods(orderId);
	}

	@Override
	public List<OrderedGoodsVO> getOrderedGoodsByEmail(String userId) throws Exception {
		return dao.getOrderedGoodsByEmail(userId);
	}
	
	@Override
	public void decreaseStock(GoodsVO vo) throws Exception {
		dao.decreaseStock(vo);
	}
}