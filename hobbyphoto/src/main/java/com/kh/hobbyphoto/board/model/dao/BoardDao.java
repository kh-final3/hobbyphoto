package com.kh.hobbyphoto.board.model.dao;

import java.util.*;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.board.model.vo.*;
import com.kh.hobbyphoto.common.model.vo.Follow;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.member.model.vo.Block;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.upfile.model.vo.Attachment;

@Repository
public class BoardDao {
	// ----------------- 사진게시판 조회, 등록, 수정, 삭제, 댓글 -----------------
	public int selectPhListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectPhListCount");
	}

	public ArrayList<Board> selectPhList(SqlSessionTemplate sqlSession, PageInfo pi, Member m) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectPhList", m, rowBounds);
	
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
	
	public int insertNewAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("boardMapper.insertNewAttachment", at);
	}
	
	
	public ArrayList<Reply> selectPhReplyList(SqlSessionTemplate sqlSession, Board b) {
		return (ArrayList) sqlSession.selectList("boardMapper.selectPhReplyList", b);
	}

	public int insertPhReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertPhReply", r);
	}
	
	public ArrayList<Board> selectTopBoardList(SqlSessionTemplate sqlSession){
		return (ArrayList) sqlSession.selectList("boardMapper.selectTopBoardList");
	}
	
	public ArrayList<Place> selectTopPlaceList(SqlSessionTemplate sqlSession){
		return (ArrayList) sqlSession.selectList("boardMapper.selectTopPlaceList");
	}
	
	
	//-----------------------------------------------------------

	public int selectRcListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectRcListCount");
	}

	public ArrayList<Board> selectRcList(SqlSessionTemplate sqlSession, PageInfo pi, Member m) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectRcList", m, rowBounds);
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
	
	public int updateRcBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateRcBoard", b);
	}
	
	public int updateRcAtBoard(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("boardMapper.updateRcAtBoard", at);
	}
	
	public ArrayList<Reply> selectRcReplyList(SqlSessionTemplate sqlSession, Board b) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectRcReplyList", b);
	}

	public int insertRcReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertRcReply", r);
	}
	
	//-----------------------------------------------------------
	
	public int myListCount(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("boardMapper.myListCount",userNo);
	}
	
	public int profileListCount(SqlSessionTemplate sqlSession,String userId) {
		return sqlSession.selectOne("boardMapper.profileListCount",userId);
	}

	public ArrayList<Board> myBoardList(SqlSessionTemplate sqlSession,PageInfo pi,int userNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.myBoardList", userNo, rowBounds);
	}
	public ArrayList<Board> profileBoardList(SqlSessionTemplate sqlSession,PageInfo pi,String userId){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.profileBoardList", userId, rowBounds);
	}
	
	public ArrayList<Board> myBookmarksList(SqlSessionTemplate sqlSession,PageInfo pi,int userNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.myBookmarksList", userNo, rowBounds);
	}
	
	public ArrayList<Board> myLikeList(SqlSessionTemplate sqlSession,PageInfo pi,int userNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.myLikeList", userNo, rowBounds);
	}
	
	public ArrayList<Board> myGroupList(SqlSessionTemplate sqlSession,PageInfo pi,int userNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.myGroupList", userNo, rowBounds);
	}
	
	public ArrayList<Block> myBlockList(SqlSessionTemplate sqlSession,PageInfo pi,int userNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		ArrayList<Block> list = (ArrayList)sqlSession.selectList("boardMapper.myBlockList", userNo, rowBounds);
		return list;
	}
	
  
	public int selectPlaceListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectPlaceListCount");
	}
	
	public ArrayList<Place> selectPlaceList(SqlSessionTemplate sqlSession, PageInfo pi) {

  	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectPlaceList", null, rowBounds);
	}
	
	public int increaseCountPlace(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.update("boardMapper.increaseCountPlace", pno);
	}

	public Place selectPlace(SqlSessionTemplate sqlSession, int pno) {
		return (Place)sqlSession.selectOne("boardMapper.selectPlace", pno);
	}

	public int insertPlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.insert("boardMapper.insertPlace", p);
	}

	public int insertAttachmentPlace(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		return sqlSession.insert("boardMapper.insertAttachmentPlace", list);
	}

	public ArrayList sortPlaceList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.sortPlaceList", null, rowBounds);
	}
	
	public int updatePlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.update("boardMapper.updatePlace", p);
	}

	
	public int updatePlaceAttachment(SqlSessionTemplate sqlSession, Attachment attachment) {
		return sqlSession.update("boardMapper.updatePlaceAttachment", attachment);
	}
	
	public int deletePlace(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.delete("boardMapper.deletePlace", pno);
	}

	public int cultureListCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("boardMapper.cultureListCount", keyword);
	}

	public ArrayList<Festival> cultureList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
	
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.cultureList", keyword, rowBounds);
	}

	public Festival selectCulture(SqlSessionTemplate sqlSession, int feNo) {
		return (Festival)sqlSession.selectOne("boardMapper.selectCulture", feNo);
	}

	public int insertCulture(SqlSessionTemplate sqlSession, Festival fe) {
		return sqlSession.insert("boardMapper.insertCulture", fe);
	}

	public int insertAttachment2(SqlSessionTemplate sqlSession, Attachment attachment) {
		
		return sqlSession.insert("boardMapper.insertAttachment2", attachment);
	}

	public int updateCulture(SqlSessionTemplate sqlSession, Festival fe) {
		return sqlSession.update("boardMapper.updateCulture", fe);
	}



	public int checkBook(SqlSessionTemplate sqlSession, Board b) {
		System.out.println(b);
		return sqlSession.selectOne("boardMapper.checkBook",b);
	}
	
	public int insertBookmark(SqlSessionTemplate sqlSession, Board b) {
		System.out.println(b);
		return sqlSession.insert("boardMapper.insertBookmark",b);
	}
	
	public int deleteBookmark(SqlSessionTemplate sqlSession, Board b) {
		System.out.println(b);
		return sqlSession.delete("boardMapper.deleteBookmark",b);
	}

	public int insertWallPaper(SqlSessionTemplate sqlSession, WallPaper wp) {
		
		return sqlSession.insert("boardMapper.insertWallPaper", wp);
	}

	public int reportBoard(SqlSessionTemplate sqlSession, Report r) {
		
		return sqlSession.insert("boardMapper.reportBoard", r);
	}

	public int checkLike(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("boardMapper.checkLike",b);
	}
	
	public int insertLike(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertLike",b);
	}
	
	public int deleteLike(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.delete("boardMapper.deleteLike",b);
	}

	public int selectWpListCount(SqlSessionTemplate sqlSession) {
	return sqlSession.selectOne("boardMapper.selectWpListCount");

	}

	public ArrayList<WallPaper> selectWpList(SqlSessionTemplate sqlSession, PageInfo pi) {
	  	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectWpList", null, rowBounds);
	}

	public int increaseCountWp(SqlSessionTemplate sqlSession, int backNo) {
		return sqlSession.update("boardMapper.increaseCountWp", backNo);
	}

	public WallPaper selectWp(SqlSessionTemplate sqlSession, int backNo) {
		return (WallPaper)sqlSession.selectOne("boardMapper.selectWp", backNo);
	}

	public int wpDelete(SqlSessionTemplate sqlSession, int backNo) {
		return sqlSession.delete("boardMapper.wpDelete",backNo);
	}

	public int increaseDownload(SqlSessionTemplate sqlSession, int backNo) {
		return sqlSession.update("boardMapper.increaseDownload", backNo);
	}
	
	public int insertfollow(SqlSessionTemplate sqlSession,Follow f) {
		return sqlSession.insert("boardMapper.insertfollow", f);
	}

	public int unfollow(SqlSessionTemplate sqlSession, Follow f) {
		return sqlSession.delete("boardMapper.unfollow", f);
	}
	public ArrayList<Follow> selectFollowMember(SqlSessionTemplate sqlSession,Board b){
		return (ArrayList)sqlSession.selectList("boardMapper.selectFollowMember", b);
	}

	public int selectDownload(SqlSessionTemplate sqlSession, int backNo) {
		return sqlSession.selectOne("boardMapper.selectDownload", backNo);
	}

	public ArrayList<Board> selectProfileImg(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectProfileImg");
	}
}
