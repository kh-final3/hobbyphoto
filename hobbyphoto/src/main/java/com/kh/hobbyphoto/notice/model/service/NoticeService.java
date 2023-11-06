package com.kh.hobbyphoto.notice.model.service;

import java.util.ArrayList;

import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.notice.model.vo.Notice;

public interface NoticeService {
	
	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi);
	
	int insertNotice(Notice n);
	
	int increaseCount(int noticeNo);
	Notice selectNotice(int noticeNo);
	
	int deleteNotice(int noticeNo);
	
	int updateNotice(Notice n);
	
	// 1. 쇼핑몰 공지사항 리시트 페이지 서비스(페이징)
	int selectShopListCount();
	ArrayList<Notice> selectShopList(PageInfo pi);
	
	// 2. 게시글 작성하기 서비스
	int insertShNotice(Notice n);
	
	// 3. 게시글 상세조회용 서비스
	int increaseShCount(int boardNo);
	Notice selectShNotice(int boardNo);
	
	// 4. 게시글 삭제하기 서비스
	int shNoticeDelete(int num);
	ArrayList<Notice> selectShList(PageInfo pi);
	
	// 5. 게시글 수정하기 서비스
	
	
}
