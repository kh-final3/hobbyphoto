package com.kh.hobbyphoto.board.model.vo;

import java.sql.Date;

import lombok.*;


@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Attachment {
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	private String refBno;
}
