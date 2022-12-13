package com.spring.myapp.service;

import javax.servlet.http.HttpSession;

import com.spring.myapp.domain.MemberVO;

public interface MemberService {
	//회원가입
	public void signup(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
	//로그아웃
	public void signout(HttpSession session) throws Exception;
	
	// 회원정보 수정
	public void updateMember(MemberVO vo) throws Exception;
		
}
