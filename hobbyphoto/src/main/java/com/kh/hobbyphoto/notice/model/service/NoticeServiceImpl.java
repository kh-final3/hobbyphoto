package com.kh.hobbyphoto.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.notice.model.dao.NoticeDao;
import com.kh.hobbyphoto.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao nDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		return nDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		
		return nDao.selectList(sqlSession,pi);
	}

	@Override
	public int insertNotice(Notice n) {
		
		return nDao.insertNotice(sqlSession,n);
	}

	@Override
	public int increaseCount(int noticeNo) {
		
		return nDao.increaseCount(sqlSession,noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		
		return nDao.selectNotice(sqlSession,noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		
		return nDao.deleteNotice(sqlSession,noticeNo);
	}

	@Override
	public int updateNotice(Notice n) {
		
		return nDao.updateNotice(sqlSession,n);
	}

}
