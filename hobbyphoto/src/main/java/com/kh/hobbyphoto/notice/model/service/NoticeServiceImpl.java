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
	
	public int selectShListCount() {
		return nDao.selectShListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		
		return nDao.selectList(sqlSession,pi);
	}
	
	@Override
	public ArrayList<Notice> selectShList(PageInfo pi) {
		
		return nDao.selectShList(sqlSession,pi);
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

	@Override
	public int selectShopListCount() {
		return nDao.selectShopListCount(sqlSession);
	}
	@Override
	public ArrayList<Notice> selectShopList(PageInfo pi) {
		return nDao.selectShopList(sqlSession, pi);
	}
	@Override
	public int insertShNotice(Notice n) {
		return nDao.insertShNotice(sqlSession, n);
	}
	@Override
	public int increaseShCount(int boardNo) {
		return nDao.increaseShCount(sqlSession, boardNo);
	}
	@Override
	public Notice selectShNotice(int boardNo) {
		return nDao.selectShNotice(sqlSession, boardNo);
	}
	
	@Override
	public int shNoticeDelete(int num) {
		return nDao.shNoticeDelete(sqlSession, num);
	}

	public int updateShNotice(Notice n) {
		return nDao.updateShNotice(sqlSession, n);
	}


	


}
