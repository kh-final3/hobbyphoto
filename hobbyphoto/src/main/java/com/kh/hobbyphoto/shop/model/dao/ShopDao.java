package com.kh.hobbyphoto.shop.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.shop.model.vo.Cart;
import com.kh.hobbyphoto.shop.model.vo.Product;

@Repository
public class ShopDao {
	
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("shopMapper.selectProductList");
	}
	
	public Product selectProduct(SqlSessionTemplate sqlSession,int pno) {
		return sqlSession.selectOne("shopMapper.selectProduct", pno);
	}
	
	public ArrayList<Cart> seletCartList(SqlSessionTemplate sqlSession,int userNo){
		return (ArrayList)sqlSession.selectList("shopMapper.seletCartList", userNo);
	}
	
	public int insertCartProduct(SqlSessionTemplate sqlSession,Cart cart) {
		return sqlSession.insert("shopMapper.insertCartProduct", cart);
	}
	public ArrayList<Cart> selectCartProList(SqlSessionTemplate sqlSession,int userNo){
		return (ArrayList)sqlSession.selectList("shopMapper.selectCartProList",userNo);
	}
	public int updateCartAmount(SqlSessionTemplate sqlSession,Cart cart) {
		return sqlSession.update("shopMapper.updateCartAmount", cart);
	}
	
	
}
