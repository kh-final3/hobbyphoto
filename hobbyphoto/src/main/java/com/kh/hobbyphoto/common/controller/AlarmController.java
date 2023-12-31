package com.kh.hobbyphoto.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.hobbyphoto.common.model.service.AlarmServiceImpl;
import com.kh.hobbyphoto.common.model.vo.Alarm;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmServiceImpl aService;
	
	//알람
	@ResponseBody
	@RequestMapping(value = "insertAlram")
	public int insertAlram (Alarm a) throws Exception{
		int alram = aService.insertAlram(a);
		return alram;
	}

	//알람수
	@ResponseBody
	@RequestMapping("alramCount")
	public int alramCount (Alarm a) throws Exception{
		int alram = aService.alramCount(a);
		
		return alram;
	}	
	
	
	//알람목록
	@ResponseBody
	@RequestMapping(value = "alramList",produces="application/json; charset=UTF-8")
	public String alramList(Alarm a) throws Exception{
		ArrayList<Alarm> list = aService.alramList(a);
		return new Gson().toJson(list);
	}	
	
	
	//알람클릭
	@ResponseBody
	@RequestMapping(value = "alramClick", method=RequestMethod.POST)
	public int alramClick(Alarm a) throws Exception{
		System.out.println(a);
		int result = aService.alramClick(a);
		if(result>0) {
			return a.getBno();
		}
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value = "alramFollow", method=RequestMethod.POST)
	public String alramFollow(Alarm a) throws Exception{
		int result = aService.alramClick(a);
		if(result>0) {
			return a.getSendId();
		}
		return "";
	}
}
