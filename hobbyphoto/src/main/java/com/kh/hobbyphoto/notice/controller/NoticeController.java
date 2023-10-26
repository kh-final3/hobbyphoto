package com.kh.hobbyphoto.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.notice.model.service.NoticeServiceImpl;
import com.kh.hobbyphoto.notice.model.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeServiceImpl nService;
	
	@RequestMapping("shNotice.list")
	public ModelAndView selectShopNotice(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv){ 
		int listCount = nService.selectShopListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Notice> list = nService.selectShopList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("notice/selectShopNoticeList");
		return mv;
	}
	
	@RequestMapping("shDetail.list")
	public String selectShNotice(int shno, Model model) {
		int result = nService.increaseShCount(shno);
		
		if(result > 0) {
			ArrayList<Notice> n = nService.selectShNotice(shno);
			
			model.addAttribute("n", n);
			
			return "notice/shNoticeDetailView";
		} else {
			model.addAttribute("errorMsg", "게시글 상세 조회 실패!");
			return "common/errorPage";
		}
	}
	
}
