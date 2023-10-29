package com.kh.hobbyphoto.board.model.vo;

import java.sql.*;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Wallpaper {
	int backNo;
	String userNo;
	String img;
	Date createDate;
	int count;
	int download;
	int boardType;
	String status;
}
