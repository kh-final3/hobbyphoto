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
}
