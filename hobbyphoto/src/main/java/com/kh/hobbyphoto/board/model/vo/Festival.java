package com.kh.hobbyphoto.board.model.vo;

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
public class Festival {
	private int feNo;
	private String feTitle;
	private String feContent;
	private String feDate;
	private String feDate1;
	private String feDate2;
	private String feLocation;
	private String cash;
	private String feType;
	private String longitude;
	private String latitude;
	private String url;
	private String timg;
	private String simg;
	private String age;
	private String host;
	private String inq;
}
