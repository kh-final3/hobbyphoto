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

}
