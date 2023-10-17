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
public class Board {

	private String boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private int count;
	private int boardType;
	private String status;
	private Date createDate;
	private String hashTag;
	private String thumbnail;
}
