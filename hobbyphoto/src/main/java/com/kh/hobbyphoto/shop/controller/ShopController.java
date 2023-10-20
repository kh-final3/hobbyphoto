package com.kh.hobbyphoto.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hobbyphoto.shop.model.service.ShopServiceImpl;
import com.kh.hobbyphoto.shop.model.vo.Cart;
import com.kh.hobbyphoto.shop.model.vo.Product;

@Controller
public class ShopController {

	@Autowired
	private ShopServiceImpl sService;
	
	
	@RequestMapping("shop.main")
	public String goShopMain() {
		return "shop/shopMain";
	}
	
	@RequestMapping("pro.list")
	public String selectProdcutList(Model model) {
		ArrayList<Product> list = sService.selectProductList();
		
		//System.out.println(list);
		
		model.addAttribute("list",list);
		
		return "shop/shopMain";
	}
	
	@RequestMapping("detail.pro")
	public ModelAndView selectProduct(int pno, ModelAndView mv) {
		Product p = sService.selectProduct(pno);
		
		mv.addObject("p", p).setViewName("shop/shopDetail");
		
		return mv;
	}
	
	@RequestMapping("cart.pro")
	public ModelAndView insertCartProduct(int userNo,String prono ,Cart cart, HttpSession session, ModelAndView mv) {
		cart.setPNo(Integer.parseInt(prono));
		ArrayList<Cart> list = sService.selectCartList(userNo);
		
		//System.out.println(list);
		//for(int i=0;i<list.size();i++) {
		//	System.out.println(list.get(i));
		//}
		
		// list에 있는 제품 번호와 새로 추가하려는 제품 번호를 비교
	    boolean exists = false; // 상품이 이미 있는지 확인하는 플래그

	    for(Cart c : list) {
	        if(c.getPNo() == cart.getPNo()) {
	            exists = true;
	            break; // 같은 상품 번호 발견 시 루프 종료
	        }
	    }

	    System.out.println(list);
	    System.out.println(exists);
	    
	    if(!exists) {
	        // 상품 번호가 리스트에 없으므로 장바구니에 추가
	    	int restul = sService.insertCartProduct(cart);
	    	
	    	if(restul >0) {//추가 성공
	    		session.setAttribute("alertMsg", "장바구니에 추가되었습니다.");
	    		mv.setViewName("redirect:detail.pro?pno="+cart.getPNo());
	    		
	    	}else {//추가 실패
	    		mv.addObject("errorMsg","장바구니 추가에 실패했습니다.");
	    		mv.setViewName("common/errorPage");
	    	}
	    	return mv;
	    } else {
	        // 알림창 => "장바구니에 이미 해당 상품이 있습니다."
	    	session.setAttribute("alertMsg", "장바구니 안에 해당 상품이 이미 있습니다.");
	    	mv.setViewName("redirect:detail.pro?pno="+cart.getPNo());
	    }
		return mv;
	}
	
	@RequestMapping("shop.mp")
	public String shopMyPage(int userNo) {
		
		ArrayList<Cart> list = sService.selectProCartList(userNo);
		
		
		
		return "shop/shopCart";
	}
}
