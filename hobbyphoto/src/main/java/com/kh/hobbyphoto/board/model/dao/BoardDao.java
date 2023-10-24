package com.kh.hobbyphoto.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.board.model.vo.Attachment;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Festival;
import com.kh.hobbyphoto.board.model.vo.Place;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	
	public int selectPlaceListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectPlaceListCount");
	}
	
	public ArrayList<Place> selectPlaceList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectPlaceList", null, rowBounds);
	}
	
	public int increaseCountPlace(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.update("boardMapper.increaseCountPlace", pno);
	}

	public Place selectPlace(SqlSessionTemplate sqlSession, int pno) {
		return (Place)sqlSession.selectOne("boardMapper.selectPlace", pno);
	}

	public int insertPlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.insert("boardMapper.insertPlace", p);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		System.out.println(list);
		return sqlSession.insert("boardMapper.insertAttachment", list);
	}

	public ArrayList<Reply> placeReplyList(SqlSessionTemplate sqlSession, int pno) {
		return  (ArrayList)sqlSession.selectList("boardMapper.placeReplyList", pno);
	}

	public int placeInsertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.placeInsertReply", r);
	}

	public ArrayList sortPlaceList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.sortPlaceList", map, rowBounds);
	}

	public int updatePlace(SqlSessionTemplate sqlSession, Place p) {
		System.out.println(p);
		return sqlSession.update("boardMapper.updatePlace", p);
	}

	
	public int updatePlaceAttachment(SqlSessionTemplate sqlSession, Attachment attachment) {
		return sqlSession.update("boardMapper.updatePlaceAttachment", attachment);
	}
	
	public int deletePlace(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.delete("boardMapper.deletePlace", pno);
	}
	
	
	
	
	public int cultureListCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("boardMapper.cultureListCount", keyword);
	}

	public ArrayList<Festival> cultureList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.cultureList", keyword, rowBounds);
	}

	public Festival selectCulture(SqlSessionTemplate sqlSession, int feNo) {
		return (Festival)sqlSession.selectOne("boardMapper.selectCulture", feNo);
	}

	public int insertCulture(SqlSessionTemplate sqlSession, Festival fe) {
		return sqlSession.insert("boardMapper.insertCulture", fe);
	}

	public int insertAttachment2(SqlSessionTemplate sqlSession, Attachment attachment) {
		
		return sqlSession.insert("boardMapper.insertAttachment2", attachment);
	}

	public int updateCulture(SqlSessionTemplate sqlSession, Festival fe) {
		return sqlSession.update("boardMapper.updateCulture", fe);
	}



}
