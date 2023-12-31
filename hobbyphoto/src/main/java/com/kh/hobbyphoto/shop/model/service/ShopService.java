package com.kh.hobbyphoto.shop.model.service;

import java.util.ArrayList;

import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.shop.model.vo.Cart;
import com.kh.hobbyphoto.shop.model.vo.D_order;
import com.kh.hobbyphoto.shop.model.vo.Orders;
import com.kh.hobbyphoto.shop.model.vo.Photo;
import com.kh.hobbyphoto.shop.model.vo.PhotoDetail;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.shop.model.vo.Templates;

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
		
		//8.상품 상세에서 바로 구매하기 누렸을 경우 재고 확인
		int selectProductamount(int pno);
		
		//9.구매상품 조회
		Product selectBuyProduct(int pno);
		
		//10.키워드 검색
		ArrayList<Product> selectshopkeyword(String keyword);
		
		//11.브랜드만 선택 검색
		ArrayList<Product> selectbrandProduct(int brandNo);
		
		//12.브랜드+카테고리 선택 검색
		ArrayList<Product> selectAllSearchProduct(Product p);
		
		//13.단품 결제하기(주문orders테이블 + 상세order)
		int insertOneOrder(Orders ords);
		
		//14.장바구니 결제하기(주문상세테이블 주문테이블은 코드 재사용)
		int insertProductAllBuy(Orders ords,ArrayList<D_order> buylist);
		
		//15. 주문번호 확인(장바구니용)
		Orders selectOrderNo(int userNo);
		
		//16. 장바구니 품절 상품 삭제
		//상품 제고 조회(장바구니에 있는 상품)
		ArrayList<Cart> selectAmount(ArrayList<Cart> buylist);
		//장바구니에서 해당 상품 삭제
		int deleteAmountZero(ArrayList<Cart> de);
		
		//17.마이페이지 들어갈시 주문관련 정보
		Orders selectOrderInfo(int userNo);
		
		//18.마이페이지=> 주문 조회
		ArrayList<Orders> selectOrder(int userNo,PageInfo pi);
		
		//19.주문조회 페이징
		int selectOrderListCount(int userNo);
		
		//20.상품 구매 후 재고 변동(단품)
		int updateProduct(Orders ords);
		
		//21.사진 저장(인생넷컷)
		int insertPhoto(PhotoDetail pd);
		
		//22.포토북 리스트
		ArrayList<Templates> selectTemplate();
		
		//23.포토북 상세
		Templates selectTemplateDetail(int tno);
		//24.포토테이블 인서트
		int insertOnePhoto(Photo p);
		//25.탬플릿 정보 가져오기
		Templates selectTemInfo(int tNo);
		Photo PnoSelect(int userno);
		//26.사진 주문테이블로 넘기기
		int updatePhoto(int pNo);
		Photo finishTem(int pNo);
		PhotoDetail finishPhoto(int pNo);
		Templates finishTemplate(int tno);
		
		int insertTemplateBuy(Orders o);
		Orders selectOrderTemInfo(int userNo);
		
}
