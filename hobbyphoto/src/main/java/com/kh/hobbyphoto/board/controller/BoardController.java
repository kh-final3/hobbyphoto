package com.kh.hobbyphoto.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hobbyphoto.board.model.service.BoardServiceImpl;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;

@Controller
public class BoardController {
	@Autowired
	private BoardServiceImpl bService;
	
	@RequestMapping("phBoardList.bo")
	public ModelAndView selectPhBoardList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = bService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/selectPhBoardList");
		
		return mv;
	}
	
	@RequestMapping("phDetail.bo")
	public String selectPhBoard(int phno, Model model) {
		int result = bService.increaseCount(phno);
		
		// 해당 게시글 조회수 증가 서비스 호출 결과 받기
		if (result > 0) {
			// >> 성공적으로 조회수 증가
			// 		>> boardDetailView.jsp 상에 필요한 데이터 조회 (게시글 상세정보 조회 서비스 호출)
			// 		>> 조회된 데이터 담아서
			// 		>> board/boardDetailView.jsp로 포워딩
			Board b = bService.selectBoard(phno);
			model.addAttribute("b", b);
			System.out.println(b);
			return "board/phBoardDetailView";
			
		} else {
			// >> 조회수 증가 실패
			// 		>> 에러문구 담아서 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 상세 조회 실패!");
			return "common/errorPage";
			
		}
	}
	

}
