package com.kh.hobbyphoto.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hobbyphoto.admin.model.service.AdminServiceImpl;
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
	
	/*
	@RequestMapping("regist.pro")
	public String insertproduct(Product p, MultipartFile[] upfile, HttpSession session, Model model) {
		
//		System.out.println(p);
//		for(int i = 0; i<upfile.length;i++) {
//			System.out.println(upfile[i]);
//		}
		
		
		for(int i = 0; i<upfile.length ; i++) {
			if(upfile[i].getSize()>0) {
				String changeName= saveFile(upfile[i],session);
				System.out.println(changeName);
				
				System.out.println("resources/proUpFiles/"+changeName);
				
				switch(i) {
	            case 0:
	                p.setThumbnail("resources/proUpFiles/" + changeName);
	                break;
	            case 1:
	                p.setPDimg("resources/proUpFiles/" + changeName);
	                break;
	            case 2:
	                p.setPSimg("resources/proUpFiles/" + changeName);
	                break;
	        }
				
			}
			
		}
//		int result = aService.insertProduct(p);
		
//		System.out.println(p);
//		System.out.println(result);
//		if(result>0) {//등록 성공
//			session.setAttribute("alertMsg", "성공적으로 상품이 등록되었습니다.");
//			return "admin/adminIndex";
//		}else {//등록 실패
//			model.addAttribute("errorMsg", "상품 등록 실패");
//			return "common/errorPage";
//		}
		
		
	}
		
		//현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장 시키는 역할
		public String saveFile(MultipartFile upfile, HttpSession session) {
			//파일명 수정 작업 후 서버에 업로드 시키기("flower.png" => "2023100412153012345.png")
			String originName = upfile.getOriginalFilename(); //"flower.png"
			
			//"20231004154605"(년월일시분초)
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());  //"20231004154627"
			
			int ranNum = (int)(Math.random() * 90000 + 10000); // 51346(5자리 랜덤값 생성)
			
			String ext = originName.substring(originName.lastIndexOf(".")); //확장자 => 원본파일명에 확장자 있음  ".png"
			
			String changeName = currentTime + ranNum + ext; //"2023100415462751346.png"
			
			//업로드 시키고자 하는 폴더의 물리적인 경로를 알아내기
			String savePath = session.getServletContext().getRealPath("/resources/proUpFiles/");
			
			//폴더에 파일을 넣기 위한 과정
			
			try {
				upfile.transferTo(new File(savePath +changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
		}
		*/
	
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


