package com.kh.hobbyphoto.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.hobbyphoto.common.model.service.MailService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MailController {
	
	private MailService mailService;
	
	@GetMapping("/")
	public String MailPage() {
		return "Mail";
	}
	
	@PostMapping("/mail")
	public void MailSend(String mail) {
		mailService.createMail(mail);
	}
}
