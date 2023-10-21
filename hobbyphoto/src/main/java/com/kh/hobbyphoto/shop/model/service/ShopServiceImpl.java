package com.kh.hobbyphoto.shop.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.shop.model.dao.ShopDao;
import com.kh.hobbyphoto.shop.model.vo.Cart;
import com.kh.hobbyphoto.shop.model.vo.Product;

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

	


	

}
