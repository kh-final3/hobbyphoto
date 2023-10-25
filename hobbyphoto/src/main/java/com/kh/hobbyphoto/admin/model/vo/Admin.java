package com.kh.hobbyphoto.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class Admin {

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public static class AdminReqDto{
        private String username;
        private String password;
    }	
	
}
