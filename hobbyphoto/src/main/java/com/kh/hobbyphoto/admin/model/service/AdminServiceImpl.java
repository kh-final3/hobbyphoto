package com.kh.hobbyphoto.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.admin.model.dao.AdminDao;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.upfile.model.vo.P_Attachment;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return aDao.selectList(sqlSession, pi);
	}

	@Override
	public int increaseCount(int boardNo) {
		return aDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return aDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return aDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int updateBoard(Board b) {
		return aDao.updateBoard(sqlSession, b);
	}

	// 회원 리스트 조회
	@Override
	public ArrayList<Member> selectMember() {
		return aDao.selectMember(sqlSession);
	}
	
	// 회원 삭제 서비스
	@Override
	public int deleteMember(String userId) {
		return aDao.deleteMember(sqlSession, userId);		
	}
  
	//상품 등록(지영)
	@Override
	public int insertProduct(Product p) {
		return aDao.insertProduct(sqlSession, p);
	}

	

	

}
