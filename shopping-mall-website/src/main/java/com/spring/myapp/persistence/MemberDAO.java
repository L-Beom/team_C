package com.spring.myapp.persistence;


import com.spring.myapp.domain.MemberVO;

public interface MemberDAO {
	// 회원가입
	public void signup(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
	// 회원정보 수정
	public void updateMember(MemberVO vo) throws Exception;
}
