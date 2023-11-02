package com.kh.hobbyphoto.shop.model.vo;

import java.sql.Date;

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
public class Photo {
	private int pNo;
	private int tNo;
	private int userNo;
	private String img1;
	private	String img2;
	private String img3;
	private String img4;
	private String img5;
	private String img6;
	private String img7;
	private String img8;
	private String img9;
	private String img0;
	private Date createDate;
	private String status;
	private int pType;
}
