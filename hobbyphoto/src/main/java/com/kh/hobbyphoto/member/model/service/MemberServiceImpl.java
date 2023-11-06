package com.kh.hobbyphoto.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.common.model.vo.Follow;
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
	
	@Override
	public int insertMemberKakao(Member m) {
		return md.insertMemberKakao(sqlSession, m);
	}
	
	@Override
	public int insertMemberGoogle(Member m) {
		return md.insertMemberGoogle(sqlSession, m);
	}

	@Override
	public Member searchId(String userName) {
		return md.searchId(sqlSession, userName);
	}

	@Override
	public Member searchPwd(String userId) {
		return md.searchPwd(sqlSession, userId);
	}

	@Override
	public int updatePwd(Member m) {
		return md.updatePwd(sqlSession,m);
	}

	@Override
	public int deleteMember(Member m) {
		return md.deleteMember(sqlSession,m);
	}

	@Override
	public int myListCount(int userNo) {
		return md.myListCount(sqlSession,userNo);
	}

	@Override
	public int myGroupCount(int userNo) {
		return md.myGroupCount(sqlSession,userNo);
	}

	@Override
	public int myLikeCount(int userNo) {
		return md.myLikeCount(sqlSession,userNo);
	}

	@Override
	public int myBlockCount(int userNo) {
		return md.myBlockCount(sqlSession,userNo);
	}

	@Override
	public int updateNick(Member m) {
		return md.updateNick(sqlSession,m);
	}

	@Override
	public int updateDescription(Member m) {
		return md.updateDescription(sqlSession,m);
	}

	@Override
	public int updateGender(Member m) {
		return md.updateGender(sqlSession,m);
	}

	@Override
	public int selectFollowCount(String userId) {
		return md.selectFollowCount(sqlSession,userId);
	}
	
	@Override
	public ArrayList<Follow> selectFollow(String userId) {
		return md.selectFollow(sqlSession,userId);
	}

	@Override
	public int selectFollowingCount(String userId) {
		return md.selectFollowingCount(sqlSession,userId);
	}
	
	@Override
	public ArrayList<Follow> selectFollowing(String userId) {
		return md.selectFollowing(sqlSession,userId);
	}

	public int updateImg(Member m) {
		return md.updateImg(sqlSession,m);
	}

	public int idCheck(String userId) {
		return md.idCheck(sqlSession,userId);
	}


}
