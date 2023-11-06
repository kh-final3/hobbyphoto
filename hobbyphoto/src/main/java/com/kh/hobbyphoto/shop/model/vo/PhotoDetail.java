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
public class PhotoDetail {
	private int pNo;
	private int tNo;
	private int userNo;
	private String imgs;
	private String createDate;
	private String status;
}
