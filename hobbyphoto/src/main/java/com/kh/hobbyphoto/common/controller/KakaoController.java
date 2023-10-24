package com.kh.hobbyphoto.common.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hobbyphoto.common.model.service.KakaoService;
import com.kh.hobbyphoto.member.model.service.MemberServiceImpl;
import com.kh.hobbyphoto.member.model.vo.Member;

@Controller
public class KakaoController {
	
	@Autowired
	private KakaoService kakao;

	@Autowired
	private MemberServiceImpl ms;
	@RequestMapping(value="/")
    public String index() {
        return "main";
    }
	
	@RequestMapping(value="/login")
    public String login(@RequestParam("code") String code,HttpSession session) {
        String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        Member m = new Member();
        if (userInfo.get("email") != null) {
        	m.setUserId((String)userInfo.get("email"));
        	Member loginMember = ms.loginMember(m);
         	if(loginMember == null) {
         		m.setUserPwd("kakao");
         		m.setUserName((String)userInfo.get("nickname"));
         		m.setNickName((String)userInfo.get("nickname"));
         		m.setEmail((String)userInfo.get("email"));
        		int result = ms.insertMemberKakao(m);
        		if(result>0) {
        			loginMember = ms.loginMember(m);
        		}
        	}
         	session.setAttribute("loginMember", loginMember);
            session.setAttribute("access_Token", access_Token);
        }
        return "main";
    }

}
