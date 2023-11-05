package com.kh.hobbyphoto.shop.model.vo;

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
public class Templates {
	private int tNo;
	private int price;
	
	private String temName;
	private int pType;
	private String titleImg; //템플릿 이미지
	private String temImg; //설명 이미지
	private String status;
}
