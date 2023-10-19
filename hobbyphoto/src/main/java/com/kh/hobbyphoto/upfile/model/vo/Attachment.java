package com.kh.hobbyphoto.upfile.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;

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
