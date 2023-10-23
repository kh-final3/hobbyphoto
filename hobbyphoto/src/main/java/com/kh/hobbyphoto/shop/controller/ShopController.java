package com.kh.hobbyphoto.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hobbyphoto.member.model.vo.Member;
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
	public ModelAndView insertCartProduct(int userNo,String prono,Cart cart, HttpSession session, ModelAndView mv) {
		System.out.println("컨트롤러 : " + prono);
		
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
	public String selectCartProList(int userNo , HttpSession session ,Model model) {
		
		
		System.out.println(userNo);
		
		ArrayList<Cart> list = sService.selectCartProList(userNo);
	
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "shop/shopCart";
	}
	
	@ResponseBody
	@RequestMapping(value="cupdate.amount")
	public String upDateCartAmount(Cart cart) {
		System.out.println(cart);
		int result = sService.updateCartAmount(cart);
		System.out.println(result);
		
		return result>0?"success":"fail";
	}
	
	@ResponseBody
	@RequestMapping("delete.cartp")
	public String deleteCartProduct(String[] pNo,int userNo) {
		
		ArrayList<Cart> clist = new ArrayList<Cart>();
		
		for(int i=0;i<pNo.length;i++) {
			//System.out.println(pNo[i]);

				Cart c = new Cart();
				c.setPNo(Integer.parseInt(pNo[i]));
				c.setUserNo(userNo);
				
				clist.add(c);
			
		}
		System.out.println(clist + "controller에서 clist값");
		
		int result = sService.deleteCartProduct(clist);
		System.out.println(result + "controller에서 result 값");
		return result>0 ? "success":"fail";
		
	}
	
	@RequestMapping("pro.buy")
	public void selectCartBuy(String[] pNo, int userNo) {
		
		ArrayList<Cart> blist = new ArrayList<Cart>();
		//체크된 상품 리스트 만들기
		for(int i = 0; i<pNo.length;i++) {
			
			Cart bc = new Cart();
			bc.setPNo(Integer.parseInt(pNo[i]));
			bc.setUserNo(userNo);
			
			blist.add(bc);
		}
		System.out.println(blist + "컨트롤러에서 blist의 값");
		
		ArrayList<Cart> orlist = sService.selectCartBuy(blist);
		
	}
		
	
}
