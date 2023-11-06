package com.kh.hobbyphoto.group.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.group.model.vo.GroupD;
import com.kh.hobbyphoto.group.model.vo.Sgroup;

@Repository
public class GroupDao {
	
	public int selectTgListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("sgroupMapper.selectTgListCount");
	}

	public ArrayList<Sgroup> selectTgList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("sgroupMapper.selectTgList", null, rowBounds);
	}
	
	public int increaseTgCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("sgroupMapper.increaseTgCount", boardNo);
	}

	public Sgroup selectTgBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return (Sgroup) sqlSession.selectOne("sgroupMapper.selectTgBoard", boardNo);
	}

	public int insertSgBoard(SqlSessionTemplate sqlSession, Sgroup g) {
		return sqlSession.insert("sgroupMapper.insertSgBoard", g);
	}

	public int deleteTogether(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("sgroupMapper.deleteTogether", boardNo);
	}

	public int enrollGroup(SqlSessionTemplate sqlSession, GroupD gr) {
		return sqlSession.insert("sgroupMapper.enrollGroup", gr);
	}

	public int groupCount(SqlSessionTemplate sqlSession, GroupD gr) {
		return sqlSession.update("sgroupMapper.groupCount", gr);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, GroupD gr) {
		return sqlSession.delete("sgroupMapper.deleteMember", gr);
	}

	public int groupCountDown(SqlSessionTemplate sqlSession, GroupD gr) {
		return sqlSession.update("sgroupMapper.groupCountDown", gr);
	}

	public ArrayList<GroupD> selectGroupPeople(SqlSessionTemplate sqlSession, int gno) {
		return (ArrayList)sqlSession.selectList("sgroupMapper.selectGroupPeople", gno);
	}

	public ArrayList<GroupD> selectPeopleImg(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("sgroupMapper.selectPeopleImg");
	}


}
