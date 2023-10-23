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
	private String userNo; // join 을 위해 String으로 변경함
	private String title;
	private String conent;
	private int pTotal;
	private String location;
	private Date gDate;
	private Date createDate;
	private String status;
	private String boardType;
}
