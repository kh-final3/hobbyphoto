package com.kh.hobbyphoto.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public int selectShopListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectShopListCount");
	}

	public ArrayList<Notice> selectShopList(SqlSessionTemplate sqlSession, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectShopList", pi);
	}

	public int increaseShCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("noticeMapper.increaseShCount", boardNo);
	}

	public ArrayList<Notice> selectShNotice(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList) sqlSession.selectList("noticeMapper.selectShNotice", boardNo);
	}

}
