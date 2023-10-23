package com.kh.hobbyphoto.admin.model.service;


import java.util.ArrayList;

import com.kh.hobbyphoto.board.model.vo.BackGround;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.shop.model.vo.Product;

public interface AdminService {
	
	// 1. 회원 관리 리스트 페이지
	ArrayList<Member> selectMember();
	
	// 2. 회원 삭제 처리
	int deleMember(String userId);
	
//-----------------------------------------------------------------
	
	// 3. 게시글 관리 조회 
	ArrayList<Board> selectBoard();
	
	// 3_1. 게시글 삭제
	int deleBoard(String boardTitle);
	
	// 4. 장비추천 관리 조회
	ArrayList<Board> selectBoard2();
	
	// 5. 모임게시판 관리 조회
	ArrayList<Sgroup> selectBoard3();
	
	// 6. 배경화면게시판 관리 조회
	ArrayList<BackGround> selectBoard4();
	

//-----------------------------------------------------------------

	//7. 상품 등록하기
	int insertProduct(Product p);
	
	
}
