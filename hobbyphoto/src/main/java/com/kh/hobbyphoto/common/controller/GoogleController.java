package com.kh.hobbyphoto.common.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.kh.hobbyphoto.common.model.vo.GoogleInfResponse;
import com.kh.hobbyphoto.common.model.vo.GoogleRequest;
import com.kh.hobbyphoto.common.model.vo.GoogleResponse;
import com.kh.hobbyphoto.member.model.service.MemberServiceImpl;
import com.kh.hobbyphoto.member.model.vo.Member;

@Controller
public class GoogleController {
	@Value("860686382085-sag7ri1m1cuu3t9csh56c9c0t8touqei.apps.googleusercontent.com")
    private String googleClientId;
    @Value("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")
    private String googleClientPw;
    
    @Autowired
    private MemberServiceImpl ms;


    @RequestMapping("google")
    public String loginGoogle(@RequestParam(value = "code") String authCode,HttpSession session){
        RestTemplate restTemplate = new RestTemplate();
        GoogleRequest googleOAuthRequestParam = GoogleRequest
                .builder()
                .clientId(googleClientId)
                .clientSecret(googleClientPw)
                .code(authCode)
                .redirectUri("http://localhost:8006/hobbyphoto/google")
                .grantType("authorization_code").build();
        ResponseEntity<GoogleResponse> resultEntity = restTemplate.postForEntity("https://oauth2.googleapis.com/token",
                googleOAuthRequestParam, GoogleResponse.class);
        String jwtToken=resultEntity.getBody().getId_token();
        Map<String, String> map=new HashMap<>();
        map.put("id_token",jwtToken);
        ResponseEntity<GoogleInfResponse> resultEntity2 = restTemplate.postForEntity("https://oauth2.googleapis.com/tokeninfo",
                map, GoogleInfResponse.class);
        String email=resultEntity2.getBody().getEmail();
        Member m = new Member();
        m.setUserId(email);
        
        Member loginMember = ms.loginMember(m);
        
        if(loginMember == null) {
        	m.setUserPwd("google");
        	m.setUserName(resultEntity2.getBody().getName());
        	m.setNickName(resultEntity2.getBody().getName());
        	m.setEmail(email);
        	int result = ms.insertMemberGoogle(m);
        	if(result>0) {
        		loginMember = ms.loginMember(m);
        	}
        }
        session.setAttribute("loginMember", loginMember);
        return "main";
    }
}
