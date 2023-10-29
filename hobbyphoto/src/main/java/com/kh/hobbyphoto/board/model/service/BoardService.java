package com.kh.hobbyphoto.board.model.service;

import java.util.*;

import com.kh.hobbyphoto.board.model.vo.*;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.member.model.vo.Block;
import com.kh.hobbyphoto.upfile.model.vo.Attachment;

public interface BoardService {
	// ------------------- 장비추천 게시판 ------------------- 
	// 1. 사진게시판 리스트 페이지 서비스 (페이징)
	int selectPhListCount();
	ArrayList<Board> selectPhList(PageInfo pi);
	
	// 2. 게시글 작성하기 서비스
	int insertPhBoard(Board b, ArrayList<Attachment> list);
	
	// 3. 게시글 상세조회용 서비스
	int increaseCount(int boardNo);
	Board selectPhBoard(int boardNo);
	
	// 4. 게시글 삭제용 서비스
	int deletePhBoard(int boardNo);
	
	// 5. 게시글 수정용 서비스
	int updatePhBoard(Board b);
	int updatePhAtBoard(Attachment at);
	
	// ------------------- 장비추천 게시판 ------------------- //
	// 1. 장비추천 게시판 리스트 페이지 서비스 (페이징)
	int selectRcListCount();
	ArrayList<Board> selectRcList(PageInfo pi);
	
	// 2. 게시글 작성하기 서비스
	int insertRcBoard(Board b, ArrayList<Attachment> list);
	
	// 3. 게시글 상세조회용 서비스
	int increaseRcCount(int boardNo);
	Board selectRcBoard(int boardNo);
	
	// ------------------- 마이 페이지 게시판 ------------------- //
	int myListCount(int userNo);
	ArrayList<Board> myBoardList(PageInfo pi,int userNo);
	ArrayList<Board> myBookmarksList(PageInfo pi,int userNo);
	ArrayList<Board> myLikeList(PageInfo pi,int userNo);
	ArrayList<Board> myGroupList(PageInfo pi,int userNo);
	ArrayList<Block> myBlockList(PageInfo pi,int userNo);
	
	ArrayList<Place> selectPlaceList(PageInfo pi);
	int insertPlace(Place p, ArrayList<Attachment> list);
	int insertAttachmentPlace(ArrayList<Attachment> list);
	int increaseCountPlace(int pno);
	Place selectPlace(int pno);
	int selectPlaceListCount();
	ArrayList<Place> sortPlaceList(PageInfo pi, HashMap<String, String> map);
	int updatePlace(Place p);
	int updatePlaceAttachment(Attachment attachment);
	int deletePlace(int pno);
	
	int cultureListCount(String keyword);
	ArrayList<Festival> cultureList(PageInfo pi, String keyword);
	Festival selectCulture(int feNo);
	int insertCulture(Festival fe);
	int insertAttachmentPlace2(Attachment attachment);
	int updateCulture(Festival fe);
	
	
	 int checkBook(Board b);
	 int insertBookmark(Board b);
	 int deleteBookmark(Board b);
	 
	 
	 int insertWallPaper(Wallpaper wp);
}
