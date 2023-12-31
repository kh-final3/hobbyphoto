package com.kh.hobbyphoto.admin.model.service;
import java.util.ArrayList;

import com.kh.hobbyphoto.shop.model.vo.Orders;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.shop.model.vo.Templates;
import com.kh.hobbyphoto.board.model.vo.BackGround;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.model.vo.Report;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.notice.model.vo.Notice;

public interface AdminService {
	
	// 1_1. 회원 관리 리스트 페이지 (자동 페이징)
	ArrayList<Member> selectMember();
	
	// 1_2. 회원 삭제 처리
	int deleMember(String userId);
	
//-----------------------------------------------------------------
	
	// 2_1. 사진 게시글 관리 조회 
	int selectBoardCount();
	ArrayList<Board> selectBoard(PageInfo pi);
	
	// 2_2. 사진 게시글 삭제
	int deleBoard(String boardTitle);
	
	// 2_3_1. 장비추천 관리 조회
	ArrayList<Board> selectBoard2();
	
	// 2_3_2. 장비 게시글 삭제
	int edeleBoard(String boardTitle);
	
	// 2_4_1. 모임게시판 관리 조회
	ArrayList<Sgroup> selectBoard3();
	
	// 2_4_2. 모임 게시글 삭제
	int gdeleBoard(String title);
	
	// 2_5_1. 배경화면게시판 관리 조회
	ArrayList<BackGround> selectBoard4();

	// 2_5_2. 배경화면 게시글 삭제
	int bkdeleBoard(int backNo);
	
	// 2_6. 관리자 메인페이지에 신고 회원 리스트
	ArrayList<Report> selectReportMList();
	

//-----------------------------------------------------------------

	//1. 상품 등록하기(지영)
	int insertProduct(Product p);
	
	//2. 상품 리스트 페이지 관리(지영)
	int selectAdminProListCount();
	ArrayList<Product> selecAdminProtList(PageInfo pi);
	
//-----------------------------------------------------------------
	
	// 4_1. 신고 게시물 조회
	ArrayList<Report> selectReport();
	
	// 4_2. 신고 게시물 처리완료 버튼
	int processed(String rpNo);

	

	//3.상품 삭제(지영)
	int adminProdelete(int pNo);
	
	//4.상품 상세보기(지영)
	Product selectProductdetail(int pno);
	
	//5.상품 수정 폼열기(지영)
	Product adminProductupdateForm(int pNo);
	
	//6.상품 수정(지영)
	int adminProductupdate(Product p);
	
	//7.주문조회(지영)
	ArrayList<Orders> selectMemberOredr();
	
	//8.공지사항(지영)
	ArrayList<Notice> selectAdminNotice();
	
	//9.템플릿 등록(지영)
	int templateRegist(Templates t);
	//10. 템플릿 리스트(지영)
	int selectAdminTemlist();
	ArrayList<Templates> selectAdminTem(PageInfo pi);
	
	//11.템플릿 상세 보기
	Templates selectTemdetail(int tno);
	//12.템플릿 삭제
	int adminTemDelete(int tNo);
}
