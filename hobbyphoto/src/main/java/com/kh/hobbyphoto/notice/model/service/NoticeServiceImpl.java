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
	public int selectShopListCount() {
		return nDao.selectShopListCount(sqlSession);
	}
	@Override
	public ArrayList<Notice> selectShopList(PageInfo pi) {
		return nDao.selectShopList(sqlSession, pi);
	}
	@Override
	public int insertShNotice(Notice n, ArrayList<Notice> list) {
		return 0;
	}
	@Override
	public int increaseShCount(int boardNo) {
		return 0;
	}
	@Override
	public Notice selectShNotice(int boardNo) {
		return null;
	}
	


}
