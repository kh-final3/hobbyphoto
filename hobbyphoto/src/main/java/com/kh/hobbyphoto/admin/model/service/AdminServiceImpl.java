package com.kh.hobbyphoto.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hobbyphoto.admin.model.dao.AdminDao;
import com.kh.hobbyphoto.board.model.vo.BackGround;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.upfile.model.vo.P_Attachment;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao aDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 회원 리스트 조회
	@Override
	public ArrayList<Member> selectMember() {
		return aDao.selectMember(sqlSession);
	}
	
	// 회원 삭제 서비스
	@Override
	public int deleMember(String userId) {
		return aDao.deleMember(sqlSession, userId);		
	}
  
	// 상품 등록 서비스
	@Override
	public int insertProduct(Product p) {
		return aDao.insertProduct(sqlSession, p);
	}
	
	// 게시물 관리서비스-사진게시판
	@Override
	public ArrayList<Board> selectBoard() {
		return aDao.selectBoard(sqlSession);
}
	// 게시물 삭제서비스-사진게시판
	@Override
	public int deleBoard(String boardTitle) {
		return aDao.deleBoard(sqlSession, boardTitle);		
	}
	
	// 게시물 관리서비스-장비게시판
	@Override
	public ArrayList<Board> selectBoard2() {
		return aDao.selectBoard2(sqlSession);
	}
	
	// 게시물 관리서비스-모임게시판
	@Override
	public ArrayList<Sgroup> selectBoard3() {
		return aDao.selectBoard3(sqlSession);
	}
	
	// 게시물 관리서비스-배경화면게시판
	@Override
	public ArrayList<BackGround> selectBoard4() {
		return aDao.selectBoard4(sqlSession);
	}

}
