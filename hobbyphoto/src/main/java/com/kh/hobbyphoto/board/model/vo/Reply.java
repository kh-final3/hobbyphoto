package com.kh.hobbyphoto.board.model.vo;

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
public class Reply {
	private int replyNo;
	private String replyContent;
	private Date createDate;
	private String status;
	private String replyWriter;
	private String refBno;
}
