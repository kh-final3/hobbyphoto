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
		ArrayList<Cart> selectCartProList(int userNo);
		
		//6.장바구니에서 수량 변경(업데이트)
		int updateCartAmount(Cart cart);
		
		//7. 장바구니 상품 선택 삭제(delete)
		int deleteCartProduct(ArrayList<Cart> clist);
		
		//8.장바구니에서 상품 선택해서 구매페이지 넘기기
		ArrayList<Cart> selectCartBuy(ArrayList<Cart> blist);
}
