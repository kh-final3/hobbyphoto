package com.kh.hobbyphoto.board.model.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.board.model.dao.BoardDao;
import com.kh.hobbyphoto.board.model.vo.*;
import com.kh.hobbyphoto.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public int selectPlaceListCount() {
		int result = bDao.selectPlaceListCount(sqlSession);
		return result;
	}
	
	@Override
	public ArrayList<Place> selectPlaceList(PageInfo pi) {
		return bDao.selectPlaceList(sqlSession, pi);
	}
	
	@Override
	public int increaseCountPlace(int pno) {
		return bDao.increaseCountPlace(sqlSession, pno);
	}
	
	
	@Override
	public Place selectPlace(int pno) {
		return bDao.selectPlace(sqlSession, pno);
	}
	
	@Override
	public int insertPlace(Place p, ArrayList<Attachment> list) {
		int result1 = bDao.insertPlace(sqlSession, p);
		
		int result2 = 1;
		
		if(!list.isEmpty()) {
			result2 = bDao.insertAttachment(sqlSession, list);
		}
		return  result1 * result2;
	}
	
	@Override
	public int updatePlace(Place p) {
		return bDao.updatePlace(sqlSession, p);
	}
	
	public int updatePlaceAttachment(Attachment attachment) {
		return bDao.updatePlaceAttachment(sqlSession, attachment);
	}
	
	@Override
	public ArrayList<Place> sortPlaceList(PageInfo pi, HashMap<String, String> map) {
		return bDao.sortPlaceList(sqlSession, map, pi);
	}
	
	@Override
	public int insertAttachmentPlace(ArrayList<Attachment> list) {
		
		return bDao.insertAttachment(sqlSession, list);
	}
	
	@Override
	public int deletePlace(int pno) {
		return bDao.deletePlace(sqlSession,pno);
	}
	
	
	@Override
	public int cultureListCount(String keyword) {
		return bDao.cultureListCount(sqlSession, keyword);
	}
	
	@Override
	public ArrayList<Festival> cultureList(PageInfo pi, String keyword) {
		return bDao.cultureList(sqlSession,pi,keyword);
	}
	
	@Override
	public Festival selectCulture(int feNo) {
		return bDao.selectCulture(sqlSession, feNo);
	}
	
	@Override
	public int insertCulture(Festival fe) {
		return bDao.insertCulture(sqlSession,fe);
	}
	
	@Override
	public int insertAttachmentPlace2(Attachment attachment) {
		
		return bDao.insertAttachment2(sqlSession, attachment);
	}
	
	@Override
	public int updateCulture(Festival fe) {
		return bDao.updateCulture(sqlSession, fe);
	}

	

	

}
