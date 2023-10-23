package com.kh.hobbyphoto.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hobbyphoto.group.model.service.GroupServiceImpl;


@Controller
public class GroupController {
	
	@Autowired
	private GroupServiceImpl gService;

	@RequestMapping("list.to")
	public String togetherList() {
		return "together/togetherListView";
	}
	
	@RequestMapping("detail.to")
	public String togetherDetail() {
		return "together/togetherDetailView";
	}
}
