package com.kh.hobbyphoto.member.model.service;

import com.kh.hobbyphoto.member.model.vo.Member;

public interface MemberService {
//서비스 설계하는 곳
	Member loginMember(Member m);
	
	int insertMember(Member m);
	
	Member searchId(String userName);
}
