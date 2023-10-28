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
public class D_order {
	private int orderNo;
	private int pNo;
	private String userNo;
	private int amount;
	private int pType;
}
