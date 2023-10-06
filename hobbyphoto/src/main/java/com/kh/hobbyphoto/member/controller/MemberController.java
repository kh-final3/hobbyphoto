package com.kh.hobbyphoto.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hobbyphoto.member.model.service.MemberService;
import com.kh.hobbyphoto.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	
	@RequestMapping("login.me")
	public String loginMember(Member m,HttpSession session) {
		int result = mService.loginMember(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공!");
			return "main";
		}else {
			session.setAttribute("alertMsg", "실패!");
			return "main";
		}
	}
}
