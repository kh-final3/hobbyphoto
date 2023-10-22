package com.kh.hobbyphoto.notice.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.notice.model.service.NoticeServiceImpl;
import com.kh.hobbyphoto.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeServiceImpl nService;

	@RequestMapping("list.no")
	public ModelAndView selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {

		int listCount = nService.selectListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 2);
		ArrayList<Notice> list = nService.selectList(pi);

		mv.addObject("pi", pi).addObject("list", list).setViewName("notice/noticeListView");

		return mv;
	}

	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		return "notice/noticeEnrollForm";
	}

	@RequestMapping("insert.no")
	public String insertNotice(Notice n, HttpSession session, Model model) {

		int result = nService.insertNotice(n);

		if (result > 0) { 
			session.setAttribute("alertMsg", "게시글 등록에 성공했습니다.");
			return "redirect:list.no";
		} else { 
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}

	@RequestMapping("detail.no")
	public String selectNotice(int noticeNo, Model model) {
		int result = nService.increaseCount(noticeNo);

		if (result > 0) {
			Notice n = nService.selectNotice(noticeNo);
			model.addAttribute("n", n);
			return "notice/noticeDetailView";

		} else {
			
			model.addAttribute("errorMsg", "게시글 상세 조회 실패!");
			return "common/errorPage";

		}
	}

	@RequestMapping("delete.no")
	public String deleteNotice(int noticeNo, HttpSession session, Model model) {
		int result = nService.deleteNotice(noticeNo);

		if (result > 0) {

			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:list.no";

		} else {
			
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}

	}

	@RequestMapping("updateForm.no")
	public String updateForm(int noticeNo, Model model) {
		model.addAttribute("n", nService.selectNotice(noticeNo));
		return "notice/noticeUpdateForm";
	}

	@RequestMapping("update.no")
	public String updateNotice(Notice n, HttpSession session, Model model) {
		System.out.println(n);
		int result = nService.updateNotice(n);

		if (result > 0) {
			
			model.addAttribute("alertMsg", "공지 수정에 성공했습니다.");
			return "redirect:detail.no?noticeNo=" + n.getNoticeNo();
		} else {
			// 수정 실패 => 에러페이지
			model.addAttribute("errorMsg", "공지 수정에 실패했습니다.");
			return "common/errorPage";
		}

	}
}
