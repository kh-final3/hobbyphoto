package com.kh.hobbyphoto.group.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.group.model.service.GroupService;
import com.kh.hobbyphoto.group.model.service.GroupServiceImpl;

@Controller
public class GroupController {
	@Autowired
	private GroupServiceImpl GService;
	
	@RequestMapping("togetherList.bo")
	public ModelAndView selectTogetherList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = GService.selectTgListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		ArrayList<Board> list = GService.selectTgList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("group/selectTogetherList");
		
		return mv;
		
	}
}
