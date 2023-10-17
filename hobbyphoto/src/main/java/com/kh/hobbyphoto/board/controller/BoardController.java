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
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/selectpBoardList");
		
		return mv;
	}
	

}
