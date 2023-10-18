package com.kh.hobbyphoto.admin.model.service;

import java.util.ArrayList;

import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;

public interface AdminService {
	
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
}
