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
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		ArrayList<Board> list = bService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/selectPhBoardList");
		return mv;
	}
	
	@RequestMapping("phDetail.bo")
	public String selectPhBoard(int phno, Model model) {
		int result = bService.increaseCount(phno);
		
		if (result > 0) {
			Board b = bService.selectpBoard(phno); 
			ArrayList<Attachment> at = bService.selectAtBoard(phno);
			
			model.addAttribute("b", b);
			model.addAttribute("at", at);
			
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
	
	@RequestMapping("phInsert.bo")
	public String insertBoard(ArrayList<Attachment> at, Board b, MultipartFile[] uploadfiles, Model model, HttpSession session) {
	    System.out.println(at);

	    if (uploadfiles.length>0) {

	    	for(int i=0; i<uploadfiles.length;i++) {
	    		String changeName = saveFile(uploadfiles[i], session);
	    		
	    		System.out.println(changeName);
	    		
	    		// 원본명, 서버업로드된 경로를 Attachment 객체에 담기
	    		Attachment attachment = new Attachment();
	    		attachment.setOriginName((uploadfiles[i].getOriginalFilename()));
	    		attachment.setChangeName("resources/uploadFiles/" + changeName);
	    	}
	    }

	    int result = bService.insertBoard(b);
	    int result = bService.insertAtBoard(at);

	    if (result > 0) { // 성공 => 게시글 리스트페이지(list.bo url 재요청)
	        session.setAttribute("alertMsg", "게시글 등록에 성공했습니다.");
	        return "redirect:phBoardList.bo";
	    } else { // 실패 => 에러페이지 포워딩
	        model.addAttribute("errorMsg", "게시글 등록 실패");
	        return "common/errorPage";
	    }
	}

	
	// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 역할
	public String saveFile(MultipartFile uploadfiles, HttpSession session) {
		
	  // 파일명 수정 작업 후 서버에 업로드 시키기("flower.png" => "2023100412345.png") 
	 String originName = uploadfiles.getOriginalFilename(); // "flower.png"
	  
	 String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "202031004143508"
	  int ranNum = (int)(Math.random()* 90000 + 10000); // 21381 (5자리 랜덤값) 
	  String ext = originName.substring(originName.lastIndexOf("."));
	  
	  String changeName = currentTime + ranNum + ext; //"202320055470821318.png"
	  
	  String savePath = session.getServletContext().getRealPath("/resources/upfiles/");
	  
		try {
			uploadfiles.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	 
	}



	

}
