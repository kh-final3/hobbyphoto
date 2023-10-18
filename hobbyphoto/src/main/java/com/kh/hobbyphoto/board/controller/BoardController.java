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
import com.kh.hobbyphoto.upfile.model.vo.Attachment;

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
		
		if (result > 0) {
			Board b = bService.selectpBoard(phno);
			model.addAttribute("b", b);
			return "board/phBoardDetailView";
			
		} else {
			model.addAttribute("errorMsg", "게시글 상세 조회 실패!");
			return "common/errorPage";
			
		}
	}
	
	@RequestMapping("phEnrollForm.bo")
	public String phEnrollForm() {
		return "board/phBoardEnrollForm";
	}
	
//	@RequestMapping("insert.bo")
//	public String insertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
//	    System.out.println(b);
//
//	    if (!upfile.getOriginalFilename().equals("")) {
//
//	        String changeName = saveFile(upfile, session);
//	        System.out.println(changeName);
//
//	        // 원본명, 서버업로드된 경로를 Attachment 객체에 담기
//	        Attachment attachment = new Attachment();
//	        attachment.setOrignName((upfile.getOriginalFilename()));
//	        attachment.setChangeName(attachment.get + changeName);
//
//	        // Attachment 객체를 Board 객체에 설정
//	        b.setAttachment(attachment);
//	    }
//
//	    int result = bService.insertBoard(b);
//
//	    if (result > 0) { // 성공 => 게시글 리스트페이지(list.bo url 재요청)
//	        session.setAttribute("alertMsg", "게시글 등록에 성공했습니다.");
//	        return "redirect:phBoardList.bo";
//	    } else { // 실패 => 에러페이지 포워딩
//	        model.addAttribute("errorMsg", "게시글 등록 실패");
//	        return "common/errorPage";
//	    }
//	}



	

}
