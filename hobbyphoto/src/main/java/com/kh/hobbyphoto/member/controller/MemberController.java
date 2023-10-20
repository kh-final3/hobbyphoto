package com.kh.hobbyphoto.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hobbyphoto.member.model.service.MemberServiceImpl;
import com.kh.hobbyphoto.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired 
	private MemberServiceImpl ms;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginForm.me")
	public String loginEnroll() {
		return "member/login";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,Model model,HttpSession session,ModelAndView mv) {
		Member loginMember = ms.loginMember(m);
		System.out.println(bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd()));
		if(loginMember != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "로그인실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("memberEnrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("Enroll.me")
	public String enroll(Member m,Model model,HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		//System.out.println(encPwd);
		
		int result = ms.insertMember(m);
		
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 회원등록 되었습니다");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg", "회원등록에 실패하였습니다.");
			return "common/errorPage";
		}
	
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("logout.me")
	public String logout(HttpSession session) {
		session.removeAttribute("loginMember");
		return "redirect:/";
	}
}
