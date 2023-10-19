package com.kh.hobbyphoto.board.model.service;

import java.util.ArrayList;

import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.upfile.model.vo.Attachment;

public interface BoardService {
//서비스 설계하는 곳
	// 1. 게시판 리스트 페이지 서비스 (페이징)
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);
	
	// 2. 게시글 작성하기 서비스
	int insertBoard(Board b);
	int insertAtBoard(Attachment at);
	
	// 3. 게시글 상세조회용 서비스
	int increaseCount(int boardNo);
	Board selectpBoard(int boardNo);
	ArrayList<Attachment> selectAtBoard(int boardNo);
	
	
}
