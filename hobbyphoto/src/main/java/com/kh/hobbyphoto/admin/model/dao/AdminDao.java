package com.kh.hobbyphoto.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.shop.model.vo.Product;

@Repository
public class AdminDao {

	public int insertProduct(SqlSessionTemplate sqlSession,Product p) {
		return sqlSession.insert("adminMapper.insertProduct", p);
	}
	
}
