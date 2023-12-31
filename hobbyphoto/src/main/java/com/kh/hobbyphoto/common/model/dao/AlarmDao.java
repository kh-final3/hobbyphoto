package com.kh.hobbyphoto.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.common.model.vo.Alarm;

@Repository
public class AlarmDao {
	public int insertAlram(SqlSessionTemplate sqlSession,Alarm a) {
		return sqlSession.insert("alarmMapper.insertAlram",a);
	}
	
	public int alramCount(SqlSessionTemplate sqlSession,Alarm a) {
		return sqlSession.selectOne("alarmMapper.alramCount",a);
	}
	public ArrayList<Alarm> alramList(SqlSessionTemplate sqlSession,Alarm a) {
		return (ArrayList)sqlSession.selectList("alarmMapper.alramList",a);
	}
	public int alramClick(SqlSessionTemplate sqlSession,Alarm a) {
		return sqlSession.delete("alarmMapper.alramClick",a);
	}
	
}
