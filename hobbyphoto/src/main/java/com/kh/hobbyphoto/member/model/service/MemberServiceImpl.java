package com.kh.hobbyphoto.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.member.model.dao.MemberDao;
import com.kh.hobbyphoto.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao md;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		return md.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return md.insertMember(sqlSession, m);
	}

}
