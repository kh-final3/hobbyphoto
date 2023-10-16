package com.kh.hobbyphoto.board.model.vo;

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
public class Place {
	private int pNo;
	private String pTitle;
	private String pContent;
	private String pLocation;
	private String pAddress;
	private String pImg1;
	private String pImg2;
	private String pImg3;
	private String pImg4;
}
