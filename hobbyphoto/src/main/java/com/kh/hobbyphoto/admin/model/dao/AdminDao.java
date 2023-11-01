package com.kh.hobbyphoto.admin.model.dao;
import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.board.model.vo.BackGround;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.model.vo.Report;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.shop.model.vo.Product;

@Repository
public class AdminDao {
	
	// 회원 관리 리스트 조회 (자동 페이징)
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectMember");
	}
	
	// 회원 삭제 처리
	public int deleMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("adminMapper.deleMember", userId);
	}
	
	// 게시글 관리 조회-사진게시판
	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoard", null, rowBounds);
	}
	
	// 게시글 페이징 count
	public int selectBoardCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectBoardCount");
	}
	
	// 게시글 삭제 처리-사진게시판
	public int deleBoard(SqlSessionTemplate sqlSession, String boardTitle) {
		return sqlSession.update("adminMapper.deleBoard", boardTitle);
	}
	
	// 게시글 관리 조회-장비게시판
	public ArrayList<Board> selectBoard2(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoard2");
	}
	
	// 게시글 삭제 처리-사진게시판
	public int edeleBoard(SqlSessionTemplate sqlSession, String boardTitle) {
		return sqlSession.update("adminMapper.edeleBoard", boardTitle);
	}
	
	// 게시글 관리 조회-모임게시판
	public ArrayList<Sgroup> selectBoard3(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoard3");
	}
	
	// 게시글 삭제 처리-모임게시판
	public int gdeleBoard(SqlSessionTemplate sqlSession, String title) {
		return sqlSession.update("adminMapper.gdeleBoard", title);
	}
	
	// 게시글 관리 조회-배경게시판
	public ArrayList<BackGround> selectBoard4(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoard4");
	}
	
	// 게시글 삭제 처리-배경게시판
	public int bkdeleBoard(SqlSessionTemplate sqlSession, int backNo) {
		return sqlSession.update("adminMapper.bkdeleBoard", backNo);
	}
	
	// 신고 게시글 관리 조회
	public ArrayList<Report> selectReport(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectReport");
	}
	
	// 신고 게시글 완료처리
	public int processed(SqlSessionTemplate sqlSession, String rpNo) {
		return sqlSession.update("adminMapper.processed", rpNo);
	}
	
	// 관리자 페이지 메인에 신고 회원 리스트
	public ArrayList<Report> selectReportMList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectReportMList");
	}
	
	//상품 등록
	public int insertProduct(SqlSessionTemplate sqlSession,Product p) {
		return sqlSession.insert("adminMapper.insertProduct", p);

	}
	
	//상품 개수
	public int selectAdminProListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectAdminProListCount");
	}
	//페이징 되어있는 상품 리스트
	public ArrayList<Product> selecAdminProtList(SqlSessionTemplate sqlSession,PageInfo pi){
		int poffset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int plimit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(poffset,plimit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selecAdminProtList", null, rowBounds);
	}

	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
