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
public class Cart {
	private int pNo;
	private int userNo;
	private int amount;
	private String status;
	
	
	private String pName;
	private int brandNo;
	private String brandName;
	private String thumbnail;
	private String price;
	
	private String proamount;
}
