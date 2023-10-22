package com.kh.hobbyphoto.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.board.model.dao.BoardDao;
import com.kh.hobbyphoto.board.model.vo.Attachment;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Festival;
import com.kh.hobbyphoto.board.model.vo.Place;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		int result = bDao.selectListCount(sqlSession);
		return result;
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		ArrayList<Board> list = bDao.selectList(sqlSession, pi);
		return list;
	}

	@Override
	public int insertBoard(Board b) {
		int result = bDao.insertBoard(sqlSession, b);
		return result;
	}

	@Override
	public int increaseCount(int pno) {
		return bDao.increaseCount(sqlSession, pno);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return bDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return bDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(sqlSession, b);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return bDao.selectReplyList(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Reply r) {
		return bDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Board> selectTopBoardList() {
		return bDao.selectTopBoardList(sqlSession);
	}
	
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
	public ArrayList<Reply> placeReplyList(int pno) {
		return bDao.placeReplyList(sqlSession, pno);
	}

	@Override
	public int placeInsertReply(Reply r) {
		return bDao.placeInsertReply(sqlSession, r);
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

	public int getImageCount(int pno) {
		
		return bDao.getImageCount(sqlSession, pno);
	}

	public int insertAttachmentPlace(ArrayList<Attachment> list) {
		
		return bDao.insertAttachment(sqlSession, list);
	}

	public int cultureListCount(String keyword) {
		return bDao.cultureListCount(sqlSession, keyword);
	}

	public ArrayList<Festival> cultureList(PageInfo pi, String keyword) {
		return bDao.cultureList(sqlSession,pi,keyword);
	}

	public Festival selectCulture(int feNo) {
		return bDao.selectCulture(sqlSession, feNo);
	}

	public int insertExhibit(Festival fe) {
		return bDao.insertExhibit(sqlSession,fe);
	}

	public int insertAttachmentPlace2(Attachment attachment) {
		
		return bDao.insertAttachment2(sqlSession, attachment);
	}

	

}
