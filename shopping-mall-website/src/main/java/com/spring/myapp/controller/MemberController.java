package com.spring.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myapp.domain.MemberVO;
import com.spring.myapp.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;

	@Autowired
	BCryptPasswordEncoder passEncoder; // 비밀번호 암호화

	// 회원 가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
		logger.info("get signup");
	}

	// 회원 가입 post
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
		logger.info("post signup");

		String inputPass = vo.getPassword();
		String pass = passEncoder.encode(inputPass); // 비밀번호를 암호화
		vo.setPassword(pass); // 암호화된 비밀번호를 userPass에 저장

		service.signup(vo);

		return "redirect:/";
	}

	// 로그인 get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
		logger.info("get signin");
	}

	// 로그인 post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post signin");

		System.out.println("vo : " + vo);
		
		MemberVO login = service.signin(vo); // MemberVO형 변수 login에 로그인 정보를 저장
		if (login == null) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/signin";
		}
		
		// 현재 세션 정보를 가져옴
		HttpSession session = req.getSession();

		// DB의 비밀번호와 입력된 비밀번호를 비교
		boolean passMatch = passEncoder.matches(vo.getPassword(), login.getPassword()); 
		System.out.println("passMatch : " + passMatch);

		// 아이디가 존재하고(!=null), 비밀번호가 맞으면(PassMatch = true)
		if (login != null && passMatch) { 
			// member 세션에 로그인 정보를 부여
			session.setAttribute("member", login);

		} else { // 아이디가 존재하지 않고, 비밀번호가 틀리면
			session.setAttribute("member", null); // member 세션에 null 부여
			rttr.addFlashAttribute("msg", false); // 1회성인 변수인 msg에 false 부여
			return "redirect:/member/signin"; // 로그인 화면으로 이동
		}

		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		logger.info("get logout");

		service.signout(session);

		return "redirect:/";
	}

	// 나의 계정 보기 get
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public void account() throws Exception {
		logger.info("account");
	}

	// 나의 계정 보기 post
	@RequestMapping(value = "/account", method = RequestMethod.POST)
	public String postAccount(MemberVO vo, HttpServletRequest req) throws Exception {
		logger.info("post signup");
		HttpSession session = req.getSession(); 
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		System.out.println("세션 어트리뷰트>>" + member);
		vo.setEmail(member.getEmail());
		
		System.out.println(vo);
		service.updateMember(vo);
		
		service.signout(session);
		
		
		
		return "redirect:/";
	}
}
