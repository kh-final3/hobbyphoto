package com.kh.hobbyphoto.member.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hobbyphoto.board.model.service.BoardServiceImpl;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.member.model.service.MemberServiceImpl;
import com.kh.hobbyphoto.member.model.vo.Block;
import com.kh.hobbyphoto.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired 
	private MemberServiceImpl ms;
	
	@Autowired
	private BoardServiceImpl bService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginForm.me")
	public String loginEnroll() {
		return "member/login";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,Model model,HttpSession session,ModelAndView mv,HttpServletResponse response) {
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
	
	@ResponseBody
	@RequestMapping("addCookie.me")
	public String addCookie(String userId,String cookie,HttpServletResponse response){
		Cookie cookieId = new Cookie("cookieId", userId);
		if(cookie.equals("")) {
			cookieId.setMaxAge(0);
			response.addCookie(cookieId);
		}else {
			response.addCookie(cookieId);
		}
		return "쿠키 생성 성공";
	}
	
	@RequestMapping("memberEnrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("Enroll.me")
	public String enroll(Member m,Model model,HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
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
	
	@RequestMapping("myBookmarks.me")
	public String myBookmarks(@RequestParam(value="cpage", defaultValue="1") int currentPage,HttpSession session,Model model) {
		int userNo = ((Member)session.getAttribute("loginMember")).getUserNo();
		int listCount = ms.myListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Board> list = bService.myBookmarksList(pi,userNo);
		model.addAttribute("listCount",listCount);
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		return "member/myBookmarks";
	}
	
	@RequestMapping("myBoard.me")
	public String myBoard(@RequestParam(value="cpage", defaultValue="1") int currentPage,HttpSession session,Model model) {
		int userNo = ((Member)session.getAttribute("loginMember")).getUserNo();
		int listCount = bService.myListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Board> list = bService.myBoardList(pi,userNo);
		model.addAttribute("listCount",listCount);
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		return "member/myBoard";
	}
	
	@RequestMapping("myGroup.me")
	public String myGroup(@RequestParam(value="cpage", defaultValue="1") int currentPage,HttpSession session,Model model) {
		int userNo = ((Member)session.getAttribute("loginMember")).getUserNo();
		int listCount = ms.myGroupCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Board> list = bService.myGroupList(pi,userNo);
		model.addAttribute("listCount",listCount);
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		return "member/myGroup";
	}
	
	@RequestMapping("myLike.me")
	public String myLike(@RequestParam(value="cpage", defaultValue="1") int currentPage,HttpSession session,Model model) {
		int userNo = ((Member)session.getAttribute("loginMember")).getUserNo();
		int listCount = ms.myLikeCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Board> list = bService.myLikeList(pi,userNo);
		model.addAttribute("listCount",listCount);
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		return "member/myLike";
	}
	@RequestMapping("myBlock.me")
	public String myBlock(@RequestParam(value="cpage", defaultValue="1") int currentPage,HttpSession session,Model model) {
		int userNo = ((Member)session.getAttribute("loginMember")).getUserNo();
		int listCount = ms.myBlockCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Block> list = bService.myBlockList(pi,userNo);
		
		model.addAttribute("listCount",listCount);
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		return "member/myBlock";
	}
	
	@RequestMapping("updateForm.me")
	public String updateMember() {
		return "member/update";
	}
	
	@ResponseBody
	@RequestMapping(value="updateNick.me",produces="text/html; charset=UTF-8")
	public String updateNick(Member m,HttpSession session) {
		int result = 0;
		String nickName = "";
		if(m.getNickName() !=null){
			 result = ms.updateNick(m);
		}
		if(result > 0) {
			Member loginMember = ms.loginMember(m);
			System.out.println(loginMember);
			session.setAttribute("loginMember", loginMember);
			nickName = m.getNickName();
		}
		
		return nickName;
	}
	
}
