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

import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.group.model.service.GroupService;
import com.kh.hobbyphoto.group.model.service.GroupServiceImpl;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.upfile.model.vo.Attachment;

@Controller
public class GroupController {
	@Autowired
	private GroupServiceImpl GService;
	
	@RequestMapping("togetherList.tg")
	public ModelAndView selectTogetherList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = GService.selectTgListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		ArrayList<Sgroup> list = GService.selectTgList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("group/selectTogetherList");
		
		return mv;
	}
	
	@RequestMapping("togetherDetail.tg")
	public String selcetTogether(int gno, Model model) {
		Sgroup g = GService.selectTgBoard(gno); 
		
		model.addAttribute("g", g);
		return "group/togetherDetailView";
	}
	
	@RequestMapping("enrollFormView.tg")
	public String enrollForm() {
		return "group/togetherEnrollForm";
	}
	
	@RequestMapping("tgInsert.tg")
	public String insertTogether(@ModelAttribute("g") Sgroup g,
	                             @RequestParam("upfile") MultipartFile upfile,
	                             Model model,
	                             HttpSession session) {

	    if (upfile != null && !upfile.isEmpty()) {
	        String changeName = saveFile(upfile, session);

	        g.setImg(changeName);
	    }

	    System.out.println(g);
	    int result = GService.insertSgBoard(g);

	    if (result > 0) {
	        session.setAttribute("alertMsg", "게시물 등록이 성공했습니다.");
	        return "redirect:togetherList.tg";
	    } else {
	        model.addAttribute("errorMsg", "게시물 등록에 실패했습니다.");
	        return "common/errorPage";
	    }
	}

	// 서버 폴더에 현재 받은 첨부 파일을 저장하는 역할
	public String saveFile(MultipartFile upfile, HttpSession session) {
	    String originName = upfile.getOriginalFilename();
	    String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	    int ranNum = (int)(Math.random() * 90000 + 10000); // 5자리 랜덤 값
	    String ext = originName.substring(originName.lastIndexOf("."));
	    String changeName = currentTime + ranNum + ext; //"202320055470821318.png"
	    String savePath = session.getServletContext().getRealPath("/resources/upfiles/");

	    try {
	        // 업로드된 파일을 서버에 저장
	        File dest = new File(savePath, changeName);
	        upfile.transferTo(dest);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return changeName;
	}

	

	
}
