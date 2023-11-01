package com.kh.hobbyphoto.admin.model.service;
import java.util.ArrayList;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.upfile.model.vo.P_Attachment;
import com.kh.hobbyphoto.board.model.vo.BackGround;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.model.vo.Report;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.shop.model.vo.Product;

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

	
}
