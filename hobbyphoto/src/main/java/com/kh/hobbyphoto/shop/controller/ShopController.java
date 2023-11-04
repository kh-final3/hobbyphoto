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
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.shop.model.service.ShopServiceImpl;
import com.kh.hobbyphoto.shop.model.vo.Cart;
import com.kh.hobbyphoto.shop.model.vo.D_order;
import com.kh.hobbyphoto.shop.model.vo.Orders;
import com.kh.hobbyphoto.shop.model.vo.Photo;
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
			
			if(result>0) {
			
				ArrayList<Cart> clist = new ArrayList<Cart>();
				
				for(int i=0; i<pNo.length;i++) {
					Cart k = new Cart();
					k.setPNo(Integer.parseInt(pNo[i]));
					k.setUserNo(uno);
					
					clist.add(k);
				}
				System.out.println("장바구니에서 구매한 물건 : " + clist);
				
				int result2 = sService.deleteCartProduct(clist);
				System.out.println(result2 + "장바구니 삭제 결과값");
				
				
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
	public ModelAndView insertProductOneBuy(Orders ords, ModelAndView mv, String userNo,String pNo, Model model) {
		int uno = Integer.parseInt(userNo);
		System.out.println(uno);
		System.out.println(ords);
		//주문 테이블 입력
		int result = sService.insertOneOrder(ords);
		
		if(result >0) {//주문 테이블(주문, 주문상세)등록 성공
			//상품 수량 변경
			int result2 = sService.updateProduct(ords);
			
			if(result2 > 0) {
				//주문 리스트 조회
				Orders o = sService.selectOrderNo(uno);				
				mv.addObject("o", o).setViewName("payment/success");
				System.out.println(mv);
			}
			
		}else {
			mv.addObject("errorMsg", "단품주문실패").setViewName("payment/fail");;
		}
		return mv;
	}	
	//마이페이지 들어가기
	@RequestMapping("shop.gomy")
	public String selectShopMyInfo(HttpSession session, int userNo,Model model) {
		
		System.out.println(userNo + "과연 넘어오니??");
		
		//주문관련
		Orders o = sService.selectOrderInfo(userNo);
		System.out.println(o + "과연 뭐가 나올것인가????");
		model.addAttribute("o", o);
		return "shop/shopMyPage";
	}
	
	@ResponseBody
	@RequestMapping("amount.zero")
	public String deleteAmountZero(Cart c, String userNo,String[] pNo) {
		System.out.println(c + "Cart 값");
		System.out.println(userNo + "회원번호 세션이용할까?");
		int userno = Integer.parseInt(userNo);
		
		ArrayList<Cart> buylist = new ArrayList<Cart>();
		for(int i = 0; i<pNo.length; i++) {
			Cart p = new Cart();
			
			p.setPNo(Integer.parseInt(pNo[i]));
			p.setUserNo(userno);
			
			buylist.add(p);
		}
		
		System.out.println(buylist + "상품 번호 있니?");
		
		ArrayList<Cart> k = sService.selectAmount(buylist);
		
		ArrayList<Cart> de = new ArrayList<Cart>();
		for(int i = 0; i<k.size();i++) {
			//System.out.println(k.get(i) +"뭐가 들어있니?");
			//System.out.println(k.get(i).getProductamount() +"상품 제고?뭐가 들어있니?");
			Cart y = new Cart();
			
			//상품 제고가 0인거 삭제
			if(k.get(i).getProductamount() == 0 ) {
				k.get(i).setUserNo(userno);
				de.add(k.get(i));
			}
		}
		System.out.println(de + "여기에는 재고가 0인게 있을까?");
		int restul = sService.deleteAmountZero(de);
		
		System.out.println(restul + "controller에서 result 값");
		return restul>0 ? "success":"fail";
	}
		
	@RequestMapping("shop.order")
	public ModelAndView shopOrderList(@RequestParam(value="cpage",defaultValue = "1") int currentPage,HttpSession session, ModelAndView mv) {
		
		Member m = (Member)session.getAttribute("loginMember");
		int userNo = m.getUserNo();
		System.out.println(m.getUserNo() + "나와라!!!!!!");
		
		//페이징
		int listCount = sService.selectOrderListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		//회원의 주문리트
		ArrayList<Orders> olist = sService.selectOrder(userNo,pi);
		
		System.out.println(olist + "주문조회시 조회내용?");
		
		mv.addObject("pi", pi).addObject("olist", olist).setViewName("shop/shopOrderlist");;
		return mv;
	}
	@RequestMapping("shop.photo")
		public String shopPhoto() {
			return "shop/shopPhoto";
		}

	@ResponseBody
	@RequestMapping("save.photo")
		public String savePhoto(Photo p, HttpSession session) {
		System.out.println(p);
		Member m =(Member)session.getAttribute("loginMember");
		int result = sService.insertPhoto(p);
		System.out.println(result +"과연 결과는???");
		return result>0 ? "success":"fail";
	}
			
}

