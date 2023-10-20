package com.kh.hobbyphoto.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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

		if(loginMember != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("redirect:/");
		} else {
			session.setAttribute("alertMsg", "아이디 또는 비밀번호가 다르거나, 존재하지 않는 회원입니다.");
			mv.setViewName("redirect:loginForm.me");
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
	
	@RequestMapping("findId.me")
	public String findId(HttpSession session) {
		session.setAttribute("find", "Id");
		return "member/findMember";
	}
	
	@RequestMapping("findPwd.me")
	public String findPwd(HttpSession session) {
		session.setAttribute("find", "Pwd");
		return "member/findMember";
	}
	
	@ResponseBody
	@RequestMapping(value="idSearch", produces = "apllication/json; charset=UTF-8")
	public String idSearch(String userName) {
		Member searchMember = ms.searchId(userName);
		return new Gson().toJson(searchMember);
	}
	
	@ResponseBody
	@RequestMapping(value="pwdSearch", produces = "apllication/json; charset=UTF-8")
	public String pwdSearch(String userId) {
		Member searchMember = ms.searchPwd(userId);
		return new Gson().toJson(searchMember);
	}
	
	@RequestMapping("updatePwd.me")
	public String updatePwd(Member m,HttpSession session,Model model) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		int result = ms.updatePwd(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 비밀번호를 변경했습니다.");
			return "redirect:loginForm.me";
		}else {
			model.addAttribute("errorMsg", "회원등록에 실패하였습니다.");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("deleteForm.me")
	public String deleteForm() {
		return "member/deleteMember";
	}
	
	@RequestMapping("delete.me")
	public String deleteMember(Member m,Model model,HttpSession session) {
		Member loginMember = ms.loginMember(m);
		if(loginMember != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())) {
			int result = ms.deleteMember(loginMember);
			if(result>0) {
				session.setAttribute("alertMsg", "정상처리 되었습니다, 감사합니다.");
				session.removeAttribute("loginMember");
				return "redirect:/";
			}else {
				model.addAttribute("errorMsg", "회원탈퇴에 실패하였습니다.");
				return "common/errorPage";
			}
		} else {
			session.setAttribute("alertMsg", "비밀번호가 다릅니다.");
			return "redirect:deleteForm.me";
		}
	}
	
	@RequestMapping("myBoard.me")
	public String myBoard() {
		return "member/myBoard";
	}
	
}
