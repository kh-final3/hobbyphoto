package com.kh.hobbyphoto.admin.model.service;


import java.util.ArrayList;

import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.upfile.model.vo.P_Attachment;


public interface AdminService {
		
	//1. 상품 등록하기
	int insertProduct(Product p);
	
	
}
