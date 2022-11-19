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
	
	@RequestMapping("/login_naver_callback.do")
	public String login_naver() {
		return Common.PATH + "login_naver_callback.jsp";
	}
	
	@RequestMapping("/login_authentication.do")
	public String login_authentication(TestVO vo, Model model) {
		TestVO vo1 = test_dao.selectEmail(vo.getEmail());
		
		if ( vo1 == null ) {
			vo.setId("naver");
			vo.setPwd("naver");
			model.addAttribute("vo", vo);
			return Common.PATH + "naver_join.jsp";
		}
		model.addAttribute("vo", vo1);
		return Common.PATH + "welcome.jsp";
	}
	
	@RequestMapping("/welcome.do")
	public String welcome(TestVO vo, Model model) {
		int res = test_dao.insert(vo);
		model.addAttribute("vo", vo);
		return Common.PATH + "welcome.jsp";
	}
}
