package com.kh.hobbyphoto.admin.controller;

import java.io.File;
import java.util.ArrayList;
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
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;
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
	
	// 회원 목록 조회	
	@RequestMapping("mlist.me")
	public ModelAndView selectMember(ModelAndView mv) {
		
		ArrayList<Member> list = aService.selectMember();
		
		mv.addObject("list",list).setViewName("admin/memberManage");
		
		return mv;
	}
	
	// 회원 삭제 서비스
	@RequestMapping("mdelete.me")
	public String deleteMember(String userId, HttpSession session, Model model) { 
		
		int result = aService.deleteMember(userId);
		
		if(result > 0) { // 삭제 성공	
			session.setAttribute("alertMsg", "성공적으로 회원정보가 삭제되었습니다.");
			return "redirect:mlist.me";
		}else { // 삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
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
	
	// 신고회원 관리 페이지로 연결
	@RequestMapping("rlist.me")
	public String reportManage() {
		
		return "admin/reportManage";
	}
	
	// 상품 매출 현황으로 연결
	@RequestMapping("achart.pr")
	public String adminCharts() {
		
		return "admin/adminCharts";
	}
	
	// 하비포토 메인 페이지로 이동
	@RequestMapping("main.ho")
	public String main() {
		return "main";
	}
	
	@RequestMapping("alist.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Board> list = aService.selectList(pi);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("board/boardListView");
		
		return mv;
	}
	
	@RequestMapping("aenrollForm.bo")
	public String enrollForm() {

		return "board/boardEnrollForm";
	}
	
	@RequestMapping("adetail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		// bno에는 상세조회하고자 하는 해당 게시글 번호 담겨있음
		
		// 해당 게시글 조회수 증가 서비스 호출 결과 받기 (update 하고 옴)
		int result = aService.increaseCount(bno);
		
		if(result  > 0) {
			// >> 성공적으로 조회수 증가
			//		>> boardDetailView.jsp 상에 필요한 데이터 조회 (게시글 상세정보 조회 서비스 호출)
			//		>> 조회된 데이터 담아서
			//		>> board/boardDetailView.jsp로 포워딩
			
			Board b = aService.selectBoard(bno);
			mv.addObject("b", b).setViewName("board/boardDetailView");
		}else {
			// >> 조회수 증가 실패
			//		>> 에러문구 담아서 에러페이지 포워딩
			mv.addObject("errorMsg", "상세조회실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("adelete.bo")
	public String deleteBoard(int bno, String filePath, HttpSession session, Model model) { 
		// filePath="resources/uploadFiles/xxxx.jpg" | ""
		
		int result = aService.deleteBoard(bno);
		
		if(result > 0) {
			// 삭제 성공
			
			// 첨부파일이 있었을 경우 => 파일 삭제
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			
			// 게시판 리스트 페이지 list.bo url 재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:list.bo";
			
		}else {
			// 삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}

	@RequestMapping("aupdateForm.bo")
	public String updateForm(int bno, Model model) {
		model.addAttribute("b", aService.selectBoard(bno));
		return "board/boardUpdateForm";
	}
	
	@RequestMapping("update.bo")
	public String updateBoard(@ModelAttribute Board b, MultipartFile reupfile, HttpSession session, Model model) {
		
		int result = aService.updateBoard(b);
		
		if(result > 0) { // 수정 성공	=> 상세페이지	detail.bo?bno=해당게시글번호	url 재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:detail.bo?bno=" + b.getBoardNo();
			
		}else { // 수정 실패 => 에러페이지
			model.addAttribute("errorMsg", "게시글 수정 실패!");
			return "common/errorPage";
		}
	}
	
}
