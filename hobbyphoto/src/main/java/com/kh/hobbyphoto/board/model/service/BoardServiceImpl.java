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
	public int insertBoard(Board b, ArrayList<Attachment> list) {
		int result = bDao.insertBoard(sqlSession, b);
	
		int result2 = 0;
		if(result > 0) {//성공
			//사진을 입력
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
	public Board selectpBoard(int boardNo) {
		return bDao.selectpBoard(sqlSession, boardNo);
	}
	
	public ArrayList<Attachment> selectAtBoard(int boardNo){
		return bDao.selectAtBoard(sqlSession, boardNo);
	}



}
