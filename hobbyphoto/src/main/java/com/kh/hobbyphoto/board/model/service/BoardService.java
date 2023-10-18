package com.kh.hobbyphoto.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hobbyphoto.board.model.vo.Attachment;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Place;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;

public interface BoardService {
//서비스 설계하는 곳
	
	// 1. 게시판 리스트 페이지 서비스 (페이징)
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);
	
	// 2. 게시글 작성하기 서비스
	int insertBoard(Board b);
	
	// 3. 게시글 상세조회용 서비스
	int increaseCount(int boardNo);
	Board selectBoard(int boardNo);
	
	// 4. 게시글 삭제용 서비스
	int deleteBoard(int boardNo);
	
	// 5. 게시글 수정용 서비스
	int updateBoard(Board b);

	// 6. 댓글 리스트 조회용 서비스(ajax)
	ArrayList<Reply> selectReplyList(int boardNo); 

	// 7. 댓글 작성용 서비스(ajax)
	int insertReply(Reply r);
	
	// 8. 조회수 top5 리스트 조회용 서비스
	ArrayList<Board> selectTopBoardList();
	
	
	
	ArrayList<Place> selectPlaceList(PageInfo pi);
	int insertPlace(Place p, ArrayList<Attachment> list);
	Place selectPlace(int pno);
	int placeInsertReply(Reply r);
	ArrayList<Reply> placeReplyList(int pno);
	int selectPlaceListCount();
	ArrayList<Place> sortPlaceList(PageInfo pi, HashMap<String, String> map);
	int updatePlace(Place p, ArrayList<Attachment> list);
	
}
