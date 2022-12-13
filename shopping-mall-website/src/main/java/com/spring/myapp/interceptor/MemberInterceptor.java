package com.spring.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.myapp.domain.MemberVO;

public class MemberInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {

		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member == null) {
			res.sendRedirect("/member/signin");
			return false;
		}

		return true;
	}
}
