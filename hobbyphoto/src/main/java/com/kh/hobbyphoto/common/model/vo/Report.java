package com.kh.hobbyphoto.common.model.vo;

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
public class Report {
	private int rpNo;
	private String guilty;
	private String rpContent;
	private String process;
	private String refBno;
	private int reportUno;
	private int reportedUno;
	private String boardType;
}
