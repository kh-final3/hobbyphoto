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
public class Review {
	private int reviewNo;
	private int refPno;
	private String reviewContent;
	private String reviewWriter;
	private String reviewImg;
	private Date createDate;
	private String status;
}
