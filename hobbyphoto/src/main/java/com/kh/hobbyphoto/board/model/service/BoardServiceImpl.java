package com.kh.hobbyphoto.board.model.service;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.board.model.dao.BoardDao;
import com.kh.hobbyphoto.board.model.vo.*;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.member.model.vo.Block;
import com.kh.hobbyphoto.upfile.model.vo.Attachment;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao bDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectPhListCount() {
		int result = bDao.selectPhListCount(sqlSession);
		return result;
	}

	@Override
	public ArrayList<Board> selectPhList(PageInfo pi) {
		ArrayList<Board> list = bDao.selectPhList(sqlSession, pi);
		return list;
	}

	@Override
	public int insertPhBoard(Board b, ArrayList<Attachment> list) {
		int result = bDao.insertPhBoard(sqlSession, b);
		int result2 = 0;
		
		if(result > 0) {
			for(Attachment at : list) {
				result2 = bDao.insertAttachment(sqlSession, at);
			}
		}
		return result * result2;
	}

	
	@Override
	public int increaseCount(int boardNo) {
		return bDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board selectPhBoard(int boardNo) {
		return bDao.selectPhBoard(sqlSession, boardNo);
	}
	
	public ArrayList<Attachment> selectAtBoard(int boardNo){
		return bDao.selectAtBoard(sqlSession, boardNo);
	}

	@Override
	public int deletePhBoard(int boardNo) {
		return bDao.deletePhBoard(sqlSession, boardNo);
	}

	@Override
	public int updatePhBoard(Board b, ArrayList<Attachment> list) {
		int result = bDao.updatePhBoard(sqlSession, b);
		int result2 = 1;
		
		for(Attachment at : list) {
			result2 = bDao.updatePhAtBoard(sqlSession, at);
		}
		return result * result2;
	}
	
	@Override
	public int updatePhAtBoard(Attachment at) {
		return bDao.updatePhAtBoard(sqlSession, at);
	}
	
	@Override
	public int insertNewAttachment(Attachment at) {
		return bDao.insertNewAttachment(sqlSession, at);
	}
	
	@Override
	public ArrayList<Reply> selectPhReplyList(int boardNo) {
		return bDao.selectPhReplyList(sqlSession, boardNo);
	}
	
	@Override
	public int insertPhReply(Reply r) {
		return bDao.insertPhReply(sqlSession, r);
	}

	// ------------------------------------------------------------

	@Override
	public int selectRcListCount() {
		return bDao.selectRcListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectRcList(PageInfo pi) {
		return bDao.selectRcList(sqlSession, pi);
	}

	@Override
	public int increaseRcCount(int boardNo) {
		return bDao.increaseRcCount(sqlSession, boardNo);
	}

	@Override
	public Board selectRcBoard(int boardNo) {
		return bDao.selectRcBoard(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Attachment> selectRcAtBoard(int boardNo) {
		return bDao.selectRcAtBoard(sqlSession, boardNo);
	}
	
	@Override
	public int insertRcBoard(Board b, ArrayList<Attachment> list) {
		int result = bDao.insertRcBoard(sqlSession, b);
		int result2 = 0;
		
		if(result > 0) {
			for(Attachment at : list) {
				result2 = bDao.insertAttachment(sqlSession, at);
			}
		}
		return result * result2;
	}

	@Override
	public int deleteRcBoard(int boardNo) {
		return bDao.deleteRcBoard(sqlSession, boardNo);
	}
	
	public int updateRcBoard(Board b, ArrayList<Attachment> list) {
		int result = bDao.updateRcBoard(sqlSession, b);
		int result2 = 1;
		
		for(Attachment at : list) {
			result2 = bDao.updatePhAtBoard(sqlSession, at);
		}
			
		return result * result2;
	}
	
	@Override
	public int updateRcAtBoard(Attachment at) {
		return bDao.updateRcAtBoard(sqlSession, at);
	}
	
	@Override
	public ArrayList<Reply> selectRcReplyList(int boardNo) {
		return bDao.selectRcReplyList(sqlSession, boardNo);
	}

	@Override
	public int insertRcReply(Reply r) {
		return bDao.insertRcReply(sqlSession, r);
	}

	// ------------------------------------------------------------
	@Override
	public int myListCount(int userNo) {
		return bDao.myListCount(sqlSession,userNo);
	}

	@Override
	public ArrayList<Board> myBoardList(PageInfo pi, int userNo) {
		return bDao.myBoardList(sqlSession, pi, userNo);
	}

	@Override
	public ArrayList<Board> myBookmarksList(PageInfo pi, int userNo) {
		return bDao.myBookmarksList(sqlSession, pi, userNo);
	}
	
	@Override
	public ArrayList<Board> myLikeList(PageInfo pi, int userNo) {
		return bDao.myLikeList(sqlSession,pi,userNo);
	}
	
	@Override
	public ArrayList<Board> myGroupList(PageInfo pi, int userNo) {
		return bDao.myGroupList(sqlSession,pi,userNo);
	}
	

	@Override
	public ArrayList<Block> myBlockList(PageInfo pi, int userNo) {
		ArrayList<Block> list = bDao.myBlockList(sqlSession,pi,userNo);
		return list;
	}



	@Override
	public int selectPlaceListCount() {
		int result = bDao.selectPlaceListCount(sqlSession);
		return result;
	}
	
	@Override
	public ArrayList<Place> selectPlaceList(PageInfo pi) {
		return bDao.selectPlaceList(sqlSession, pi);
	}
	
	@Override
	public int increaseCountPlace(int pno) {
		return bDao.increaseCountPlace(sqlSession, pno);
	}
	
	
	@Override
	public Place selectPlace(int pno) {
		return bDao.selectPlace(sqlSession, pno);
	}
	
	@Override
	public int insertPlace(Place p, ArrayList<Attachment> list) {
		int result1 = bDao.insertPlace(sqlSession, p);
		
		int result2 = 1;
		
		if(!list.isEmpty()) {
			result2 = bDao.insertAttachmentPlace(sqlSession, list);
		}
		return  result1 * result2;
	}
	
	@Override
	public int updatePlace(Place p) {
		return bDao.updatePlace(sqlSession, p);
	}
	
	public int updatePlaceAttachment(Attachment attachment) {
		return bDao.updatePlaceAttachment(sqlSession, attachment);
	}
	
	@Override
	public ArrayList<Place> sortPlaceList(PageInfo pi, HashMap<String, String> map) {
		return bDao.sortPlaceList(sqlSession, map, pi);
	}
	
	@Override
	public int insertAttachmentPlace(ArrayList<Attachment> list) {
		
		return bDao.insertAttachmentPlace(sqlSession, list);
	}
	
	@Override
	public int deletePlace(int pno) {
		return bDao.deletePlace(sqlSession,pno);
	}
	
	
	@Override
	public int cultureListCount(String keyword) {
		return bDao.cultureListCount(sqlSession, keyword);
	}
	
	@Override
	public ArrayList<Festival> cultureList(PageInfo pi, String keyword) {
		return bDao.cultureList(sqlSession,pi,keyword);
	}
	
	@Override
	public Festival selectCulture(int feNo) {
		return bDao.selectCulture(sqlSession, feNo);
	}
	
	@Override
	public int insertCulture(Festival fe) {
		return bDao.insertCulture(sqlSession,fe);
	}
	
	@Override
	public int insertAttachmentPlace2(Attachment attachment) {
		return bDao.insertAttachment2(sqlSession, attachment);
	}
	
	@Override
	public int updateCulture(Festival fe) {
		return bDao.updateCulture(sqlSession, fe);
	}

	@Override
	public ArrayList<Board> selectTopBoardList() {
		return bDao.selectTopBoardList(sqlSession);
	}

	@Override
	public ArrayList<Place> selectTopPlaceList() {
		return bDao.selectTopPlaceList(sqlSession);
	}
	
	@Override
	public int checkBook(Board b) {		
		return bDao.checkBook(sqlSession,b);
	}
	
	@Override
	public int insertBookmark(Board b) {		
		return bDao.insertBookmark(sqlSession,b);
	}
	
	@Override
	public int deleteBookmark(Board b) {		
		return bDao.deleteBookmark(sqlSession,b);
	}
	
	@Override
	public int insertWallPaper(WallPaper wp) {
		
		return bDao.insertWallPaper(sqlSession,wp);
	}

	public int reportBoard(Report r) {
		
		return bDao.reportBoard(sqlSession,r);
	}
	
	@Override
	public int checkLike(Board b) {
		
		return bDao.checkLike(sqlSession,b);
	}
	
	@Override
	public int insertLike(Board b) {
		
		return bDao.insertLike(sqlSession,b);
	}
	
	@Override
	public int deleteLike(Board b) {
		
		return bDao.deleteLike(sqlSession,b);
	}

	public int selectWpListCount() {
		return bDao.selectWpListCount(sqlSession);
	}

	public ArrayList<WallPaper> selectWpList(PageInfo pi) {
		return bDao.selectWpList(sqlSession, pi);
	}

	public int increaseCountWp(int backNo) {
		return bDao.increaseCountWp(sqlSession, backNo);
	}

	public WallPaper selectWp(int backNo) {
		return bDao.selectWp(sqlSession, backNo);
	}

	public int wpDelete(int backNo) {
		return bDao.wpDelete(sqlSession,backNo);
	}

	public int increaseDownload(int backNo) {
		return bDao.increaseDownload(sqlSession,backNo);
	}


}
