package com.kh.hobbyphoto.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("shNotice.list")
	public String selectShopNotice() {
		return "notice/selectShopNoticeList";
	}
	
}
