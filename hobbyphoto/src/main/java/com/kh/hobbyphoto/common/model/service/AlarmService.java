package com.kh.hobbyphoto.common.model.service;

import java.util.ArrayList;

import com.kh.hobbyphoto.common.model.vo.Alarm;

public interface AlarmService {
	int insertAlram(Alarm a);
	
	int alramCount(Alarm a);
	
	ArrayList<Alarm> alramList(Alarm a);
	
	int alramClick(Alarm a);
}
