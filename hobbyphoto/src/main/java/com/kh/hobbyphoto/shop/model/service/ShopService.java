package com.kh.hobbyphoto.shop.model.service;

import java.util.ArrayList;

import com.kh.hobbyphoto.shop.model.vo.Cart;
import com.kh.hobbyphoto.shop.model.vo.Product;

public interface ShopService {

		//1. 상품 리스트 조회
		ArrayList<Product> selectProductList();
		
		//2. 상품 상세 조회
		Product selectProduct(int pno);
		
		//3. 장바구니 조회(장바구니클릭 시 -> 상품 중복 확인용)
		ArrayList<Cart> selectCartList(int userNo);
		
		//4.장바구니 등록
		int insertCartProduct(Cart cart);
		
		//5.장바구니 조회(아이콘 클릭 -> 내가 한 장바구니 목록 확인)
		ArrayList<Cart> selectProCartList(int userNo);
}
