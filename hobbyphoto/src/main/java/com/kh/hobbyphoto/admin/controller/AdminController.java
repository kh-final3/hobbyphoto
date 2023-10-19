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
import org.springframework.web.multipart.MultipartFile;

import com.kh.hobbyphoto.admin.model.service.AdminServiceImpl;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.upfile.model.vo.P_Attachment;

@Controller
public class AdminController {

	@Autowired
	private AdminServiceImpl aService;
	
	@RequestMapping("admin.pg")
	public String adminForm() {
		return "admin/adminIndex";
	}
	
	@RequestMapping("insert.proform")
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
			return "admin/adminIndex";
		}else {//등록 실패
			model.addAttribute("errorMsg", "상품 등록 실패");
			return "common/errorPage";
		}
		
		
	}
		
		//현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장 시키는 역할
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

