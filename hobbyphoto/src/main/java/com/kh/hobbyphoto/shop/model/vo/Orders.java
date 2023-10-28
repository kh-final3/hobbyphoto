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
public class Orders {
	private int orderNo;
	private int userNo; 
	
	private String name;
	private String address;
	private String postcode;
	private String phone;
	private String orderDate;
	private String totalPrice;
	private String status;
	private String pType;
	private String oMsg;
	private String dMsg;
	
	private int pNo;
	private String pName;
	private int price;
	private int amount;
	private String userName;
}
