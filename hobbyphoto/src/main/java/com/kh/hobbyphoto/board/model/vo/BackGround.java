package com.kh.hobbyphoto.board.model.vo;

import java.sql.Date;

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
public class BackGround {
	private int backNo;
	private int userNo;
	private String img;
	private Date createDate;
	private int count;
	private int download;
	private String nickname;
}
