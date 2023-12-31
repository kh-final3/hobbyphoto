package com.kh.hobbyphoto.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Place {
	private int pno;
	private String ptitle;
	private String pcontent;
	private String plocation;
	private String paddress;
	private String pwriter;
	private Date createDate;
	private int	count;
	private String pimg1;
	private String pimg2;
	private String pimg3;
	private String pimg4;
	private MultipartFile[] upfiles;
	private String keyword;
	private int fileNo1;
	private int fileNo2;
	private int fileNo3;
	private int fileNo4;
}
