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

@Controller
public class BoardController {
	@Autowired
	private BoardServiceImpl bService;
	
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = bService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/boardListView");
		
		return mv;
	}
	
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "board/boardEnrollForm";
	}
	
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			System.out.println(changeName);
			
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/" + changeName);
		}
		
		
		int result = bService.insertBoard(b);
		
		if(result > 0) { // 성공 => 게시글 리스트페이지(list.bo url 재요청)
			session.setAttribute("alertMsg", "게시글 등록에 성공했습니다.");
			return "redirect:list.bo";
		} else { // 실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		  // 파일명 수정 작업 후 서버에 업로드 시키기("flower.png" => "2023100412345.png") 
		 String originName = upfile.getOriginalFilename(); // "flower.png"
		  
		  // "2023100412345" ("년월일시분초") 
		 String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "202031004143508"
		  int ranNum = (int)(Math.random()* 90000 + 10000); // 21381 (5자리 랜덤값) 
		  String ext = originName.substring(originName.lastIndexOf("."));
		  
		  String changeName = currentTime + ranNum + ext; //"202320055470821318.png"
		  
		  // 업로드 시키고자 하는 폴더의 물리적인 경로를 알아내기
		  
		  String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		  
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
		 
		}
	
	@RequestMapping("detail.bo")
	public String selectBoard(int bno, Model model) {
		int result = bService.increaseCount(bno);
		
		// 해당 게시글 조회수 증가 서비스 호출 결과 받기
		if (result > 0) {
			Board b = bService.selectBoard(bno);
			model.addAttribute("b", b);
			System.out.println(b);
			return "board/boardDetailView";
			
		} else {
			// >> 조회수 증가 실패
			// 		>> 에러문구 담아서 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 상세 조회 실패!");
			return "common/errorPage";
			
		}
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int bno, String filePath, HttpSession session, Model model) { 
		int result = bService.deleteBoard(bno);
		
		if(result > 0) {
			// 삭제 성공
			
			// 첨부파일이 있었을 경우 => 파일 삭제
			if(!filePath.equals("")) { // filePath = "resources/uploadFiles/xxxx.jpg" | ""
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			// 게시판 리스트 페이지 list.bo url 재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:list.bo";
			
		} else {
			// 삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("updateForm.bo")
	public String updateForm(int bno, Model model) {
		model.addAttribute("b", bService.selectBoard(bno));
		return "board/boardUpdateForm";
	}
	
	@RequestMapping("update.bo")
	public String updateBoard(Board b, MultipartFile reupfile, HttpSession session, Model model) {
		
		// 새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기
			if(b.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
			}
			// 새로 넘어온 첨부파일 서버 업로드 시키기
			String changeName = saveFile(reupfile, session);
			
			// b에 새로 넘어온 첨부파일에 대한 원본명, 저장경로 담기
			b.setOriginName(reupfile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/" + changeName);
			}
			
			int result = bService.updateBoard(b);
			
			if(result > 0) {
				// 수정 성공 => 상세페이지 detail.bo   url 재요청
				model.addAttribute("alertMsg", "게시글 수정에 성공했습니다.");
				return "redirect:detail.bo?bno=" + b.getBoardNo();
			} else {
				// 수정 실패 => 에러페이지
				model.addAttribute("errorMsg", "게시물 수정에 실패했습니다.");
				return "common/errorPage";
			}
			
		}
	
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int bno) { 
		ArrayList<Reply> list = bService.selectReplyList(bno);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="rinsert.bo")
	public String ajaxInsertReply(Reply r) {
		int result = bService.insertReply(r);
		return result > 0 ? "success" : "fail";
		
	}
	
	@ResponseBody
	@RequestMapping(value="topList.bo", produces="application/json; charset=UTF-8")
	public String ajaxTopBoardList() {
		ArrayList<Board> list = bService.selectTopBoardList();
		return new Gson().toJson(list);
	}
}
