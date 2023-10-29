package com.kh.hobbyphoto.payment.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hobbyphoto.shop.model.vo.Orders;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {
	
private IamportClient api;
	
	public PaymentController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("7262101336512662","XiK6KLBf1JKg55Fh3S7J5bUXCEUzoKGoXcPHHU8K19nuOMmdtcSQn1WsXNMkMA8gaXwz8Ksqx0Cobd9T");
	}
		
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{

			return api.paymentByImpUid(imp_uid);
	}

	//@RequestMapping("pro.onebuy")
	public void check(@RequestParam(name="name") String pName) {
		System.out.println("rkrk" + pName);
		//System.out.println("rkssss" + address);
		
	}
}
