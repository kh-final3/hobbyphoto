package com.kh.hobbyphoto.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.member.model.vo.Member;

@Repository
public class MemberDao {
	public int insertMember(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public Member loginMember(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}
	
	public Member searchId(SqlSessionTemplate sqlSession,String userName) {
		return sqlSession.selectOne("memberMapper.searchId",userName);
	}
	
	public Member searchPwd(SqlSessionTemplate sqlSession,String userId) {
		return sqlSession.selectOne("memberMapper.searchPwd",userId);
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.update("memberMapper.deleteMember",m);
	}
}
