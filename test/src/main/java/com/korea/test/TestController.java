package com.korea.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.TestDAO;
import util.Common;
import vo.TestVO;
@Controller
public class TestController {
	TestDAO test_dao;
	public void setTest_dao(TestDAO test_dao) {
		this.test_dao = test_dao;
	}
	
	@RequestMapping(value= {"/", "/login.do", "/logout.do"})
	public String adress(TestVO vo) {
		return Common.PATH + "index.jsp";
	}
	
	// 네이버용 Callback
	@RequestMapping("/login_naver_callback.do")
	public String login_naver() {
		return Common.PATH + "login_naver_callback.jsp";
	}
	
	// 카카오용 Redirect
	@RequestMapping("/login_kakao_redirect.do")
	public String login_kakao() {
		return Common.PATH + "login_kakao_redirect.jsp";
	}
	
	@RequestMapping("/login_authentication.do")
	public String login_authentication(TestVO vo, Model model) {
		TestVO vo1 = test_dao.selectEmail(vo);
		
		if ( vo1 == null ) { // 조회된 값이 없을때
			if ( vo.getId().equals("kakao") ) {
				System.out.println(vo.getId());
				model.addAttribute("vo", vo);
				return Common.PATH + "kakao_join.jsp";
			}
			vo.setId("naver");
			vo.setPwd("naver");
			model.addAttribute("vo", vo); // Callback에서 가져온 값을 바인딩
			return Common.PATH + "naver_join.jsp"; // 회원가입 페이지로 포워딩
		}
		model.addAttribute("vo", vo1); // DB에서 가져온 값을 바인딩
		return Common.PATH + "welcome.jsp"; // 환영 페이지로 포워딩
	}
	
	@RequestMapping("/welcome.do")
	public String welcome(TestVO vo, Model model) {
		int res = test_dao.insert(vo);
		model.addAttribute("vo", vo);
		return Common.PATH + "welcome.jsp";
	}
}
