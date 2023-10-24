package com.kh.hobbyphoto.admin.model.dao;
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.board.model.vo.BackGround;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.model.vo.Report;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.shop.model.vo.Product;

@Repository
public class AdminDao {
	
	// 회원 관리 리스트 조회
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectMember");
	}
	
	// 회원 삭제 처리
	public int deleMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("adminMapper.deleMember", userId);
	}
	
	// 게시글 관리 조회-사진게시판
	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoard");
	}
	
	// 게시글 삭제 처리-사진게시판
	public int deleBoard(SqlSessionTemplate sqlSession, String boardTitle) {
		return sqlSession.update("adminMapper.deleBoard", boardTitle);
	}
	
	// 게시글 관리 조회-장비게시판
	public ArrayList<Board> selectBoard2(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoard2");
	}
	
	// 게시글 관리 조회-모임게시판
	public ArrayList<Sgroup> selectBoard3(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoard3");
	}
	
	// 게시글 관리 조회-배경게시판
	public ArrayList<BackGround> selectBoard4(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoard4");
	}
	
	// 신고 게시글 관리 조회
	public ArrayList<Report> selectReport(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectReport");
	}
	
}
