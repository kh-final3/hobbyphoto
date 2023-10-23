package com.kh.hobbyphoto.board.model.service;

import java.util.ArrayList;

import javax.annotation.processing.SupportedSourceVersion;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.board.model.dao.BoardDao;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.upfile.model.vo.Attachment;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao bDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectPhListCount() {
		int result = bDao.selectPhListCount(sqlSession);
		return result;
	}

	@Override
	public ArrayList<Board> selectPhList(PageInfo pi) {
		ArrayList<Board> list = bDao.selectPhList(sqlSession, pi);
		return list;
	}

	@Override
	public int insertPhBoard(Board b, ArrayList<Attachment> list) {
		int result = bDao.insertPhBoard(sqlSession, b);
		int result2 = 0;
		
		if(result > 0) {
			for(Attachment at : list) {
				result2 = bDao.insertAttachment(sqlSession, at);
			}
		}
		return result * result2;
	}

	
	@Override
	public int increaseCount(int boardNo) {
		return bDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board selectPhBoard(int boardNo) {
		return bDao.selectPhBoard(sqlSession, boardNo);
	}
	
	public ArrayList<Attachment> selectAtBoard(int boardNo){
		return bDao.selectAtBoard(sqlSession, boardNo);
	}

	@Override
	public int deletePhBoard(int boardNo) {
		return bDao.deletePhBoard(sqlSession, boardNo);
	}

	@Override
	public int updatePhBoard(Board b) {
		return bDao.updatePhBoard(sqlSession, b);
	}
	
	@Override
	public int updatePhAtBoard(Attachment at) {
		return bDao.updatePhAtBoard(sqlSession, at);
	}
	
	// ------------------------------------------------------------

	@Override
	public int selectRcListCount() {
		return bDao.selectRcListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectRcList(PageInfo pi) {
		return bDao.selectRcList(sqlSession, pi);
	}

	@Override
	public int increaseRcCount(int boardNo) {
		return bDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board selectRcBoard(int boardNo) {
		return bDao.selectRcBoard(sqlSession, boardNo);
	}

	public ArrayList<Attachment> selectRcAtBoard(int boardNo) {
		return bDao.selectRcAtBoard(sqlSession, boardNo);
	}

	public int insertRcBoard(Board b, ArrayList<Attachment> list) {
		int result = bDao.insertRcBoard(sqlSession, b);
		int result2 = 0;
		
		if(result > 0) {
			for(Attachment at : list) {
				result2 = bDao.insertAttachment(sqlSession, at);
			}
		}
		return result * result2;
	}




	
	



}
