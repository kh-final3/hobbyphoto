package com.kh.hobbyphoto.common.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.hobbyphoto.member.model.vo.Member;

public class EchoHandler extends TextWebSocketHandler{
	private ArrayList<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		sessions.add(session);
		String senderId = currentUserName(session);
		userSessionsMap.put(senderId,session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg
		if (!msg.isEmpty()) {
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 6) {
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				int bno = Integer.parseInt(strs[3]);
				String title = strs[4];
				int type = Integer.parseInt(strs[5]);
				
				System.out.println(cmd);
				
				WebSocketSession boardWriterSession = userSessionsMap.get(boardWriter);
				System.out.println(boardWriterSession);
				
				//댓글
				if (cmd.equals("reply") && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 <a href='phDetail.bo?phno="+bno+" style='color: black'>"+ title+" 에 댓글을 달았습니다!</a>");
					boardWriterSession.sendMessage(tmpMsg);
				}
				
				//좋아요
				else if("like".equals(cmd) && boardWriterSession != null) {
					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
							+ "<a href='phDetail.bo?phno="+bno+" style='color: black'><strong>"
							+ title+"</strong> 에 작성한 글을 좋아요했습니다!</a>");

					boardWriterSession.sendMessage(tmpMsg);
					
				}
			}
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		// TODO Auto-generated method stub
		sessions.remove(session);
		userSessionsMap.remove(currentUserName(session),session);
	}

	
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member)httpSession.get("loginMember");
		if(loginUser == null) {
			String mid = session.getId();
			return mid;
		}
		String mid = loginUser.getUserId();
		return mid;
		
	}
}
