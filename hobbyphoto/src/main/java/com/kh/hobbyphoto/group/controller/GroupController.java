package com.kh.hobbyphoto.group.controller;

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

import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.group.model.service.GroupServiceImpl;
import com.kh.hobbyphoto.group.model.vo.GroupD;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.member.model.vo.Member;

@Controller
public class GroupController {
	@Autowired
	private GroupServiceImpl GService;
	
	@RequestMapping("togetherList.tg")
	public ModelAndView selectTogetherList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = GService.selectTgListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		ArrayList<Sgroup> list = GService.selectTgList(pi);
		ArrayList<GroupD> pro = GService.selectPeopleImg();
		mv.addObject("pi", pi).addObject("list", list).addObject("pro", pro).setViewName("group/selectTogetherList");
		
		return mv;
	}
	
	@RequestMapping("togetherDetail.tg")
	public String selcetTogether(int gno, Model model) {
		Sgroup sg = GService.selectTgBoard(gno); 
		ArrayList<GroupD> list = GService.selectGroupPeople(gno);
		model.addAttribute("sg", sg);
		model.addAttribute("list", list);
		return "group/togetherDetailView";
	}
	
	@RequestMapping("enrollFormView.tg")
	public String enrollForm() {
		return "group/togetherEnrollForm";
	}
		
	@RequestMapping("tgInsert.tg")
	public String insertTogether(@ModelAttribute("g") Sgroup g, @RequestParam("upfile") MultipartFile upfile, Model model, HttpSession session) {

	    if (upfile != null && !upfile.isEmpty()) {
	        String changeName = saveFile(upfile, session);
	        
	        // changeName으로 img 변환
	        g.setImg(changeName);
	    }

	    int result = GService.insertSgBoard(g);

	    if (result > 0) {
	        session.setAttribute("alertMsg", "게시물 등록이 성공했습니다.");
	        return "redirect:togetherList.tg";
	    } else {
	        model.addAttribute("errorMsg", "게시물 등록에 실패했습니다.");
	        return "common/errorPage";
	    }
	}

	public String saveFile(MultipartFile upfile, HttpSession session) {
	    String originName = upfile.getOriginalFilename();
	    String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	    int ranNum = (int)(Math.random() * 90000 + 10000); 
	    String ext = originName.substring(originName.lastIndexOf("."));
	    String changeName = currentTime + ranNum + ext; 
	    String savePath = session.getServletContext().getRealPath("/resources/upfiles/");

	    try {
	        File dest = new File(savePath, changeName);
	        upfile.transferTo(dest);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return changeName;
	}
	
	@RequestMapping("delete.tg")
	public String deleteTogether(@RequestParam(required = false) Integer gno, String filePath, HttpSession session, Model model) {
		System.out.println(gno);
		int result = GService.deleteTogether(gno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:togetherList.tg";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	//모임
	@RequestMapping("enroll.tg")
	public String enrollGroup(@RequestParam(required = false) Integer gno, @RequestParam(required = false) Integer uno, HttpSession session, Model model) {
	    GroupD gr = new GroupD();
	    gr.setGroupNo(gno);
	    gr.setUserNo(uno);


	    int result = GService.enrollGroup(gr);

	    if(result > 0) {
	        session.setAttribute("alertMsg", "모임 신청이 완료되었습니다.");
	    } else {
	        session.setAttribute("alertMsg", "모임 신청에 실패했습니다.");
	    }
	    return "redirect:togetherList.tg";
	}
	
	@RequestMapping("dropOut.tg")
	public String deleteMember(@RequestParam(required = false) Integer gno, @RequestParam(required = false) Integer uno, HttpSession session) {
	    GroupD gr = new GroupD();
	    gr.setGroupNo(gno);
	    gr.setUserNo(uno);

		int result = GService.deleteMember(gr);
		System.out.println(result);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "모임 신청을 취소했습니다.");
		} else {
			session.setAttribute("alertMsg", "모임 신청 취소를 실패했습니다.");
		}
		return "redirect:togetherList.tg";
	}


	
}
