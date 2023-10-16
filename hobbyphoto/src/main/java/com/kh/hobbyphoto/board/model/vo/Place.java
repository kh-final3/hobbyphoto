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
	private int pno;
	private String ptitle;
	private String pcontent;
	private String plocation;
	private String paddress;
	private String pimg1;
	private String pimg2;
	private String pimg3;
	private String pimg4;
}
