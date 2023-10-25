package com.kh.hobbyphoto.member.model.service;

import com.kh.hobbyphoto.member.model.vo.Member;

public interface MemberService {
//서비스 설계하는 곳
	Member loginMember(Member m);
	
	int insertMember(Member m);
	
	int insertMemberKakao(Member m);
	
	int insertMemberGoogle(Member m);
	
	Member searchId(String userName);
	
	Member searchPwd(String userId);

	int updatePwd(Member m);
	
	int deleteMember(Member m);
}
