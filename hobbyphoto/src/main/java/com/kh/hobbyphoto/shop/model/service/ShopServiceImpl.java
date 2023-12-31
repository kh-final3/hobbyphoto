package com.kh.hobbyphoto.shop.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.shop.model.dao.ShopDao;
import com.kh.hobbyphoto.shop.model.vo.Cart;
import com.kh.hobbyphoto.shop.model.vo.D_order;
import com.kh.hobbyphoto.shop.model.vo.Orders;
import com.kh.hobbyphoto.shop.model.vo.Photo;
import com.kh.hobbyphoto.shop.model.vo.PhotoDetail;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.shop.model.vo.Templates;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	public ShopDao sDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Product> selectProductList() {
		return sDao.selectProductList(sqlSession);
	}

	@Override
	public Product selectProduct(int pno) {
		return sDao.selectProduct(sqlSession, pno);
	}

	@Override
	public ArrayList<Cart> selectCartList(int userNo) {
		return sDao.seletCartList(sqlSession, userNo);
	}
	
	@Override
	public int insertCartProduct(Cart cart) {
		return sDao.insertCartProduct(sqlSession, cart);
	}

	@Override
	public ArrayList<Cart> selectCartProList(int userNo) {
		return sDao.selectCartProList(sqlSession,userNo);
	}

	@Override
	public int updateCartAmount(Cart cart) {
		return sDao.updateCartAmount(sqlSession,cart);
	}

	@Override
	public int deleteCartProduct(ArrayList<Cart> clist) {
		
		int result = 0;
		
		for(Cart c : clist) {
			result += sDao.deleteCartProduct(sqlSession,c);
		}
		
		System.out.println(result + "service에서의 값");
		
		return result;
	}

	@Override
	public ArrayList<Cart> selectCartBuy(ArrayList<Cart> blist) {
		
		ArrayList<Cart> resultList = new ArrayList<>();
		
		for(Cart b : blist) {
	        ArrayList<Cart> resultCarts = sDao.selectCartBuy(sqlSession, b);
	        if(resultCarts != null && !resultCarts.isEmpty()) {
	            resultList.addAll(resultCarts);
	        }
	    }
		for(int i = 0 ; i<resultList.size();i++) {
		System.out.println("서비스에서 확인중 + " + resultList.get(i));
		}
		return resultList;
	}

	@Override
	public int selectProductamount(int pno) {
		return sDao.selectProductamount(sqlSession,pno);
	}

	@Override
	public Product selectBuyProduct(int pno) {
		return sDao.selectBuyProduct(sqlSession,pno);
	}

	@Override
	public ArrayList<Product> selectshopkeyword(String keyword) {
		return sDao.selectshopkeyword(sqlSession,keyword);
	}

	@Override
	public ArrayList<Product> selectbrandProduct(int brandNo) {
		return sDao.selectbrandProduct(sqlSession, brandNo);
	}

	@Override
	public ArrayList<Product> selectAllSearchProduct(Product p) {
		return sDao.selectAllSearchProduct(sqlSession,p);
	}

	@Override
	public int insertOneOrder(Orders ords) {
		
		int result1 = sDao.insertOneOrder(sqlSession,ords);
		int result2 = 0;
		
		if(result1>0) {
			result2 = sDao.insertOneDorder(sqlSession, ords);
		}
		
		int result = result1*result2;
		
		return result;
	}

	@Override
	public int insertProductAllBuy(Orders ords, ArrayList<D_order> buylist) {
		
		int result1 = sDao.insertProductAllBuy(sqlSession,ords);
		int result2 =0;
		int result3 =0;
		
		if(result1>0) {
			
			for(D_order oCart : buylist) {
				result2 += sDao.insertDOrderCart(sqlSession,oCart);
				result3 += sDao.updateProductAll(sqlSession,oCart);
			}

		}
	
		int result = result1*result2*result3;
		
		return result;
	}

	@Override
	public Orders selectOrderNo(int userNo) {
		return sDao.selectOrderNo(sqlSession,userNo);
	}

	@Override
	public ArrayList<Cart> selectAmount(ArrayList<Cart> buylist) {
		
		ArrayList<Cart> ilist = new ArrayList<>();
		
		for(Cart c : buylist) {
			ArrayList<Cart> result = sDao.selectAmount(sqlSession,c);
			
			ilist.addAll(result);
		}

		return ilist;
	}

	@Override
	public int deleteAmountZero(ArrayList<Cart> de) {
		
		int result = 0;
		for(Cart k : de) {
			result += sDao.deleteAmountZero(sqlSession,k);
		}
		System.out.println(result + "결과값 몇이야");
		
		return result;
	}

	@Override
	public Orders selectOrderInfo(int userNo) {
		return sDao.selectOrderInfo(sqlSession,userNo);
	}

	@Override
	public ArrayList<Orders> selectOrder(int userNo,PageInfo pi) {
		return sDao.selectOrder(sqlSession, userNo,pi);
	}

	@Override
	public int selectOrderListCount(int userNo) {
		return sDao.selectOrderListCount(sqlSession,userNo);
	}

	@Override
	public int updateProduct(Orders ords) {
		return sDao.updateProduct(sqlSession,ords);
	}

	@Override
	public int insertPhoto(PhotoDetail pd) {
		return sDao.insertPhoto(sqlSession,pd);
	}

	@Override
	public ArrayList<Templates> selectTemplate() {
		return sDao.selectTemplate(sqlSession);
	}

	@Override
	public Templates selectTemplateDetail(int tno) {
		return sDao.selectTemplateDetail(sqlSession,tno);
	}

	@Override
	public int insertOnePhoto(Photo p) {
		return sDao.insertOnePhoto(sqlSession,p);
	}

	@Override
	public Templates selectTemInfo(int tNo) {
		return sDao.selectTemInfo(sqlSession,tNo);
	}

	@Override
	public Photo PnoSelect(int userno) {
		return sDao.PnoSelect(sqlSession,userno);
	}
	
	@Override
	public int updatePhoto(int pNo) {
		return sDao.updatePhoto(sqlSession,pNo);
	}

	@Override
	public Photo finishTem(int pNo) {
		return sDao.finishTem(sqlSession,pNo);
	}

	@Override
	public PhotoDetail finishPhoto(int pNo) {
		return sDao.finishPhoto(sqlSession,pNo);
	}

	@Override
	public Templates finishTemplate(int tno) {
		return sDao.finishTemplate(sqlSession,tno);
	}

	@Override
	public int insertTemplateBuy(Orders o) {
		return sDao.insertTemplateBuy(sqlSession,o);
	}

	@Override
	public Orders selectOrderTemInfo(int uno) {
		return sDao.selectOrderTemInfo(sqlSession,uno);
	}

		
}
