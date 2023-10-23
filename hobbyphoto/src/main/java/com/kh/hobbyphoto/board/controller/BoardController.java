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
		
		int listCount = bService.selectPhListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		ArrayList<Board> list = bService.selectPhList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/selectPhBoardList");
		return mv;
	}
	
	@RequestMapping("phDetail.bo")
	public String selectPhBoard(int phno, Model model) {
		int result = bService.increaseCount(phno);
		
		if (result > 0) {
			Board b = bService.selectPhBoard(phno); 
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
	public String insertPhBoard(Board b, MultipartFile[] upfiles, Model model, HttpSession session) {
		
        ArrayList<Attachment> list = new ArrayList<>();

        for (int i = 0; i < upfiles.length; i++) {
            if (upfiles[i] != null && !upfiles[i].isEmpty()) {
                String changeName = saveFile(upfiles[i], session);

                Attachment at = new Attachment();
                at.setFileNo(i + 1);
                at.setOriginName(upfiles[i].getOriginalFilename());
                at.setChangeName(changeName);
                at.setFilePath("resources/upfiles/" + changeName);
                at.setFileLevel(i + 1);
                list.add(at);
            }
        }

        int result = bService.insertPhBoard(b, list);

        if (result > 0) {
            session.setAttribute("alertMsg", "게시글 등록에 성공했습니다.");
            return "redirect:phBoardList.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 등록 실패");
            return "common/errorPage";
        }
	}
	
	// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 역할
	public String saveFile(MultipartFile upfiles, HttpSession session) {
		
	 String originName = upfiles.getOriginalFilename(); 
	 String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	 
	  int ranNum = (int)(Math.random()* 90000 + 10000); // 5자리 랜덤값)
	  String ext = originName.substring(originName.lastIndexOf("."));
	  String changeName = currentTime + ranNum + ext; //"202320055470821318.png"
	  String savePath = session.getServletContext().getRealPath("/resources/upfiles/");
	  
		try {
			upfiles.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	//---------------------------------------------------------------------
	
	@RequestMapping("phUpdateForm.bo")
	public String phUpdate(int phno, Model model) {
		model.addAttribute("b", bService.selectPhBoard(phno));
		model.addAttribute("at", bService.selectAtBoard(phno));
		return "board/phUpdateForm";
	}
	
	@RequestMapping("phUpdate.bo")
	public String updateBoard(Attachment at, Board b, MultipartFile reupfile, HttpSession session, Model model) {
		
		if(!reupfile.getOriginalFilename().equals("")) {
			
			if(at.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(at.getChangeName())).delete();
			}
			String changeName = saveFile(reupfile, session);
			
			at.setOriginName(reupfile.getOriginalFilename());
			at.setChangeName("resources/upfiles/" + changeName);
			}
			
			int result = bService.updatePhBoard(b);
			int result2 = bService.updatePhAtBoard(at);
			
			if(result > 0) {
				model.addAttribute("alertMsg", "게시글 수정에 성공했습니다.");
				return "redirect:detail.bo?phno=" + b.getBoardNo();
			} else {
				// 수정 실패 => 에러페이지
				model.addAttribute("errorMsg", "게시물 수정에 실패했습니다.");
				return "common/errorPage";
			}
			
		}
	
	@RequestMapping("phDelete.bo")
	public String deleteBoard(int phno, String filePath, HttpSession session, Model model) { 
		int result = bService.deletePhBoard(phno);
		
		if(result > 0) {
			// 첨부파일이 있었을 경우 => 파일 삭제
			if(!filePath.equals("")) { // filePath = "resources/uploadFiles/xxxx.jpg" | ""
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:phBoardList.bo";
			
		} else {
			// 삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	//-------------------------------------------------------------------------
	
	@RequestMapping("rcBoardList.bo")
	public ModelAndView selectRcBoardList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = bService.selectRcListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		ArrayList<Board> list = bService.selectRcList(pi);
		
		System.out.println(list);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/selectRcBoardList");
		return mv;
	}
	
	@RequestMapping("rcDetail.bo")
	public String selectRcBoard(int phno, Model model) {
		int result = bService.increaseRcCount(phno);
		
		if (result > 0) {
			Board b = bService.selectRcBoard(phno); 
			ArrayList<Attachment> at = bService.selectRcAtBoard(phno);
			
			model.addAttribute("b", b);
			model.addAttribute("at", at);
			
			return "board/rcBoardDetailView";
			
		} else {
			model.addAttribute("errorMsg", "게시글 상세 조회 실패!");
			return "common/errorPage";
			
		}
	}
	
	@RequestMapping("rcEnrollForm.bo")
	public String rcEnrollForm() {
		return "board/rcBoardEnrollForm";
	}
	
	@RequestMapping("rcInsert.bo")
	public String insertRcBoard(Board b, MultipartFile[] upfiles, Model model, HttpSession session) {
		
        ArrayList<Attachment> list = new ArrayList<>();

        for (int i = 0; i < upfiles.length; i++) {
            if (upfiles[i] != null && !upfiles[i].isEmpty()) {
                String changeName = saveFile(upfiles[i], session);

                Attachment at = new Attachment();
                at.setFileNo(i + 1);
                at.setOriginName(upfiles[i].getOriginalFilename());
                at.setChangeName(changeName);
                at.setFilePath("resources/upfiles/" + changeName);
                at.setFileLevel(i + 1);
                list.add(at);
            }
        }

        int result = bService.insertRcBoard(b, list);

        if (result > 0) {
            session.setAttribute("alertMsg", "게시글 등록에 성공했습니다.");
            return "redirect:phBoardList.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 등록 실패");
            return "common/errorPage";
        }
	}

	

}
