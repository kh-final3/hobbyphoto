package com.kh.hobbyphoto.board.model.vo;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Report {
	int rpNo;
	String guilty;
	String rpContent;
	String process;
	int refBno;
	int reportUno;
	int reportedUno;
	int boardType;
}
