package com.kh.hobbyphoto.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Follow {
	private int userNo;
	private String userId;
	private String followId;
	private String nickname;
	private String profileImg;
	private String followDate;
}
