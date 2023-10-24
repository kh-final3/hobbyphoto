package com.kh.hobbyphoto.admin.model.service;
import java.util.ArrayList;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.upfile.model.vo.P_Attachment;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.member.model.vo.Member;


public interface AdminService {
	
	// 1. 회원 관리 리스트 페이지
	ArrayList<Member> selectMember();
	
	// 2. 회원 삭제 처리
	int deleteMember(String userId);
	
	// 1. 게시판 리스트 페이지 서비스 (페이징)
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);

	// 2. 게시글 상세조회용 서비스
	int increaseCount(int boardNo);
	Board selectBoard(int boardNo);
	
	// 4. 게시글 삭제용 서비스
	int deleteBoard(int boardNo);
	
	// 5. 게시글 수정용 서비스
	int updateBoard(Board b);

	//1. 상품 등록하기(지영)
	int insertProduct(Product p);
	
	//2. 상품 리스트 페이지 관리(지영)
	int selectAdminProListCount();
	ArrayList<Product> selecAdminProtList(PageInfo pi);
}
