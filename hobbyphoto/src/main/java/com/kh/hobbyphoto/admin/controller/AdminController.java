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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.admin.model.service.AdminServiceImpl;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.shop.model.vo.Product;


@Controller
public class AdminController {

	@Autowired
	private AdminServiceImpl aService;
	
	@RequestMapping("admin.pg")
	public String adminForm() {
		return "admin/adminIndex";
	}


	// 회원 목록 조회	
	@RequestMapping("mlist.me")
	public ModelAndView selectMember(ModelAndView mv) {
		
		ArrayList<Member> list = aService.selectMember();
		
		mv.addObject("list",list).setViewName("admin/memberManage");
		
		return mv;
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
	
	// 신고회원 관리 페이지로 연결
	@RequestMapping("rlist.me")
	public String reportManage() {
		
		return "admin/reportManage";
	}
	
	// 상품 매출 현황으로 연결
	@RequestMapping("achart.pr")
	public String adminCharts() {
		
		return "admin/adminCharts";
	}
	
	// 하비포토 메인 페이지로 이동
	@RequestMapping("main.ho")
	public String main() {
		return "main";
	}
	
	
	@RequestMapping("aenrollForm.bo")
	public String enrollForm() {

		return "board/boardEnrollForm";
	}
	
	@RequestMapping("adetail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		// bno에는 상세조회하고자 하는 해당 게시글 번호 담겨있음
		
		// 해당 게시글 조회수 증가 서비스 호출 결과 받기 (update 하고 옴)
		int result = aService.increaseCount(bno);
		
		if(result  > 0) {
			// >> 성공적으로 조회수 증가
			//		>> boardDetailView.jsp 상에 필요한 데이터 조회 (게시글 상세정보 조회 서비스 호출)
			//		>> 조회된 데이터 담아서
			//		>> board/boardDetailView.jsp로 포워딩
			
			Board b = aService.selectBoard(bno);
			mv.addObject("b", b).setViewName("board/boardDetailView");
		}else {
			// >> 조회수 증가 실패
			//		>> 에러문구 담아서 에러페이지 포워딩
			mv.addObject("errorMsg", "상세조회실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("adelete.bo")
	public String deleteBoard(int bno, String filePath, HttpSession session, Model model) { 
		// filePath="resources/uploadFiles/xxxx.jpg" | ""
		
		int result = aService.deleteBoard(bno);
		
		if(result > 0) {
			// 삭제 성공
			
			// 첨부파일이 있었을 경우 => 파일 삭제
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			
			// 게시판 리스트 페이지 list.bo url 재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:list.bo";
			
		}else {
			// 삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}

	@RequestMapping("aupdateForm.bo")
	public String updateForm(int bno, Model model) {
		model.addAttribute("b", aService.selectBoard(bno));
		return "board/boardUpdateForm";
	}
	
	@RequestMapping("update.bo")
	public String updateBoard(@ModelAttribute Board b, MultipartFile reupfile, HttpSession session, Model model) {
		
		int result = aService.updateBoard(b);
		
		if(result > 0) { // 수정 성공	=> 상세페이지	detail.bo?bno=해당게시글번호	url 재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:detail.bo?bno=" + b.getBoardNo();
			
		}else { // 수정 실패 => 에러페이지
			model.addAttribute("errorMsg", "게시글 수정 실패!");
			return "common/errorPage";
		}
	}
	
	//상품 등록(지영)
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
		
		
		
	}

