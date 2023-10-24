package com.kh.hobbyphoto.board.model.service;

import java.util.*;

import com.kh.hobbyphoto.board.model.vo.*;
import com.kh.hobbyphoto.common.model.vo.PageInfo;

public interface BoardService {
	
	ArrayList<Place> selectPlaceList(PageInfo pi);
	int insertPlace(Place p, ArrayList<Attachment> list);
	int insertAttachmentPlace(ArrayList<Attachment> list);
	int increaseCountPlace(int pno);
	Place selectPlace(int pno);
	int selectPlaceListCount();
	ArrayList<Place> sortPlaceList(PageInfo pi, HashMap<String, String> map);
	int updatePlace(Place p);
	int updatePlaceAttachment(Attachment attachment);
	int deletePlace(int pno);
	
	
	int cultureListCount(String keyword);
	ArrayList<Festival> cultureList(PageInfo pi, String keyword);
	Festival selectCulture(int feNo);
	int insertCulture(Festival fe);
	int insertAttachmentPlace2(Attachment attachment);
	int updateCulture(Festival fe);
	
}
