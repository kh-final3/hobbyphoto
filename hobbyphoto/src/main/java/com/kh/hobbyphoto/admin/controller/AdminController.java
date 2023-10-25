package com.kh.hobbyphoto.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hobbyphoto.admin.model.service.AdminServiceImpl;
import com.kh.hobbyphoto.admin.model.vo.Admin.AdminReqDto;
import com.kh.hobbyphoto.board.model.vo.BackGround;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.model.vo.Report;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.shop.model.vo.Product;

@Controller
public class AdminController {
	
	@Autowired
	private AdminServiceImpl aService;
	
	// 관리자페이지 메인화면
	@RequestMapping("alist.da")
	public String adminIndex() {
		
		return "admin/adminIndex";
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
	public ModelAndView selectBoard(ModelAndView mv) {
		
		ArrayList<Board> list = aService.selectBoard();
		
		mv.addObject("list",list).setViewName("admin/postsManage");
		
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
	
	
	// 신고회원 관리 페이지로 연결
	@RequestMapping("rlist.me")
	public ModelAndView selectReport(ModelAndView mv) {
		
		ArrayList<Report> list = aService.selectReport();
		
		mv.addObject("list",list).setViewName("admin/reportManage");
		
		return mv;
	}
	
	// 하비포토 메인 페이지로 이동
	@RequestMapping("main.ho")
	public String main() {
		return "main";
	}
	
	// 관리자가 아닐 경우 관리자 로그인 창으로 돌아감
//    @GetMapping("/admin")
//    public String admin() {
//        User principal = (User) session.getAttribute("principal");
//        if (principal == null) {
//            return "redirect:/admin/adminlogin";
//        }
//        if (!principal.getRole().equals("ADMIN")) {
//            return "redirect:/admin/adminlogin";
//        }
//        return "admin/adminIndex";
//    }
    
    //관리자 로그인
//    @PostMapping("/admin/adminlogin")
//    public String loginAdmin(AdminReqDto adminReqDto, Model model) {
//        if (adminReqDto.getUsername() == null || adminReqDto.getUsername().isEmpty()) {
//            throw new CustomException("아이디를 입력해주세요");
//        }
//        if (adminReqDto.getPassword() == null || adminReqDto.getPassword().isEmpty()) {
//            throw new CustomException("패스워드를 입력해주세요");
//        }
//        User admin = userRepository.findByUsernameAndPassword(
//        		adminReqDto.getUsername(), adminReqDto.getPassword());
//        if (admin == null) {
//            throw new CustomException("아이디 또는 비밀번호가 다릅니다.");
//        }
//        if (!admin.getRole().equals("ADMIN")) {
//            throw new CustomException("관리자 계정이 아닙니다.");
//        }
//        session.setAttribute("principal", admin);
//        return "redirect:/admin/user";
//    }
    
	
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


