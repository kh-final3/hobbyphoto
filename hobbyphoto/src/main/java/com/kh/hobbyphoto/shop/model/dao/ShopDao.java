package com.kh.hobbyphoto.shop.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.shop.model.vo.Cart;
import com.kh.hobbyphoto.shop.model.vo.D_order;
import com.kh.hobbyphoto.shop.model.vo.Orders;
import com.kh.hobbyphoto.shop.model.vo.Photo;
import com.kh.hobbyphoto.shop.model.vo.PhotoDetail;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.shop.model.vo.Templates;

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
	public int deleteCartProduct(SqlSessionTemplate sqlSession,Cart c) {
		return sqlSession.delete("shopMapper.deleteCartProduct", c);
	}
	public ArrayList<Cart> selectCartBuy(SqlSessionTemplate sqlSession,Cart b){
		return (ArrayList)sqlSession.selectList("shopMapper.selectCartBuy", b);
	}
	
	public int selectProductamount(SqlSessionTemplate sqlSession,int pno) {
		return sqlSession.selectOne("shopMapper.selectProductamount", pno);
	}
	
	public Product selectBuyProduct(SqlSessionTemplate sqlSession,int pno) {
		return sqlSession.selectOne("shopMapper.selectBuyProduct", pno);
	}
	public ArrayList<Product> selectshopkeyword(SqlSessionTemplate sqlSession,String keyword) {
		return (ArrayList)sqlSession.selectList("shopMapper.selectshopkeyword", keyword);
	}
	
	public ArrayList<Product> selectbrandProduct(SqlSessionTemplate sqlSession,int brandNo){
		return (ArrayList)sqlSession.selectList("shopMapper.selectbrandProduct", brandNo);
	}
	public ArrayList<Product> selectAllSearchProduct(SqlSessionTemplate sqlSession,Product p){
		return (ArrayList)sqlSession.selectList("shopMapper.selectAllSearchProduct", p);
	}
	public int insertOneOrder(SqlSessionTemplate sqlSession,Orders ords) {
		return sqlSession.insert("shopMapper.insertOneOrder", ords);
	}
	public int insertOneDorder(SqlSessionTemplate sqlSession,Orders ords) {
		return sqlSession.insert("shopMapper.insertOneDorder", ords);
	}
	public int insertProductAllBuy(SqlSessionTemplate sqlSession,Orders ords) {
		return sqlSession.insert("shopMapper.insertOneOrder", ords);
	}
	public int insertDOrderCart(SqlSessionTemplate sqlSession, D_order oCart) {
		return sqlSession.insert("shopMapper.insertOneDorder", oCart);
	}
	
	public int updateProductAll(SqlSessionTemplate sqlSession,D_order oCart) {
		return sqlSession.update("shopMapper.updateProduct", oCart);
	}
	
	public Orders selectOrderNo(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("shopMapper.selectOrderNo", userNo);
	}
	
	public int deleteCartBuyPro(SqlSessionTemplate sqlSession,D_order d) {
		return sqlSession.delete("shopMapper.deleteCartBuyPro", d);
	}
	
	public ArrayList<Cart> selectAmount(SqlSessionTemplate sqlSession,Cart c){
		return (ArrayList)sqlSession.selectList("shopMapper.selectAmount", c);
	}
	public int deleteAmountZero(SqlSessionTemplate sqlSession,Cart de) {
		return sqlSession.delete("shopMapper.deleteCartProduct", de);
	}
	public Orders selectOrderInfo(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("shopMapper.selectOrderInfo", userNo);
	}
	public ArrayList<Orders> selectOrder(SqlSessionTemplate sqlSession,int userNo,PageInfo pi){
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectOrder", userNo,rowBounds);
	}
	public int selectOrderListCount(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("shopMapper.selectOrderListCount", userNo);
	}
	public int updateProduct(SqlSessionTemplate sqlSession,Orders ords) {
		return sqlSession.update("shopMapper.updateProduct", ords);
	}
	
	public int insertPhoto(SqlSessionTemplate sqlSession,PhotoDetail pd) {
		return sqlSession.insert("shopMapper.insertPhoto", pd);
	}
	public ArrayList<Templates> selectTemplate(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("shopMapper.selectTemplate");
	}
	public Templates selectTemplateDetail(SqlSessionTemplate sqlSession,int tno) {
		return sqlSession.selectOne("shopMapper.selectTemplateDetail", tno);
	}
	public int insertOnePhoto(SqlSessionTemplate sqlSession,Photo p) {
		return sqlSession.insert("shopMapper.insertOnePhoto", p);
	}
	public Templates selectTemInfo(SqlSessionTemplate sqlSession,int tNo) {
		return sqlSession.selectOne("shopMapper.selectTemplateDetail", tNo);
	}



}
