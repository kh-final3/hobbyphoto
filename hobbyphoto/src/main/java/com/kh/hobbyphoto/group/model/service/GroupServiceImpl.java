package com.kh.hobbyphoto.group.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.group.model.dao.GroupDao;
import com.kh.hobbyphoto.group.model.vo.GroupD;
import com.kh.hobbyphoto.group.model.vo.Sgroup;

@Service
public class GroupServiceImpl implements GroupService{
	@Autowired
	private GroupDao GDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectTgListCount() {
		return GDao.selectTgListCount(sqlSession);
	}

	public ArrayList<Sgroup> selectTgList(PageInfo pi) {
		return GDao.selectTgList(sqlSession, pi);
	}
	
	@Override
	public Sgroup selectTgBoard(int boardNo) {
		return GDao.selectTgBoard(sqlSession, boardNo);
	}

	@Override
	public int insertSgBoard(Sgroup g) {
		return GDao.insertSgBoard(sqlSession, g);
	}

	public int deleteTogether(int boardNo) {
		return GDao.deleteTogether(sqlSession, boardNo);
	}

	public int enrollGroup(GroupD gr) {
		int result = GDao.enrollGroup(sqlSession, gr);
		int result2 = 0;
		if(result > 0) {
			result2 = GDao.groupCount(sqlSession, gr);
		}
		return result * result2;
	}

	public int deleteMember(GroupD gr) {
		int result = GDao.deleteMember(sqlSession, gr);
		int result2 = 1;
		
		if(result > 0) {
			result2 = GDao.groupCountDown(sqlSession, gr);
		}
		return result * result2;
	}

	public ArrayList<GroupD> selectGroupPeople(int gno) {
		return GDao.selectGroupPeople(sqlSession, gno);
	}




	

	
}
