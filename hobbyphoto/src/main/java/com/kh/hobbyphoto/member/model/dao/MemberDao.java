package com.kh.hobbyphoto.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.member.model.vo.Member;

@Repository
public class MemberDao {

	public int loginMember(SqlSessionTemplate session, Member m) {
		return session.selectOne("memberMapper.loginMember", m);
	}
}
