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
	private String feLocation;
	private String cash;
	private String feType;
	private String longitude;
	private String latitude;
	private String url;
	private String tImg;
	private String sImg;
}
