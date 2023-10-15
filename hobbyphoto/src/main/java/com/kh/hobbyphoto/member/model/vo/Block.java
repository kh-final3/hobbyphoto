package com.kh.hobbyphoto.member.model.vo;

import java.sql.Date;

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
public class Block {
	private int blockNo;
	private int userNo;
	private int refNo;
	private Date blackDate;
}
