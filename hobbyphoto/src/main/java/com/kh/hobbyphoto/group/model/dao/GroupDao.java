package com.kh.hobbyphoto.group.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;

@Repository
public class GroupDao {
	
	public int selectTgListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("sgroupMapper.selectTgListCount");
	}

	public ArrayList<Board> selectTgList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("sgroupMapper.selectTgList", null, rowBounds);
	}

}
