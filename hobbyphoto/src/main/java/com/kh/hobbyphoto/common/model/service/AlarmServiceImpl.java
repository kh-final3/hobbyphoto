package com.kh.hobbyphoto.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.common.model.dao.AlarmDao;
import com.kh.hobbyphoto.common.model.vo.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AlarmDao aDao;

	@Override
	public int insertAlram(Alarm a) {
		return aDao.insertAlram(sqlSession,a);
	}

	@Override
	public int alramCount(Alarm a) {
		return aDao.alramCount(sqlSession,a);
	}

	@Override
	public ArrayList<Alarm> alramList(Alarm a) {
		return aDao.alramList(sqlSession,a);
	}

	@Override
	public int alramClick(Alarm a) {
		return aDao.alramClick(sqlSession,a);
	}
	
}
