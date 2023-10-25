package com.kh.hobbyphoto.group.model.service;

import java.util.ArrayList;

import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.group.model.vo.Sgroup;

public interface GroupService {
	//서비스 설계하는 곳
	
	// 1. 게시판 리스트 페이지 서비스
	int selectTgListCount();
	
	// 2. 게시글 작성 서비스
	int insertSgBoard(Sgroup g);
	
	// 3. 게시글 상세조회용 서비스
	Sgroup selectTgBoard(int boardNo);
	
}
