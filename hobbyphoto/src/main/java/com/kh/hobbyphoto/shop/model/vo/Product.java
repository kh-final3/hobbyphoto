package com.kh.hobbyphoto.shop.model.vo;

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
public class Product {
	
	private int pNo;
	private String pName;
	private int categoryNo;
	private int brandNo;
	private String price;
	private int amount;
	private String status;
	private String thumbnail;
	private String pDimg;
	private String pSimg;
	private int pType;
}
