package com.kh.hobbyphoto.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.member.model.dao.MemberDao;
import com.kh.hobbyphoto.member.model.vo.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int loginMember(Member m) {
		int result = mDao.loginMember(session, m);
		return result;
	}
}
