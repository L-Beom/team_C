package com.spring.myapp.persistence;

import java.util.List;

import com.spring.myapp.domain.CartListVO;
import com.spring.myapp.domain.CartVO;
import com.spring.myapp.domain.GoodsReplyListVO;
import com.spring.myapp.domain.GoodsReplyRatingVO;
import com.spring.myapp.domain.GoodsReplyVO;
import com.spring.myapp.domain.GoodsVO;
import com.spring.myapp.domain.OrderVO;
import com.spring.myapp.domain.OrderedGoodsVO;

public interface ShopDAO {

	// 상품 1차분류로 조회
	public List<GoodsVO> goodsList(String firstClassification) throws Exception;

	// 상품 이름으로 상세조회 
	public GoodsVO goodsView(String goodsName) throws Exception;
	
	// 상품 코드로 상세조회 
	public GoodsVO goodsViewByGoodsCode(String goodsCode) throws Exception;
	
	// 상품소감
	public void registerReply(GoodsReplyVO reply) throws Exception;

	// 상품소감 리스트
	public List<GoodsReplyListVO> replyList(String goodsName) throws Exception;

	// 상품소감(댓글) 삭제
	public void deleteReply(String replyNumber) throws Exception;

	// 아이디 체크
	public String idCheck(String replyNumber) throws Exception;

	// reply number로 select
	public GoodsReplyVO selectReplyByNumber(String replyNumber) throws Exception;

	// 댓글 수정
	public void replyModify(GoodsReplyVO vo) throws Exception;

	// 카트 담기
	public void addCart(CartVO cart) throws Exception;

	// 전체 상품 좋아요 댓글 갯수 리스트
	public List<GoodsReplyRatingVO> goodsReplyList(String firstClassification) throws Exception;

	// 카트 리스트
	public List<CartListVO> cartList(String userid) throws Exception;

	// 카트 삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	// 카트 전부 삭제
	public void deleteAllCart(String userId) throws Exception;
	
	// 상품 코드로 상품 전체 삭제
	public void deleteAllCartByGoodsCode(String goodsCode) throws Exception;
	
	// 주문
	public void orderCart(OrderVO vo) throws Exception;

	// 상품 주문
	public void orderCartGoods(OrderedGoodsVO vo) throws Exception;

	// 상품번호로 상품 주문한거 가져오기
	public List<OrderedGoodsVO> getOrderedGoods(String orderId) throws Exception;

	// 이메일로 상품 주문한거 가져오기
	public List<OrderedGoodsVO> getOrderedGoodsByEmail(String userId) throws Exception;
	
	// 주문시 상품 수량 감소
	public void decreaseStock(GoodsVO vo) throws Exception;
}