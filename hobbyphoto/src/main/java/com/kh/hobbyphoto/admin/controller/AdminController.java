package com.kh.hobbyphoto.admin.controller;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aspose.pdf.internal.imaging.system.collections.Generic.List;
import com.google.gson.Gson;
import com.kh.hobbyphoto.admin.model.service.AdminServiceImpl;
import com.kh.hobbyphoto.board.model.vo.BackGround;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.model.vo.Report;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.shop.model.vo.Product;

@Controller
public class AdminController {
	
	@Autowired
	private AdminServiceImpl aService;
	
	// 관리자페이지, 누적신고횟수 많은 회원
	@RequestMapping(value = {"alist.da", "rmList.bo"}, method = RequestMethod.GET)
	public ModelAndView selectReportMList(ModelAndView mv, Model model) {
		
        int number = 3;
        
        model.addAttribute("number", number);
		
		ArrayList<Report> list = aService.selectReportMList();
		
		mv.addObject("list",list).setViewName("admin/adminIndex");

		return mv;
	}


	// 회원 목록 조회	
	@RequestMapping("mlist.me")
	public ModelAndView selectMember(ModelAndView mv) {
		
		ArrayList<Member> list = aService.selectMember();
		
		mv.addObject("list",list).setViewName("admin/memberManage");
		
		return mv;
	}
	
	// 회원 삭제 서비스
	@RequestMapping("mdelete.me")
	public String deleMember(String userId, HttpSession session, Model model) { 
		
		int result = aService.deleMember(userId);
		
		if(result > 0) { // 삭제 성공	
			session.setAttribute("alertMsg", "성공적으로 회원정보가 삭제되었습니다.");
			return "redirect:mlist.me";
		}else { // 삭제 실패
			model.addAttribute("errorMsg", "회원 정보 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	// 상품관리 페이지로 연결
	@RequestMapping("plist.pr")
	public ModelAndView productManage(@RequestParam(value="cpage",defaultValue = "1")int currentPage, ModelAndView mv) {
		
		int ProlistCount = aService.selectAdminProListCount();
		
		PageInfo pi = Pagination.getPageInfo(ProlistCount, currentPage, 5, 5);
		
		ArrayList<Product> plist = aService.selecAdminProtList(pi);
		
		mv.addObject("pi",pi).addObject("plist", plist).setViewName("admin/productManage");
		
		System.out.println(mv);
		
		return mv;
	}
	
	// 게시글 관리 페이지로 연결
	@RequestMapping("blist.bo")
	public String postsManage() {
		
		return "admin/postsManage";
	}
	
	// 게시물관리-사진게시판 리스트로 이동
	@RequestMapping("plist.bo")
	public ModelAndView selectBoard(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectBoardCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Board> list = aService.selectBoard(pi);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("admin/postsManage");
		
		return mv;
	}
	
	// 게시물관리-장비게시판 리스트로 이동
	@RequestMapping("elist.bo")
	public ModelAndView selectBoard2(ModelAndView mv) {
		
		ArrayList<Board> list2 = aService.selectBoard2();
		
		mv.addObject("list2",list2).setViewName("admin/postsManage");
		
		return mv;
	}
	
	// 장비추천 게시물 삭제 서비스
	@RequestMapping("edelete.bo")
	public String edeleBoard(String boardTitle, HttpSession session, Model model) { 
		
		int result = aService.edeleBoard(boardTitle);
		
		if(result > 0) { // 삭제 성공	
			session.setAttribute("alertMsg", "성공적으로 장비추천 게시글이 삭제되었습니다.");
			return "redirect:elist.bo";
		}else { // 삭제 실패
			model.addAttribute("errorMsg", "장비추천 게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	// 게시물관리-모임게시판 리스트로 이동
	@RequestMapping("glist.bo")
	public ModelAndView selectBoard3(ModelAndView mv) {
		
		ArrayList<Sgroup> list3 = aService.selectBoard3();
		
		mv.addObject("list3",list3).setViewName("admin/postsManage");
		
		return mv;
	}
	
	// 모임 게시물 삭제 서비스
	@RequestMapping("gdelete.bo")
	public String gdeleBoard(String title, HttpSession session, Model model) { 
		
		int result = aService.gdeleBoard(title);
		
		if(result > 0) { // 삭제 성공	
			session.setAttribute("alertMsg", "성공적으로 모임 게시글이 삭제되었습니다.");
			return "redirect:glist.bo";
		}else { // 삭제 실패
			model.addAttribute("errorMsg", "모임 게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	// 게시물관리-배경화면게시판 리스트로 이동
	@RequestMapping("backlist.bo")
	public ModelAndView selectBoard4(ModelAndView mv) {
		
		ArrayList<BackGround> list4 = aService.selectBoard4();
		
		mv.addObject("list4",list4).setViewName("admin/postsManage");
		
		return mv;
	}
	
	// 배경화면게시물 삭제 서비스
	/*
	@RequestMapping("bkdelete.bo")
	public String bkdeleBoard(int backNo, HttpSession session, Model model) { 
		
		int result = aService.bkdeleBoard(backNo);
		
		if(result > 0) { // 삭제 성공	
			session.setAttribute("alertMsg", "성공적으로 사진 게시글이 삭제되었습니다.");
			return "redirect:backlist.bo";
		}else { // 삭제 실패
			model.addAttribute("errorMsg", "사진 게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	*/
	
	// 신고 관리 페이지로 연결 (자동 페이징)
	@RequestMapping(value = {"selectOption.me", "rlist.me"}, method = RequestMethod.GET)
	public ModelAndView selectReport(ModelAndView mv, @RequestParam(name = "option", required = false) String option, Model model) {
		
	    model.addAttribute("selectedOption", option);
		
		ArrayList<Report> list = aService.selectReport();
		
		mv.addObject("list",list).setViewName("admin/reportManage");
		
		return mv;
	}
	
	// 신고 처리완료 버튼
	@RequestMapping("processed.me")
	public String processed(String rpNo, HttpSession session, Model model) { 
		
		int result = aService.processed(rpNo);
		
		if(result > 0) { // 처리 성공	
			session.setAttribute("alertMsg", "신고가 성공적으로 처리되었습니다.");
			return "redirect:rlist.me";
		}else { 		 // 처리 실패
			model.addAttribute("errorMsg", "신고 처리 실패");
			return "common/errorPage";
		}
	}
	
	// 하비포토 메인 페이지로 이동
	@RequestMapping("main.ho")
	public String main() {
		return "main";
	}


	@RequestMapping("proenro.from")
	public String insertProFrom() {
		return "admin/productRegist";
	}
	
	@RequestMapping("regist.pro")
	public String insertproduct(Product p, MultipartFile[] upfile, HttpSession session, Model model) {
		
		//		System.out.println(p);
		//		for(int i = 0; i<upfile.length;i++) {
		//			System.out.println(upfile[i]);
		//		}
		
		
		for(int i = 0; i<upfile.length ; i++) {
			if(upfile[i].getSize()>0) {
				String changeName= saveFile(upfile[i],session);
				System.out.println(changeName);
				
				System.out.println("resources/proUpFiles/"+changeName);
				
				switch(i) {
	            case 0:
	                p.setThumbnail("resources/proUpFiles/" + changeName);
	                break;
	            case 1:
	                p.setPDimg("resources/proUpFiles/" + changeName);
	                break;
	            case 2:
	                p.setPSimg("resources/proUpFiles/" + changeName);
	                break;
	        }
				
			}
			
		}
		int result = aService.insertProduct(p);
		
		System.out.println(p);
		System.out.println(result);
		if(result>0) {//등록 성공
			session.setAttribute("alertMsg", "성공적으로 상품이 등록되었습니다.");
			return "redirect:plist.pr";
		}else {//등록 실패
			model.addAttribute("errorMsg", "상품 등록 실패");
			return "common/errorPage";
		}
		
	}
	
		
		//현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장 시키는 역할(지영)
		public String saveFile(MultipartFile upfile, HttpSession session) {
			//파일명 수정 작업 후 서버에 업로드 시키기("flower.png" => "2023100412153012345.png")
			String originName = upfile.getOriginalFilename(); //"flower.png"
			
			//"20231004154605"(년월일시분초)
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());  //"20231004154627"
			
			int ranNum = (int)(Math.random() * 90000 + 10000); // 51346(5자리 랜덤값 생성)
			
			String ext = originName.substring(originName.lastIndexOf(".")); //확장자 => 원본파일명에 확장자 있음  ".png"
			
			String changeName = currentTime + ranNum + ext; //"2023100415462751346.png"
			
			//업로드 시키고자 하는 폴더의 물리적인 경로를 알아내기
			String savePath = session.getServletContext().getRealPath("/resources/proUpFiles/");
			
			//폴더에 파일을 넣기 위한 과정
			
			try {
				upfile.transferTo(new File(savePath +changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
		}

		   //관리자페이지 상품 상세보기
		   @RequestMapping("adminPro.de")
		   public ModelAndView selectProductdetail(String pNo, ModelAndView mv) {
			   int pno = Integer.parseInt(pNo);
			   Product p = aService.selectProductdetail(pno);
			   
			   mv.addObject("p", p).setViewName("admin/prodetail");
			   
			   return mv;
		   }
		   
		   //관리자 페이지 상품 삭제
		   @RequestMapping("adminPro.delete")
		   public String adminProdelete(int pNo, HttpSession session,String thumbnail, Model model) {
			   
			   int result = aService.adminProdelete(pNo);
			   
			   if(result > 0) {//삭제 성공
				   if(!thumbnail.equals("")) {
					   new File(session.getServletContext().getRealPath(thumbnail)).delete();
				   }
				   session.setAttribute("alertMsg", "성공적으로 상품이 삭제되었습니다.");
				   return "redirect:plist.pr";
				   
			   }else {//삭제 실패
				   model.addAttribute("errorMsg", "게시글 삭제에 실패했습니다.");
					return "common/errorPage";
			   }
			   
		   }
		   //수정폼 열기
		   @RequestMapping("adminPro.updateForm")
		   public ModelAndView adminProductupdateForm(int pNo,ModelAndView mv) {
			   
			   Product p = aService.adminProductupdateForm(pNo);
			   
			   mv.addObject("p", p).setViewName("admin/proUpdate");
			   
			   return mv;
		   }
		   
		   //상품 수정
		   @RequestMapping("adminPro.update")
		   public String adminProductupdate(Product p,String pno,MultipartFile[] upfile,HttpSession session, Model model) {
			   int pNo = Integer.parseInt(pno);
			   System.out.println(pNo + "상품번호");
			   p.setPNo(pNo);
			   
			   
			   System.out.println(p);//jsp에서 입력되어 있는 값
			   
			   Product op = aService.selectProductdetail(pNo);
			   System.out.println(op + "op의 값");
			   op.setPNo(pNo);
			   
			   String newThumbnail = null;
			   String newPDimg = null;
			   String newPSimg = null;
			  
			   for(int i = 0; i < upfile.length; i++) {
				    if(upfile[i].getSize() > 0) {
				        String changeName = saveFile(upfile[i], session);
				        switch(i) {
				            case 0:
				                p.setThumbnail("resources/proUpFiles/" + changeName);
				                newThumbnail = p.getThumbnail();
				                break;
				            case 1:
				                p.setPDimg("resources/proUpFiles/" + changeName);
				                newPDimg = p.getPDimg();
				                break;
				            case 2:
				                p.setPSimg("resources/proUpFiles/" + changeName);
				                newPSimg = p.getPSimg();
				                break;
				        }
				    } else { // 파일이 업로드 되지 않았을 때, 기존의 값을 유지
				        switch(i) {
				            case 0:
				                if(p.getThumbnail() == null || p.getThumbnail().isEmpty()) {
				                    p.setThumbnail(op.getThumbnail());
				                }
				                break;
				            case 1:
				                if(p.getPDimg() == null || p.getPDimg().isEmpty()) {
				                    p.setPDimg(op.getPDimg());
				                }
				                break;
				            case 2:
				                if(p.getPSimg() == null || p.getPSimg().isEmpty()) {
				                    p.setPSimg(op.getPSimg());
				                }
				                break;
				        }
				    }
				}
			   
			   int result = aService.adminProductupdate(p);
			   
			   System.out.println(result + "리턴된 result 값");
			   
			   if(result>0) { //업데이트 성공시
				   
				   if(newThumbnail != null && !newThumbnail.equals(op.getThumbnail())) {
				        new File(session.getServletContext().getRealPath(op.getThumbnail())).delete();
				    }
				    if(newPDimg != null && !newPDimg.equals(op.getPDimg())) {
				        new File(session.getServletContext().getRealPath(op.getPDimg())).delete();
				    }
				    if(newPSimg != null && !newPSimg.equals(op.getPSimg())) {
				        new File(session.getServletContext().getRealPath(op.getPSimg())).delete();
				    }
				   
				   session.setAttribute("alertMsg", "상품 정보 수정 성공");
				   return "redirect:adminPro.de?pNo="+pno;
				   
			   }else {//업데이트 실패시
				   model.addAttribute("errorMsg", "게시글 삭제에 실패했습니다.");
					return "common/errorPage";
			   }
			   
		   }
		   

		// 사진 게시물 삭제 서비스
		      @RequestMapping("pdelete.bo")
		      public String deleBoard(String boardTitle, HttpSession session, Model model) { 
		         
		         int result = aService.deleBoard(boardTitle);
		         
		         if(result > 0) { // 삭제 성공   
		            session.setAttribute("alertMsg", "성공적으로 사진 게시글이 삭제되었습니다.");
		            return "redirect:plist.bo";
		         }else { // 삭제 실패
		            model.addAttribute("errorMsg", "사진 게시글 삭제 실패");
		            return "common/errorPage";
		         }
		         
		      }
		      

		// 관리자페이지 상품 관리
		@RequestMapping("orderlist.pr")
		public String adminCharts() {
			
			return "admin/productOrder";
		}
		
		// 관리자페이지 관리자 통계
		@RequestMapping("table.da")
		public String adminTables() {
			
			return "admin/adminTables";
		}	
		
		// checklist
		@RequestMapping("checkList.da")
		public String adminCheckList() {
			return "admin/adminCheckList";
		}
		
		
	}

	


