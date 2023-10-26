package com.kh.hobbyphoto.admin.controller;

import java.util.ArrayList;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hobbyphoto.admin.model.service.AdminServiceImpl;
import com.kh.hobbyphoto.board.model.vo.BackGround;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.model.vo.Report;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminServiceImpl aService;
	
	// 관리자페이지 메인화면
	@RequestMapping("alist.da")
	public String adminIndex() {
		
		return "admin/adminIndex";
	}
	
	// 관리자페이지 신고회원 리스트
	@ResponseBody
	@RequestMapping(value="rmList.bo", produces="application/json; charset=utf-8")
	public String ajaxReportMList() {
		ArrayList<Report> list = aService.ajaxReportMList();
		//System.out.println(new Gson().toJson(list));
		return new Gson().toJson(list);
	}
	
	// 회원 목록 조회	
	@RequestMapping("mlist.me")
	public ModelAndView selectMember(ModelAndView mv) {
		
		ArrayList<Member> list = aService.selectMember();
		
		mv.addObject("list",list).setViewName("admin/memberManage");
		
		return mv;
	}
	
	// 회원 삭제 서비스
	@RequestMapping("mdelete.me")
	public String deleMember(String userId, HttpSession session, Model model) { 
		
		int result = aService.deleMember(userId);
		
		if(result > 0) { // 삭제 성공	
			session.setAttribute("alertMsg", "성공적으로 회원정보가 삭제되었습니다.");
			return "redirect:mlist.me";
		}else { // 삭제 실패
			model.addAttribute("errorMsg", "회원 정보 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	// 상품관리 페이지로 연결
	@RequestMapping("plist.pr")
	public String productManage() {
		
		return "admin/productManage";
	}
	
	// 게시글 관리 페이지로 연결
	@RequestMapping("blist.bo")
	public String postsManage() {
		
		return "admin/postsManage";
	}
	
	// 게시물관리-사진게시판 리스트로 이동
	@RequestMapping("plist.bo")
	public ModelAndView selectBoard(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectBoardCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Board> list = aService.selectBoard(pi);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("admin/postsManage");
		
		return mv;
	}
	
	// 사진 게시물 삭제 서비스
	@RequestMapping("pdelete.bo")
	public String deleBoard(String boardTitle, HttpSession session, Model model) { 
		
		int result = aService.deleBoard(boardTitle);
		
		if(result > 0) { // 삭제 성공	
			session.setAttribute("alertMsg", "성공적으로 사진 게시글이 삭제되었습니다.");
			return "redirect:plist.bo";
		}else { // 삭제 실패
			model.addAttribute("errorMsg", "사진 게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	// 게시물관리-장비게시판 리스트로 이동
	@RequestMapping("elist.bo")
	public ModelAndView selectBoard2(ModelAndView mv) {
		
		ArrayList<Board> list2 = aService.selectBoard2();
		
		mv.addObject("list2",list2).setViewName("admin/postsManage");
		
		return mv;
	}
	
	// 게시물관리-모임게시판 리스트로 이동
	@RequestMapping("glist.bo")
	public ModelAndView selectBoard3(ModelAndView mv) {
		
		ArrayList<Sgroup> list3 = aService.selectBoard3();
		
		mv.addObject("list3",list3).setViewName("admin/postsManage");
		
		return mv;
	}
	
	// 게시물관리-배경화면게시판 리스트로 이동
	@RequestMapping("backlist.bo")
	public ModelAndView selectBoard4(ModelAndView mv) {
		
		ArrayList<BackGround> list4 = aService.selectBoard4();
		
		mv.addObject("list4",list4).setViewName("admin/postsManage");
		
		return mv;
	}
	
	
	// 신고 관리 페이지로 연결 (자동 페이징)
	@RequestMapping("rlist.me")
	public ModelAndView selectReport(ModelAndView mv) {
		
		ArrayList<Report> list = aService.selectReport();
		
		mv.addObject("list",list).setViewName("admin/reportManage");
		
		return mv;
	}
	
	// 신고 처리완료 버튼
	@RequestMapping("processed.me")
	public String processed(String rpNo, HttpSession session, Model model) { 
		
		int result = aService.processed(rpNo);
		
		if(result > 0) { // 삭제 성공	
			session.setAttribute("alertMsg", "신고가 성공적으로 처리되었습니다.");
			return "redirect:rlist.me";
		}else { 		 // 삭제 실패
			model.addAttribute("errorMsg", "신고 처리 실패");
			return "common/errorPage";
		}
	}
	
	// 하비포토 메인 페이지로 이동
	@RequestMapping("main.ho")
	public String main() {
		return "main";
	}
    
	
	// 관리자페이지 차트
	@RequestMapping("chart.da")
	public String adminCharts() {
		
		return "admin/adminCharts";
	}
	
	// 관리자페이지 관리자 통계
	@RequestMapping("table.da")
	public String adminTables() {
		
		return "admin/adminTables";
	}	
		
		
	}

	


