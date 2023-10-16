package com.kh.hobbyphoto.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String nickName;
	private String email;
	private String gender;
	private String phone;
	private String description;
	private String profileImg;
	private String status;
	private String social;
}
