package com.kh.hobbyphoto.board.controller;

import java.io.*;
import java.net.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hobbyphoto.board.model.service.BoardServiceImpl;
import com.kh.hobbyphoto.board.model.vo.*;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// *************출사명소시작************ //
	@RequestMapping("list.pl")
	public ModelAndView selectPlaceList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = bService.selectPlaceListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Place> list = bService.selectPlaceList(pi);
		System.out.println(pi);
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/placeListView");
		
		return mv;
	}	
	
	@RequestMapping("enrollForm.pl")
	public String plEnrollForm() {
		return "board/placeEnrollForm";
	}
	
	
	@RequestMapping("insert.pl")
	public String insertPlace(Place p, @RequestParam("upfile") MultipartFile[] upfiles, HttpSession session, Model model) {
	    ArrayList<Attachment> list = new ArrayList<>();

	    for (MultipartFile upfile : upfiles) {
	        if (upfile != null && !upfile.isEmpty()) {
	            String changeName = saveFile(upfile, session);

	            Attachment at = new Attachment();
	            at.setOriginName(upfile.getOriginalFilename());
	            at.setChangeName("resources/uploadFiles/" + changeName);
	            at.setFilePath("resources/board_upfiles");
	            list.add(at);
	        }
	    }

	    for (int i = 0; i < Math.min(list.size(), 4); i++) {
	        switch (i) {
	            case 0:
	                p.setPimg1(list.get(i).getChangeName());
	                break;
	            case 1:
	                p.setPimg2(list.get(i).getChangeName());
	                break;
	            case 2:
	                p.setPimg3(list.get(i).getChangeName());
	                break;
	            case 3:
	                p.setPimg4(list.get(i).getChangeName());
	                break;
	            default:
	                break;
	        }
	    }


	    int result = bService.insertPlace(p, list);

	    if (result > 0) {
	        session.setAttribute("alertMsg", "게시글 등록에 성공했습니다.");
	        return "redirect:list.pl";
	    } else {
	        model.addAttribute("errorMsg", "게시글 등록 실패");
	        return "common/errorPage";
	    }
	}
	public String savePlFile(MultipartFile upfile, HttpSession session) {
		
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
	
	@RequestMapping("detail.pl")
	public String selectPlace(int pno, Model model) {
		int result = bService.increaseCount(pno);
		if (result > 0) {
			Place p = bService.selectPlace(pno);
			model.addAttribute("p", p);
			return "board/placeDetailView";
			
		} else {
			model.addAttribute("errorMsg", "게시글 상세 조회 실패!");
			return "common/errorPage";
			
		}
	}
	
	@RequestMapping("delete.pl")
	public String deletePlace(int bno, String filePath, HttpSession session, Model model) { 
		int result = bService.deleteBoard(bno);
		
		if(result > 0) {
			// 삭제 성공
			
			// 첨부파일이 있었을 경우 => 파일 삭제
			if(!filePath.equals("")) { // filePath = "resources/uploadFiles/xxxx.jpg" | ""
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			// 게시판 리스트 페이지 list.bo url 재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:list.pl";
			
		} else {
			// 삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("updateForm.pl")
	public String plUpdateForm(int pno, Model model) {
		model.addAttribute("p", bService.selectPlace(pno));
		return "board/placeUpdateForm";
	}
	
	@RequestMapping("update.pl")
	public String updatePlace(Place p,Attachment at, MultipartFile reupfile, HttpSession session, Model model) {
		
		if(!reupfile.getOriginalFilename().equals("")) {
			
			if(at.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(at.getChangeName())).delete();
			}
			String changeName = saveFile(reupfile, session);
			
			at.setOriginName(reupfile.getOriginalFilename());
			at.setChangeName("resources/uploadFiles/" + changeName);
			}
			
			int result = bService.updatePlace(p);
			
			if(result > 0) {
				// 수정 성공 => 상세페이지 detail.bo   url 재요청
				model.addAttribute("alertMsg", "게시글 수정에 성공했습니다.");
				return "redirect:detail.pl?bno=" + p.getPno();
			} else {
				// 수정 실패 => 에러페이지
				model.addAttribute("errorMsg", "게시물 수정에 실패했습니다.");
				return "common/errorPage";
			}
			
		}
	
	@ResponseBody
	@RequestMapping(value="rlist.pl", produces="application/json; charset=UTF-8")
	public String placeReplyList(int pno) { 
		ArrayList<Reply> list = bService.placeReplyList(pno);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="rinsert.pl")
	public String placeInsertReply(Reply r) {
		int result = bService.placeInsertReply(r);
		return result > 0 ? "success" : "fail";
		
	}
	
	
	@RequestMapping("sortPlace.pl")
	public ModelAndView sortPlace(String keyword,@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = bService.selectPlaceListCount();
		HashMap<String, String> map = new HashMap<>(); 
		map.put("keyword",keyword);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Place> list = bService.sortPlaceList(pi, map);
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/placeListView");
		
		return mv;
	}
	
	@RequestMapping("festvalListView.fs")
	public String festivalView() {
		return "culture/festival";
	}
	
	@ResponseBody
	@RequestMapping(value="festvalList.fs", produces = "text/xml; charset=utf-8")
	public String festivalList() throws IOException {
		String url = "http://openapi.seoul.go.kr:8088";
		url += "/6b74516d52666267343266754f7574";
		url += "/xml";
		url += "/culturalEventInfo";
		url += "/1";
		url += "/50";
		url += "/축제";	
		
		URL requestUrl = new URL(url);
		
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));				
		
		String responseText = "";
		String line;
		while((line= br.readLine()) != null) {
			responseText += line;
		}
		
		
		br.close();
		urlConnection.disconnect();
		return responseText;	
	}
	
	@RequestMapping("exhibitListView.fs")
	public String exhibitView() {
		return "culture/exhibit";
	}
	
	
	@ResponseBody
	@RequestMapping(value="exhibitList.fs", produces = "text/xml; charset=utf-8")
	public String exhibitList() throws IOException {
		String url = "http://openapi.seoul.go.kr:8088";
		url += "/6b74516d52666267343266754f7574";
		url += "/xml";
		url += "/culturalEventInfo";
		url += "/1";
		url += "/10";
		url += "/전시";	
		
		URL requestUrl = new URL(url);
		
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));				
		
		String responseText = "";
		String line;
		while((line= br.readLine()) != null) {
			responseText += line;
		}
		
		
		br.close();
		urlConnection.disconnect();
		return responseText;	
	}
	
}
