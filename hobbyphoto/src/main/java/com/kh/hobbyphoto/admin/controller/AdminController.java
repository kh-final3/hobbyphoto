package com.kh.hobbyphoto.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hobbyphoto.admin.model.service.AdminServiceImpl;

@Controller
public class AdminController {

	@Autowired
	private AdminServiceImpl aService;
	
	@RequestMapping("admin.pg")
	public String adminForm() {
		return "admin/adminIndex";
	}
	
	@RequestMapping("insert.proform")
	public String insertProFrom() {
		return "admin/productRegist";
	}
}
