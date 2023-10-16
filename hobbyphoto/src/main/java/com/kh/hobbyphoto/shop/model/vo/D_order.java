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
	private int dOrderNo;
	private int orderNo;
	private int pNo;
	private String name;
	private String address;
	private int postCode;
	private String phone;
	private Date orderDate;
	private String totalPrice; 
	private String status;
	private String pType;
	private String oMsg;
	private String dMsg;
}
