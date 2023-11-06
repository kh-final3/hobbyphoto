package com.kh.hobbyphoto.board.model.service;

import java.util.*;

import com.kh.hobbyphoto.board.model.vo.*;
import com.kh.hobbyphoto.common.model.vo.Follow;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.member.model.vo.Block;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.upfile.model.vo.Attachment;

public interface BoardService {
	// ------------------- 사진 게시판 ------------------- 
	// 1. 사진게시판 리스트 페이지 서비스 (페이징)
	int selectPhListCount();
	ArrayList<Board> selectPhList(PageInfo pi, Member m);
	
	// 2. 게시글 작성하기 서비스
	int insertPhBoard(Board b, ArrayList<Attachment> list);
	
	// 3. 게시글 상세조회용 서비스
	int increaseCount(int boardNo);
	Board selectPhBoard(int boardNo);
	
	// 4. 게시글 삭제용 서비스
	int deletePhBoard(int boardNo);
	
	// 5. 게시글 수정용 서비스
	int updatePhBoard(Board b, ArrayList<Attachment> at);
	int updatePhAtBoard(Attachment at);
	int insertNewAttachment(Attachment at);
	
	// 6. 댓글 작성, 조회용 서비스
	ArrayList<Reply> selectPhReplyList(Board b);
	int insertPhReply(Reply r);
	
	// ------------------- 장비추천 게시판 ------------------- //
	// 1. 장비추천 게시판 리스트 페이지 서비스 (페이징)
	int selectRcListCount();
	ArrayList<Board> selectRcList(PageInfo pi, Member m);
	
	// 2. 게시글 작성하기 서비스
	int insertRcBoard(Board b, ArrayList<Attachment> list);
	
	// 3. 게시글 상세조회용 서비스
	int increaseRcCount(int boardNo);
	Board selectRcBoard(int boardNo);
	ArrayList<Attachment> selectRcAtBoard(int boardNo);
	
	// 4. 게시글 삭제하기 서비스
	int deleteRcBoard(int boardNo);
	
	// 5. 게시글 수정하기 서비스
	int updateRcBoard(Board b, ArrayList<Attachment> list);
	int updateRcAtBoard(Attachment at);
	
	// 6. 댓글 작성, 조회용 서비스
	ArrayList<Reply> selectRcReplyList(Board b);
	int insertRcReply(Reply r);
	
	// ------------------- 마이 페이지 게시판 ------------------- //
	int myListCount(int userNo);
	ArrayList<Board> myBoardList(PageInfo pi,int userNo);
	ArrayList<Board> myBookmarksList(PageInfo pi,int userNo);
	ArrayList<Board> myLikeList(PageInfo pi,int userNo);
	ArrayList<Board> myGroupList(PageInfo pi,int userNo);
	ArrayList<Block> myBlockList(PageInfo pi,int userNo);
	
	
	// ------------------------------------------------------ //
	ArrayList<Board> selectTopBoardList();
	ArrayList<Place> selectTopPlaceList();
	
	// ------------------------------------------------------ //
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
	 
	 int checkLike(Board b);
	 int insertLike(Board b);
	 int deleteLike(Board b);
	 
	 int insertWallPaper(WallPaper wp);
	 
	 //팔로우
	 int insertfollow(Follow f);
	 
	 // 프로필 조회
	 int profileListCount(String userId);
	 ArrayList<Board> profileBoardList(PageInfo pi, String userId);
	 
	 //팔로우 취소
	 int unfollow(Follow f);
	 
	 //작성자 팔로우
	 ArrayList<Follow> selectFollowMember(Board b);
}
