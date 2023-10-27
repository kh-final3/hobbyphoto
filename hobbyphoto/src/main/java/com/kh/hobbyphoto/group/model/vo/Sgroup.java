package com.kh.hobbyphoto.group.model.vo;

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
public class Sgroup {
	private int groupNo;
	private String img;
	private String userNo;
	private String title;
	private String content;
	private int meTotal;
	private String location;
	private Date grDate;
	private Date createDate;
	private String status;
	private String boardType;
}
