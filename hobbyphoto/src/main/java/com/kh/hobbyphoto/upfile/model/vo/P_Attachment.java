package com.kh.hobbyphoto.upfile.model.vo;

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
public class P_Attachment {
	private int fileNo;
	private String orignName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	private String refPno;
}
