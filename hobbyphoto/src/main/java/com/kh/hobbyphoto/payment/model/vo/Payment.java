package com.kh.hobbyphoto.payment.model.vo;

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
public class Payment {

	private String pg;
	private String payMethod;
	private String merchantUid;
	private String name;
	private int amount;
	private String buyerEmail;
	private String buyername;
	private String buyerTel;
	private String buyerAddr;
	private String buyerPostcode;
}
