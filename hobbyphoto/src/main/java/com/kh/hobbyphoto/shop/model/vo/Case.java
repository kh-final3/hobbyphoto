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
public class Case {
	private int cNo;
	private int userNo;
	private String photo;
	private int price;
	private String kind;
	private Date createDate;
	private String status;
	private int pType;
}
