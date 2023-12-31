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
	
	private Date createDate;
	private String status;
	private int pType;
	
	private String img;
	private int count;
}
