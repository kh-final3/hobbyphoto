package com.kh.hobbyphoto.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
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
import com.kh.hobbyphoto.shop.model.vo.D_order;
import com.kh.hobbyphoto.shop.model.vo.Orders;
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
		
		ArrayList<Cart> list = sService.selectCartProList(userNo);
	
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
	public String selectCartBuy(String[] pNo,HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginMember");
		
		//for(int i = 0; i<pNo.length;i++) {
		//	System.out.println("pNo확인중 + " + pNo[i]);
		//}
		
		ArrayList<Cart> blist = new ArrayList<Cart>();
		//체크된 상품 리스트 만들기
		for(int i = 0; i<pNo.length;i++) {
			Cart bc = new Cart();
			bc.setPNo(Integer.parseInt(pNo[i]));
			bc.setUserNo(m.getUserNo());
			blist.add(bc);
		}
		
		System.out.println(blist + "컨트롤러에서 blist의 값");
		//System.out.println(blist.get(1).getPNo()+"상품 번호 확인중");
			
		//ArrayList<Orders> list = sService.selectCartBuy(blist.get(1).getPNo());
		
		ArrayList<Cart> buylist = sService.selectCartBuy(blist);
		
		//for(int i = 0; i<buylist.size();i++) {
		//System.out.println("리턴값 확이중 + " + buylist.get(i));
		//}
		model.addAttribute("buylist", buylist);
		System.out.println(buylist + "장바구니에서 구매");
		return "shop/shopCartBuy";
	}
	
	@RequestMapping("purchase")
	public ModelAndView insertBuyOrder(String prono,Product p ,int userNo,int amount,Orders orders,HttpSession session,ModelAndView mv) {
		
		int pno = Integer.parseInt(prono);
		p.setPNo(Integer.parseInt(prono));
		
		//System.out.println(pno + "상품 번호");
		//System.out.println(userNo + "회원번호");
		//System.out.println(amount+"구매수량");
		
		int pamount = sService.selectProductamount(pno);
		
		if(amount > pamount) {//재고가 더 적을 경우
			
			session.setAttribute("alertMsg", "재고량이 주문 수량 보다 적습니다.");
			mv.setViewName("redirect:detail.pro?pno="+p.getPNo());
			
		}else {//재고량이 더 많을 경우
			
			mv.addObject("amount", amount);
			Product list = sService.selectBuyProduct(pno);
			
			mv.addObject("list", list).setViewName("shop/shopCartBuy");
			System.out.println(list + "상세보기에서 구매");
		}
		return mv;
		
	}
	@RequestMapping("shop.search")
	public String selectshopkeyword(String keyword, Model model) {
		
		ArrayList<Product> plist = sService.selectshopkeyword(keyword);
		
		model.addAttribute("list", plist);
		
		return "shop/shopMain";
		
	}
	@ResponseBody
	@RequestMapping("shopli.search")
	public  Map<String, Object> selectShopUlsearch(Product p ,String brand, String category) {
//		if (brand != null && !brand.isEmpty()) {
//	        int brandNo = Integer.parseInt(brand);
//	        System.out.println("브랜드 확인 :" + brandNo);
//	    } else {
//	        System.out.println("브랜드가 선택되지 않았습니다.");
//	    }
//
//	    if (category != null && !category.isEmpty()) {
//	        int categoryNo = Integer.parseInt(category);
//	        System.out.println("카테고리 확인 :" + categoryNo);
//	    } else {
//	        System.out.println("카테고리가 선택되지 않았습니다.");
//	    }
		Map<String, Object> response = new HashMap<>();
		
		System.out.println(brand != null);
		System.out.println(!brand.isEmpty());
		
		if (brand != null && !brand.isEmpty()) {
	        int brandNo = Integer.parseInt(brand);

	        
	        if(category != null && !category.isEmpty()) {
	        	int categoryNo = Integer.parseInt(category);
	        	//브랜드 + 카테고리 선택
	        	p.setBrandNo(brandNo);
	        	p.setCategoryNo(categoryNo);
	        	
	        	ArrayList<Product> calist = sService.selectAllSearchProduct(p);
	        	response.put("list", calist);
	        }else {
	        	//브랜드만 선택
	        	ArrayList<Product> brlist = sService.selectbrandProduct(brandNo);
	        	response.put("list", brlist); 
	        }
	    }
		
		return response;
	      
	}	
	
	@RequestMapping("pro.allbuy")
	public String insertProductAllBuy(Orders ords, String[] pNo, String[] pType,String[] amount, Model model, HttpSession session, String userNo) {
		System.out.println(ords);
		
		int uno = Integer.parseInt(userNo);
		
		
			ArrayList<D_order> buylist = new ArrayList<D_order>();
			
			for(int i = 0; i<pNo.length;i++) {
				D_order c = new D_order();
				c.setPNo(Integer.parseInt(pNo[i]));
				c.setUserNo(userNo);
				c.setAmount(Integer.parseInt(amount[i]));
				c.setPType(Integer.parseInt(pType[i]));
				
				buylist.add(c);
			}
			System.out.println("buylist2 확인"+buylist );
			
			int result = sService.insertProductAllBuy(ords, buylist);
			
			if(result>0) {//주문관련 전부 db찍으면 결제 api창
				
				Orders ord = sService.selectOrderNo(uno);
				
				model.addAttribute("ord", ord);
				
				System.out.println( buylist+ "결제로 넘어가는 값");
				System.out.println(ord +"jsp로 넘길 값");
				return "payment/success";
			}else {
				model.addAttribute("errorMsg", "주문하기 실패");
				return "common/errorPage";
			}
			
		}
			
	@RequestMapping("pro.onebuy")
	public ModelAndView insertProductOneBuy(Orders ords, ModelAndView mv, String userNo) {
		int uno = Integer.parseInt(userNo);
		
		int result = sService.insertOneOrder(ords);
		
		if(result >0) {//주문 테이블(주문, 주문상세)등록 성공
			//api시작 -> 
			
			Orders o = sService.selectOrderNo(uno);
			
			mv.addObject("o", o).setViewName("payment/success");
			System.out.println(mv);
		}
		return mv;
	}	
}
