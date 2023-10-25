package com.kh.hobbyphoto.board.model.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.upfile.model.vo.Attachment;

@Repository
public class BoardDao {
	// ----------------- 사진게시판 조회, 등록, 수정, 삭제, 댓글 -----------------
	public int selectPhListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectPhListCount");
	}

	public ArrayList<Board> selectPhList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectPhList", null, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount", boardNo);
	}
	
	public Board selectPhBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectPhBoard", boardNo);
	}
	
	public ArrayList<Attachment> selectAtBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList) sqlSession.selectList("boardMapper.selectAtBoard", boardNo);
	}
	
	public int insertPhBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertPhBoard", b);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("boardMapper.insertAttachment", at);
	}
	
	public int deletePhBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deletePhBoard", boardNo);
	}

	public int updatePhBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updatePhBoard", b);
	}

	public int updatePhAtBoard(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("boardMapper.updatePhAtBoard", at);
	}
	
	
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList) sqlSession.selectList("boardMapper.selectReplyList", boardNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	
	public ArrayList<Board> selectTopBoardList(SqlSessionTemplate sqlSession){
		return (ArrayList) sqlSession.selectList("boardMapper.selectTopBoardList");
	}
	
	
	//-----------------------------------------------------------

	public int selectRcListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectRcListCount");
	}

	public ArrayList<Board> selectRcList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectRcList", null, rowBounds);
	}
	
	public int increaseRcCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseRcCount", boardNo);
	}

	public Board selectRcBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectRcBoard", boardNo);
	}

	public ArrayList<Attachment> selectRcAtBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList) sqlSession.selectList("boardMapper.selectRcAtBoard", boardNo);
	}

	public int insertRcBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertRcBoard", b);
	}
	
	public int insertRcAtBoard(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("boardMapper.insertRcAtBoard", at);
	}

	public int deleteRcBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("boardMapper.deleteRcBoard", boardNo);
	}




	
}
