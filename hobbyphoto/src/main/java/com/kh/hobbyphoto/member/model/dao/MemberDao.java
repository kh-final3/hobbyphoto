package com.kh.hobbyphoto.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.common.model.vo.Follow;
import com.kh.hobbyphoto.member.model.vo.Member;

@Repository
public class MemberDao {
	public int insertMember(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int insertMemberKakao(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.insert("memberMapper.insertMemberKakao", m);
	}
	
	public int insertMemberGoogle(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.insert("memberMapper.insertMemberGoogle",m);
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
	
	public int myListCount(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("memberMapper.myListCount",userNo);
	}
	
	public int myGroupCount(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("memberMapper.myGroupCount",userNo);
	}
	
	public int myLikeCount(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("memberMapper.myLikeCount",userNo);
	}
	
	public int myBlockCount(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("memberMapper.myBlockCount",userNo);
	}
	
	public int updateNick(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.update("memberMapper.updateNick",m);
	}
	
	public int updateDescription(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.update("memberMapper.updateDescription",m);
	}
	
	public int updateGender(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.update("memberMapper.updateGender",m);
	}
	
	public int selectFollowCount(SqlSessionTemplate sqlSession,String userId) {
		return sqlSession.selectOne("memberMapper.selectFollowCount",userId);
	}
	
	public int selectFollowingCount(SqlSessionTemplate sqlSession,String userId) {
		return sqlSession.selectOne("memberMapper.selectFollowingCount",userId);
	}
	
	public ArrayList<Follow> selectFollow(SqlSessionTemplate sqlSession,String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollow",userId);
	}
	
	public ArrayList<Follow> selectFollowing(SqlSessionTemplate sqlSession,String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowing",userId);
	}

	public int updateImg(SqlSessionTemplate sqlSession, Member m) {
		System.out.println(m);
		return sqlSession.update("memberMapper.updateImg",m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.idCheck",userId);	
	}
}
