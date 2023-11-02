package com.kh.hobbyphoto.board.controller;

import java.io.*;
import java.nio.file.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hobbyphoto.board.model.service.*;
import com.kh.hobbyphoto.board.model.vo.*;
import com.kh.hobbyphoto.board.model.vo.Report;
import com.kh.hobbyphoto.common.model.vo.*;
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
	
	@RequestMapping("phUpdateForm.bo")
	public String phUpdate(int phno, Model model) {
		model.addAttribute("b", bService.selectPhBoard(phno));
		model.addAttribute("at", bService.selectAtBoard(phno));
		return "board/phUpdateForm";
	}
	
	@RequestMapping("phUpdate.bo")
	public String updateBoard(Board b, MultipartFile[] reupfiles, HttpSession session, Model model) {
        ArrayList<Attachment> list = new ArrayList<>();
        for (int i = 0; i < reupfiles.length; i++) {
            if (reupfiles[i] != null && !reupfiles[i].isEmpty()) {
                String changeName = saveFile(reupfiles[i], session);

                Attachment at = new Attachment();
                at.setFileNo(i + 1);
                at.setOriginName(reupfiles[i].getOriginalFilename());
                at.setChangeName(changeName);
                at.setFilePath("resources/upfiles/" + changeName);
                at.setFileLevel(i + 1);
                at.setRefBno(String.valueOf(b.getBoardNo()));
                list.add(at);
            }
        }
        
        int result = bService.updatePhBoard(b, list);
	    if (result <= 0) {
	        model.addAttribute("errorMsg", "게시글 수정 실패");
	        return "common/errorPage";
	    } else {
	    	 session.setAttribute("alertMsg", "게시글 수정에 성공했습니다.");
	  	    return "redirect:phDetail.bo?phno=" + b.getBoardNo();
	    }
	  
	}
	
	@RequestMapping("phDelete.bo")
	public String deleteBoard(int phno, String filePath, HttpSession session, Model model) { 
		int result = bService.deletePhBoard(phno);
		
		if(result > 0) {
			// 첨부파일이 있었을 경우 => 파일 삭제
			if(!filePath.equals("")) { // filePath = "resources/upfiles/xxxx.jpg" | ""
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
	
	@ResponseBody
	@RequestMapping(value="phRlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int phno) {
		ArrayList<Reply> list = bService.selectPhReplyList(phno);
		return new Gson().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="phRinsert.bo")
	public String ajaxInsertReply(Reply r) {
		int result = bService.insertPhReply(r);
		return result > 0 ? "success" : "fail";
		
	}
	
	//-------------------------------------------------------------------------
	
	@RequestMapping("rcBoardList.bo")
	public ModelAndView selectRcBoardList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = bService.selectRcListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		ArrayList<Board> list = bService.selectRcList(pi);
		
		
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
	public String insertRcBoard(Board b, MultipartFile[] upfile, Model model, HttpSession session) {
		
        ArrayList<Attachment> list = new ArrayList<>();

        for (int i = 0; i < upfile.length; i++) {
            if (upfile[i] != null && !upfile[i].isEmpty()) {
                String changeName = saveFile(upfile[i], session);

                Attachment at = new Attachment();
                at.setFileNo(i + 1);
                at.setOriginName(upfile[i].getOriginalFilename());
                at.setChangeName(changeName);
                at.setFilePath("resources/upfiles/" + changeName);
                at.setFileLevel(i + 1);
                list.add(at);
            }
        }

        int result = bService.insertRcBoard(b, list);

        if (result > 0) {
            session.setAttribute("alertMsg", "게시글 등록에 성공했습니다.");
            return "redirect:rcBoardList.bo";
        } else {
            model.addAttribute("errorMsg", "게시글 등록 실패");
            return "common/errorPage";
        }
	}
	
	@RequestMapping("rcDelete.bo")
	public String deleteRcBoard(int phno, String filePath, HttpSession session, Model model) { 
		int result = bService.deleteRcBoard(phno);
		
		if(result > 0) {
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:rcBoardList.bo";
		}else {
			session.setAttribute("alertMsg", "게시글 삭제 실패");
            return "redirect:rcBoardList.bo";
        }
	}
	
	@RequestMapping("rcUpdateForm.bo")
	public String rcUpdateForm(int phno, Model model) {
		model.addAttribute("b", bService.selectRcBoard(phno));
		model.addAttribute("at", bService.selectRcAtBoard(phno));
		return "board/rcUpdateForm";
	}
	
	@RequestMapping("rcUpdate.bo")
	public String rcUpdate(Board b, MultipartFile[] upfile, HttpSession session, Model model,  
			@RequestParam("originFileNo1") int originFileNo1, @RequestParam("originFileNo2") int originFileNo2,
	        @RequestParam("originFileNo3") int originFileNo3, @RequestParam("originFileNo4") int originFileNo4 ) {
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(int i = 0; i < upfile.length; i++) {
			if(upfile[i] != null && !upfile[i].isEmpty()) {
				String changeName = saveFile(upfile[i], session);
				
				Attachment at = new Attachment();
                at.setFileNo(i + 1);
                at.setOriginName(upfile[i].getOriginalFilename());
                at.setChangeName(changeName);
                at.setFilePath("resources/upfiles/" + changeName);
                at.setFileLevel(i + 1);
                at.setRefBno(String.valueOf(b.getBoardNo()));
                list.add(at);
			}
		}
		
		int result = bService.updateRcBoard(b, list);
	    if (result <= 0) {
	        model.addAttribute("errorMsg", "게시글 수정 실패");
	        return "common/errorPage";
	    } else {
	    	 session.setAttribute("alertMsg", "게시글 수정에 성공했습니다.");
	  	    return "redirect:rcBoardList.bo?phno=" + b.getBoardNo();
	    }
	  
	}
	
	@ResponseBody
	@RequestMapping(value="rcRlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectRcReplyList(int phno) {
		ArrayList<Reply> list = bService.selectRcReplyList(phno);
		return new Gson().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="rcRinsert.bo")
	public String ajaxInsertRcReply(Reply r) {
		int result = bService.insertRcReply(r);
		return result > 0 ? "success" : "fail";
		
	}


	// *************출사명소시작************ //
	@RequestMapping("list.pl")
	public ModelAndView selectPlaceList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {

		int listCount = bService.selectPlaceListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Place> list = bService.selectPlaceList(pi);
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/placeListView");

		return mv;
	}

	@RequestMapping("enrollForm.pl")
	public String plEnrollForm() {
		return "board/placeEnrollForm";
	}

	@RequestMapping("insert.pl")
	public String insertPlace(Place p, @RequestParam("upfile") MultipartFile[] upfiles, HttpSession session,
			Model model) {
		ArrayList<Attachment> list = new ArrayList<>();

		for (MultipartFile upfile : upfiles) {
			if (upfile != null && !upfile.isEmpty()) {
				String changeName = saveFile(upfile, session);

				Attachment at = new Attachment();
				at.setOriginName(upfile.getOriginalFilename());
				at.setChangeName("resources/upfiles/" + changeName);
				at.setFilePath("resources/upfiles");
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

	@RequestMapping("detail.pl")
	public String selectPlace(int pno, Model model) {
		int result = bService.increaseCountPlace(pno);
		if (result > 0) {
			Place p = bService.selectPlace(pno);
			model.addAttribute("p", p);
			System.out.println(p);
			return "board/placeDetailView";

		} else {
			model.addAttribute("errorMsg", "게시글 상세 조회 실패!");
			return "common/errorPage";

		}
	}

	@RequestMapping("delete.pl")
	public String deletePlace(int pno, String filePath, HttpSession session, Model model) {
		int result = bService.deletePlace(pno);

		if (result > 0) {
		
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
	public String updatePlace(Place p, @RequestParam("upfiles") MultipartFile[] upfiles,
	        @RequestParam("originFileNo1") int originFileNo1, @RequestParam("originFileNo2") int originFileNo2,
	        @RequestParam("originFileNo3") int originFileNo3, @RequestParam("originFileNo4") int originFileNo4,
	        HttpSession session, Model model) {
	    ArrayList<Attachment> list = new ArrayList<>();
	    Place existingPlace = bService.selectPlace(p.getPno());
	    p.setPimg1(existingPlace.getPimg1());
	    p.setPimg2(existingPlace.getPimg2());
	    p.setPimg3(existingPlace.getPimg3());
	    p.setPimg4(existingPlace.getPimg4());

	    for (int i = 0; i < upfiles.length; i++) {
	        MultipartFile file = upfiles[i];

	        if (file != null && !file.isEmpty()) {
	            String changeName = saveFile(file, session);
	            Attachment at = new Attachment();
	            at.setOriginName(file.getOriginalFilename());
	            at.setChangeName("resources/upfiles/" + changeName);
	            at.setFilePath("resources/upfiles");
	            at.setFileLevel(i + 1);
	            at.setRefBno(String.valueOf(p.getPno()));

	            // Switch 구문 안에서 더 이상 처리할 파일이 없으면 루프를 종료
	            if (i == 0) {
	                at.setFileNo(originFileNo1);
	                p.setPimg1("resources/upfiles/" + changeName);
	            } else if (i == 1) {
	                at.setFileNo(originFileNo2);
	                p.setPimg2("resources/upfiles/" + changeName);
	            } else if (i == 2) {
	                at.setFileNo(originFileNo3);
	                p.setPimg3("resources/upfiles/" + changeName);
	            } else if (i == 3) {
	                at.setFileNo(originFileNo4);
	                p.setPimg4("resources/upfiles/" + changeName);
	            } else {
	                // 처리할 파일이 없으면 루프 종료
	                break;
	            }

	            list.add(at);
	        }
	    }

	    int result = bService.updatePlace(p);
	    if (result <= 0) {
	        model.addAttribute("errorMsg", "게시글 수정 실패");
	        return "common/errorPage";
	    }

	    for (Attachment attachment : list) {
	        if (attachment.getFileNo() != 0) {
	            int attachmentResult = bService.updatePlaceAttachment(attachment);
	            if (attachmentResult <= 0) {
	                model.addAttribute("errorMsg", "첨부 파일 수정 실패");
	                return "common/errorPage";
	            }
	        } else {
	            int result1 = bService.insertAttachmentPlace2(attachment);  // 단일 파일을 추가하도록 수정
	            if (result1 <= 0) {
	                model.addAttribute("errorMsg", "첨부 파일 추가 실패");
	                return "common/errorPage";
	            }
	        }
	    }

	    session.setAttribute("alertMsg", "게시글 수정에 성공했습니다.");
	    return "redirect:detail.pl?pno=" + p.getPno();
	}


	

	@RequestMapping("sortPlace.pl")
	public ModelAndView sortPlace(String keyword, @RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		int listCount = bService.selectPlaceListCount();
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Place> list = bService.sortPlaceList(pi, map);
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/placeListView");

		return mv;
	}

	
	//////////////// 축제,전시 ///////////////////////////
	
	@RequestMapping("festivalList.fs")
	public ModelAndView festivalList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		String keyword = "축제";
		int listCount = bService.cultureListCount(keyword);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Festival> list = bService.cultureList(pi, keyword);
		mv.addObject("pi", pi).addObject("list", list).setViewName("culture/festival");

		return mv;
	}
	
	@RequestMapping("exhibitList.fs")
	public ModelAndView exhibitList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		String keyword = "전시";
		int listCount = bService.cultureListCount(keyword);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Festival> list = bService.cultureList(pi, keyword);
		System.out.println(list);
		mv.addObject("pi", pi).addObject("list", list).setViewName("culture/exhibit");

		return mv;
	}
	

	@RequestMapping("cultureDetail.fs")
	public String selectCulture(int feNo, Model model) {
	    Festival fe = bService.selectCulture(feNo);
	    System.out.println(fe.getFeType().substring(0, 2));
	    if (fe != null) {
	        model.addAttribute("fe", fe);
	        if ("축제".equals(fe.getFeType().substring(0, 2))) {
	            // 축제인 경우
	            return "culture/festivalDetail";
	        } else if ("전시".equals(fe.getFeType().substring(0, 2))) {
	            // 전시인 경우
	            return "culture/exhibitDetail";
	        }
	    } 
        model.addAttribute("errorMsg", "게시글 상세 조회 실패!");
        return "common/errorPage";
	   
	}

	@RequestMapping("cultureEnrollForm.fs")
	public String fsEnrollForm() {
		return "culture/cultureEnrollForm";
	}

	@RequestMapping("insertCulture.fs")
	public String insertCulture(Festival fe, MultipartFile upfile, HttpSession session, Model model) {

		String changeName = saveFile(upfile, session);
		fe.setFeDate(fe.getFeDate1() +"~"+ fe.getFeDate2());
		fe.setTimg("resources/upfiles/" + changeName);
		if ("전시".equals(fe.getFeType())) {
			fe.setType(5);
        } else if ("축제".equals(fe.getFeType())) {
        	fe.setType(6);
        }
		int result = bService.insertCulture(fe);

		if (result > 0) {
	        System.out.println(fe.getFeType());
	        if ("전시".equals(fe.getFeType())) {
	            
	            return "redirect:exhibitList.fs";
	        } else if ("축제".equals(fe.getFeType())) {
	        	System.out.println(2);
	            // 축제인 경우
	            return "redirect:festivalList.fs";
	        }
	    }
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
	}

	@RequestMapping("updateForm.fs")
	public String updateForm(int feNo, Model model) {
		model.addAttribute("fe", bService.selectCulture(feNo));
		return "culture/cultureUpdateForm";
	}
	
	@RequestMapping("updateCulture.fs")
	public String updateCulture(Festival fe, MultipartFile reupfile, HttpSession session, Model model) {

		// 새로 넘어온 첨부파일이 있을 경우
		if (!reupfile.getOriginalFilename().equals("")) {

			
			// 새로 넘어온 첨부파일 서버 업로드 시키기
			String changeName = saveFile(reupfile, session);

			fe.setTimg("resources/upfiles/" + changeName);
		}

		int result = bService.updateCulture(fe);

		if (result > 0) {
	      
	            return "redirect:cultureDetail.fs?feNo=" + fe.getFeNo();
	       
	    }else {
	    	
			// 수정 실패 => 에러페이지
			model.addAttribute("errorMsg", "게시물 수정에 실패했습니다.");
			return "common/errorPage";
	    }
		
	}
	
	
	@RequestMapping("list.wp")
	public String wpList() {
		return "wallpaper/wpList";
	}
	
	@RequestMapping("enrollForm.wp")
	public String wpEnrollForm() {
		return "wallpaper/wpEnrollForm";
	}
	
	@RequestMapping("insertWallPaper.wp")
	public String insertWallPaper(WallPaper wp,Model model) {

	    System.out.println(wp);
		int result = bService.insertWallPaper(wp);

		
		if (result > 0) {
		      
			return "wallpaper/wpList";
        
	    }else {
	    	
			model.addAttribute("errorMsg", "게시물 수정에 실패했습니다.");
			return "common/errorPage";
	    }
	}
	
	@ResponseBody
	@RequestMapping("base64.wp")
	private String saveImage(@RequestParam("pngData") String dataURL, HttpSession session) {
	    // Extract the base64 part of the data URL
	    String base64Data = dataURL.split(",")[1];
	    
	    // Decode the base64 string into bytes
	    byte[] imageBytes = Base64.decodeBase64(base64Data);

	    // Generate a unique file name (e.g., using a timestamp and a random number)
	    String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	    int ranNum = (int)(Math.random() * 90000 + 10000);
	    String fileName = currentTime + ranNum + ".png"; // You can change the extension as needed


	    // Define the path to save the image
	    String savePath = session.getServletContext().getRealPath("resources/upfiles/");

	    // Create a file using the save path and the generated file name
	    File imageFile = new File(savePath, fileName);
	    
	    String changeName = "resources/upfiles/" + fileName;
	    try {
	        // Write the image bytes to the file
	        Files.write(Paths.get(imageFile.toURI()), imageBytes);
	        return changeName;
	    } catch (IOException e) {
	        e.printStackTrace();
	        return "Error saving the image.";
	    }
	}

	

	@ResponseBody
	@RequestMapping("bookCheck.bo")
	public String checkBookmark(Board b){
		int count = bService.checkBook(b);
		if(count > 0) {
			return "Y";
		}else {
			return "N";
			
		}
	}
	
	@ResponseBody
	@RequestMapping("book.bo")
	public String insertBookmark(Board b){
		int count = bService.insertBookmark(b);
		if(count > 0) {
			return "Y";
		}else {
			return "N";
			
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteBook.bo")
	public String deleteBookmark(Board b){
		int count = bService.deleteBookmark(b);
		if(count > 0) {
			return "Y";
		}else {
			return "N";
			
		}
	}
	
	
	
	@ResponseBody
	@RequestMapping("likeCheck.bo")
	public String checkLike(Board b){
		int count = bService.checkLike(b);
		if(count > 0) {
			return "Y";
		}else {
			return "N";
			
		}
	}
	
	@ResponseBody
	@RequestMapping("like.bo")
	public String insertLike(Board b){
		int count = bService.insertLike(b);
		if(count > 0) {
			return "Y";
		}else {
			return "N";
			
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteLike.bo")
	public String deleteLike(Board b){
		int count = bService.deleteLike(b);
		if(count > 0) {
			return "Y";
		}else {
			return "N";
			
		}
	}
	
	
	@RequestMapping("reportBoard.bo")
	public String reportBoard(Report r,HttpSession session, Model model){
		r.setBoardType(4);
		int result = bService.reportBoard(r);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 신고되었습니다.");
			return "main";
		}else {
			model.addAttribute("errorMsg", "게시물 수정에 실패했습니다.");
			return "common/errorPage";
		}
		
	}
}
