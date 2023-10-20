package com.kh.hobbyphoto.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hobbyphoto.common.model.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	
	@ResponseBody
	@RequestMapping("mail")
	public int MailSend(String mail) {
		int number = mailService.sendMail(mail);
		return number;
	}
}
