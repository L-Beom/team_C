package com.spring.myapp.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.myapp.domain.CartListVO;
import com.spring.myapp.domain.CartVO;
import com.spring.myapp.domain.GoodsReplyListVO;
import com.spring.myapp.domain.GoodsReplyRatingVO;
import com.spring.myapp.domain.GoodsReplyVO;
import com.spring.myapp.domain.GoodsVO;
import com.spring.myapp.domain.MemberVO;
import com.spring.myapp.domain.OrderVO;
import com.spring.myapp.domain.OrderedGoodsVO;
import com.spring.myapp.service.ShopService;
import com.spring.myapp.service.AdminService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

	@Inject
	ShopService service;

	// 카테고리별 상품 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") String firstClassification, Model model) throws Exception {
		logger.info("get list");

		System.out.println("classification>>" + firstClassification);

		List<GoodsReplyRatingVO> list = service.goodsReplyList(firstClassification);

		model.addAttribute("list", list);

	}

	// 상품 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") String goodsName, Model model) throws Exception {
		logger.info("get view");

		GoodsVO view = service.goodsView(goodsName);
		view.setGoodsName(goodsName);
		model.addAttribute("view", view);

		List<GoodsReplyListVO> reply = service.replyList(goodsName);
		model.addAttribute("reply", reply);
	}

	// 상품 조회 - 상품 댓글
	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String registerReply(GoodsReplyVO reply, HttpSession session) throws Exception {
		logger.info("register reply");

		MemberVO member = (MemberVO) session.getAttribute("member");
		reply.setUserid(member.getEmail());

		// reply number 생성
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < 8; i++) {
			if (rnd.nextBoolean()) {
				buf.append((char) ((int) (rnd.nextInt(26)) + 97));
			} else {
				buf.append((rnd.nextInt(10)));
			}
		}

		reply.setReplyNumber(buf.toString());
		System.out.println(reply);
		service.registerReply(reply);

		// 한글꺠짐 처리
		String output = URLEncoder.encode(reply.getGoodsName(), "UTF-8");

		return "redirect:/shop/view?n=" + output;
	}

	// 댓글 삭제
	@RequestMapping(value = "/view/delete", method = RequestMethod.POST)
	public String postReplyDelete(@RequestParam("s") String replyNumber, HttpSession session) throws Exception {
		logger.info("post view delete");
		GoodsReplyVO reply = service.selectReplyByNumber(replyNumber);

		System.out.println("reply>>" + reply);

		service.deleteReply(reply.getReplyNumber());

		// 한글꺠짐 처리
		String output = URLEncoder.encode(reply.getGoodsName(), "UTF-8");

		return "redirect:/shop/view?n=" + output;
	}

	// 댓글 삭제 리다이렉트
	@RequestMapping(value = "/view/goback", method = RequestMethod.POST)
	public String postGoBack(@RequestParam("n") String goodsName, Model model) throws Exception {
		logger.info("post go back");

		// 한글꺠짐 처리
		String output = URLEncoder.encode(goodsName, "UTF-8");

		return "redirect:/shop/view?n=" + output;
	}

	// 댓글 수정
	@RequestMapping(value = "/view/modify", method = RequestMethod.POST)
	public String postUpdateReply(@RequestParam("n") String replyNumber, Model model, GoodsReplyVO replyVO)
			throws Exception {
		logger.info("post update reply");

		GoodsReplyVO reply = service.selectReplyByNumber(replyNumber);

		System.out.println("modify>>" + reply);
		System.out.println("reply data VO>>" + replyVO);
//		service.replyModify(replyNumber);

		// 한글꺠짐 처리
		String output = URLEncoder.encode(reply.getGoodsName(), "UTF-8");

		return "redirect:/shop/view?n=" + output;
	}

	// 댓글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getUpdateReply(@RequestParam("n") String replyNumber, Model model) throws Exception {
		logger.info("get update reply");

		GoodsReplyVO reply = service.selectReplyByNumber(replyNumber);
		model.addAttribute("reply", reply);

	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String updateReply(@RequestParam("n") String replyNumber, GoodsReplyVO reply) throws Exception {
		logger.info("post update reply");

		System.out.println("modify replyvo>>>" + reply);
		reply.setReplyNumber(replyNumber);

		service.replyModify(reply);

		return "redirect:/shop/reload";
	}

	// 수정용 페이지 리로드
	@RequestMapping(value = "/reload", method = RequestMethod.GET)
	public void getReload() throws Exception {
		logger.info("get reload");
	}

	// 카트 추가
	@ResponseBody
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) throws Exception {
		logger.info("post cart");

		int result = 0;
		System.out.println("cartVO>>" + cart);
		MemberVO member = (MemberVO) session.getAttribute("member");

		// 비회원 차단
		if (member == null) {
			return result;
		}

		
		List<CartListVO> cartList = service.cartList(member.getEmail());
		// 중복된 상품을 넣기 위한 맵
		Map<String, Integer> map = new HashMap<String, Integer>();

		// 중복 상품 카트 수 합치기
		for (CartListVO cartListVO : cartList) {
			int num = cartList.stream().filter(s -> s.getGoodsCode().equals(cartListVO.getGoodsCode()))
					.map(CartListVO::getCartStock)
					.mapToInt(Integer::valueOf)
					.sum();

			map.put(cartListVO.getGoodsCode(), num);
		}

		if (member != null) {
			cart.setUserid(member.getEmail());

			// 카트안에 똑같은 상품이 들었으면
			if (map.get(cart.getGoodsCode()) != null) {

				// 해당 상품번호로 현재 들어있는 중복된 상품을 전부 삭제후 카트 수량을 더한 후 다시 삽입
				service.deleteAllCartByGoodsCode(cart.getGoodsCode());
				cart.setCartStock(cart.getCartStock() + map.get(cart.getGoodsCode()));

			}
			service.addCart(cart);
			result = 1;
		}

		System.out.println("after cartVO>>" + cart);

		return result;
	}

	// 카트 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
		logger.info("get cart list");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getEmail();

		List<CartListVO> cartList = service.cartList(userId);

		model.addAttribute("cartList", cartList);
	}

	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart)
			throws Exception {
		logger.info("delete cart");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userid = member.getEmail();

		int result = 0;
		int cartNumber = 0;
		if (chArr.isEmpty()) {
			return result;
		}

		if (member != null) {
			cart.setUserid(userid);

			for (String i : chArr) {
				cartNumber = Integer.parseInt(i);
				cart.setCartNumber(cartNumber);
				service.deleteCart(cart);
			}
			result = 1;
		}
		return result;
	}

	// 카트 목록
	@RequestMapping(value = "/orderCart", method = RequestMethod.GET)
	public void getOrderCart(HttpSession session, Model model) throws Exception {
		logger.info("get order cart");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getEmail();

		List<CartListVO> cartList = service.cartList(userId);

		model.addAttribute("cartList", cartList);
	}

	// 카트 목록
	@RequestMapping(value = "/orderCart", method = RequestMethod.POST)
	public String postOrderCart(OrderVO order, HttpSession session, Model model) throws Exception {
		logger.info("post order cart");
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getEmail();
		List<CartListVO> cartList = service.cartList(userId);

		// orderId 생성
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < 8; i++) {
			if (rnd.nextBoolean()) {
				buf.append((char) ((int) (rnd.nextInt(26)) + 97));
			} else {
				buf.append((rnd.nextInt(10)));
			}
		}
		order.setOrderId(buf.toString());
		order.setUserId(userId);
		System.out.println("ORDERVO>>>" + order);

		service.orderCart(order);

		OrderedGoodsVO ordered = new OrderedGoodsVO();
		ordered.setOrderId(buf.toString());
		for (CartListVO cartListVO : cartList) {
			ordered.setGoodsName(cartListVO.getGoodsName());
			ordered.setGoodsCode(cartListVO.getGoodsCode());
			ordered.setCartStock(cartListVO.getCartStock());
			ordered.setGoodsPrice(cartListVO.getGoodsPrice());

			// 상품 주문시 수량 감소
			GoodsVO view = service.goodsView(cartListVO.getGoodsName());
			int num = view.getGoodsStock() - cartListVO.getCartStock();

			view.setGoodsStock(num);
			service.decreaseStock(view);

			System.out.println("GOODS PRICE>>" + cartListVO.getGoodsPrice());
			ordered.setGoodsThumbnailImage(cartListVO.getGoodsThumbnailImage());
			service.orderCartGoods(ordered);
		}
		service.deleteAllCart(userId);

		return "redirect:/shop/confirmOrder?o=" + buf.toString();
	}

	// 주문 확인
	@RequestMapping(value = "/confirmOrder", method = RequestMethod.GET)
	public void getConfirmOrder(@RequestParam("o") String orderId, HttpSession session, Model model) throws Exception {
		logger.info("get order cart");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getEmail();

		List<CartListVO> cartList = service.cartList(userId);

		model.addAttribute("cartList", cartList);

		List<OrderedGoodsVO> ordered = service.getOrderedGoods(orderId);

		model.addAttribute("ordered", ordered);
		model.addAttribute("orderId", orderId);
		System.out.println(ordered);
	}

	// 주문 보기
	@RequestMapping(value = "/orderTrack", method = RequestMethod.GET)
	public void getOrderTrack(HttpSession session, Model model) throws Exception {
		logger.info("get order track");

		// 비회원 주문도 허용해야 함
		MemberVO member = null;
		String userId = null;
		try {
			member = (MemberVO) session.getAttribute("member");

			userId = member.getEmail();
			System.out.println("MEMBERVO>>" + member);
		} catch (Exception e) {
		}
		if (member == null) {
//			userId = "not signed";
		}
		// orderid로 리스트 출력
		List<OrderedGoodsVO> ordered = service.getOrderedGoodsByEmail(userId);

		model.addAttribute("ordered", ordered);

	}

	// 주문 보기
	@RequestMapping(value = "/orderTrackNotSignedIn", method = RequestMethod.GET)
	public void getOrderTrackNotSignedIn(@RequestParam("o") String orderId, HttpSession session, Model model)
			throws Exception {
		logger.info("get order track not signed in");

		List<OrderedGoodsVO> ordered = service.getOrderedGoods(orderId);

		for (OrderedGoodsVO orderedGoodsVO : ordered) {
			orderedGoodsVO.setOrderId(orderId);
		}

		model.addAttribute("ordered", ordered);

		System.out.println(ordered);
	}

	// 주문 보기 비회원
	@RequestMapping(value = "/orderTrack", method = RequestMethod.POST)
	public String postOrderTrack(String orderId, HttpSession session, Model model) throws Exception {
		logger.info("post order track");

		return "redirect:/shop/orderTrackNotSignedIn?o=" + orderId;
	}

	// 비회원 주문
	@RequestMapping(value = "/orderGood", method = RequestMethod.GET)
	public void getOrderGood(@RequestParam("n") String goodsName, HttpSession session, Model model) throws Exception {
		logger.info("get order good");
		GoodsVO view = service.goodsView(goodsName);
		view.setGoodsName(goodsName);
		model.addAttribute("view", view);

	}

	// 비회원 주문
	@RequestMapping(value = "/orderGood", method = RequestMethod.POST)
	public String postOrderGood(@RequestParam("n") String goodsName, OrderVO order, HttpSession session, Model model)
			throws Exception {
		logger.info("post order good");

		// 비회원 주문도 허용해야 함
		MemberVO member = null;
		String userId = null;
		try {
			member = (MemberVO) session.getAttribute("member");
			userId = member.getEmail();
		} catch (Exception e) {
		}
		if (member == null) {
			userId = "not signed";
		}
		GoodsVO view = service.goodsView(goodsName);
		System.out.println("OrderVO>>" + order);

		// orderId 생성
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < 8; i++) {
			if (rnd.nextBoolean()) {
				buf.append((char) ((int) (rnd.nextInt(26)) + 97));
			} else {
				buf.append((rnd.nextInt(10)));
			}
		}
		order.setOrderId(buf.toString());
		order.setUserId(userId);
		System.out.println("ORDERVO>>>" + order);

		service.orderCart(order);

		// 주문시 상품 갯수 감소
		view.setGoodsStock(view.getGoodsStock() - 1);
		service.decreaseStock(view);

		OrderedGoodsVO ordered = new OrderedGoodsVO();
		ordered.setGoodsName(goodsName);
		ordered.setGoodsCode(view.getGoodsCode());
		ordered.setGoodsPrice(view.getGoodsPrice());
		ordered.setGoodsThumbnailImage(view.getGoodsThumbnailImage());
		ordered.setOrderId(buf.toString());
		ordered.setCartStock(1);
		service.orderCartGoods(ordered);

		return "redirect:/shop/confirmOrderNotSigned?o=" + buf.toString();
	}

	// 비회원 주문 확인
	@RequestMapping(value = "/confirmOrderNotSigned", method = RequestMethod.GET)
	public void getConfirmOrderNotsigned(@RequestParam("o") String orderId, HttpSession session, Model model)
			throws Exception {
		logger.info("get order cart not signed");

		List<OrderedGoodsVO> ordered = service.getOrderedGoods(orderId);

		model.addAttribute("ordered", ordered);
		model.addAttribute("orderId", orderId);
		System.out.println(ordered);

	}

	// 주문목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, Model model) throws Exception {
		logger.info("get order list");

		// 비회원 주문도 허용해야 함
		MemberVO member = null;
		String userId = null;
		try {
			member = (MemberVO) session.getAttribute("member");
			userId = member.getEmail();
		} catch (Exception e) {
		}
		if (member == null) {
			userId = "not signed";
		}

	}

	// 주문목록
	@RequestMapping(value = "/orderList", method = RequestMethod.POST)
	public void postOrderList(@RequestParam("o") String orderId, HttpSession session, Model model) throws Exception {
		logger.info("get order list");

		// 비회원 주문도 허용해야 함
		MemberVO member = null;
		String userId = null;
		try {
			member = (MemberVO) session.getAttribute("member");
			userId = member.getEmail();
		} catch (Exception e) {
		}
		if (member == null) {
			userId = "not signed";
		}
		// orderid로 리스트 출력

		List<OrderedGoodsVO> ordered = service.getOrderedGoods(orderId);

		model.addAttribute("ordered", ordered);
		model.addAttribute("orderId", orderId);
		System.out.println(ordered);

	}

	// 주문목록
	@RequestMapping(value = "/orderListNotSigned", method = RequestMethod.POST)
	public void getOrderListNotSigned(@RequestParam("o") String orderId, HttpSession session, Model model)
			throws Exception {
		logger.info("get order list");

		// 비회원 주문도 허용해야 함
		MemberVO member = null;
		String userId = null;
		try {
			member = (MemberVO) session.getAttribute("member");
			userId = member.getEmail();
		} catch (Exception e) {
		}
		if (member == null) {
			userId = "not signed";
		}
		// orderid로 리스트 출력

		List<OrderedGoodsVO> ordered = service.getOrderedGoods(orderId);

		model.addAttribute("ordered", ordered);
		model.addAttribute("orderId", orderId);
		System.out.println(ordered);

	}
}