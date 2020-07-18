package com.art.controller;

import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.mbrpf.model.MbrpfService;
import com.mbrpf.model.MbrpfVO;
import com.art.model.ArtService;
import com.art.model.ArtVO;
import com.artrp.model.ArtrpService;
import com.artrp.model.ArtrpVO;

import connectionpool.WsMessage;

import javax.websocket.EndpointConfig;
import javax.websocket.OnOpen;
import javax.websocket.OnMessage;
import javax.websocket.OnClose;
import javax.websocket.OnError;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.CloseReason;

//updateArt
@ServerEndpoint(value = "/listAllArt/{mbrno}")
public class MyWebSocket {
	private static final Map<String, Session> connectedSessions = Collections.synchronizedMap(new HashMap<String, Session>());
	
	@OnOpen
	public void open(@PathParam("mbrno") String mbrno, Session session) {
		System.out.println("mbrno:" + mbrno + "sessionID:" + session.getId());
		connectedSessions.put(mbrno, session);
	}
	
	@OnMessage
	public void message(Session session, String data) {
		StringBuilder sendthis = new StringBuilder();
		ArtService artSvc = new ArtService();
		ArtrpService artrpSvc = new ArtrpService();
		MbrpfService mbrpfSvc = new MbrpfService();
		String mbrno = null;
		MbrpfVO mbrpfVO = null;
		
		//只有文章後台會送出文章編號的資料 這裡的data是指artno
		String artRegexp = "^MA\\d{5}";
		if (data.matches(artRegexp)) {
			System.out.println("enter data send");
			ArtVO artVO = artSvc.getOneArt(data);
			mbrno = artVO.getMbrno();
			mbrpfVO = mbrpfSvc.getOneMbrpf(mbrno);
			
			if (artVO.getStatus() == 1) {
				sendthis.append(mbrpfVO.getNickname() + "，您的文章「" + artVO.getArttt() + "」，已經下架了!");
				List<ArtrpVO> list = artrpSvc.getAllByArtno(data);
				for(ArtrpVO artrpVO : list) {
					if(artrpVO.getStatus() == 1) {
						sendthis.append("\n下架原因:" + artrpVO.getDetail());
					}
				}
				sendMsg(mbrno, sendthis);
			}
			if (artVO.getStatus() == 2) {
				sendthis.append(mbrpfVO.getNickname() + "，您的文章「" + artVO.getArttt() + "」，已經重新上架了!");
				sendMsg(mbrno, sendthis);
			}
			
		}
	}
	
	public void sendMsg(String mbrno, StringBuilder sendthis) {
		String strSendThis = sendthis.toString();
		for(String hashmapkey : connectedSessions.keySet()) {
			if(mbrno.equals(hashmapkey)) {
				if(connectedSessions.get(hashmapkey).isOpen()) {
					connectedSessions.get(hashmapkey).getAsyncRemote().sendText(strSendThis);
				}
			}
		}
	}
	
	@OnError
	public void error(Session session, Throwable error) {
		error.printStackTrace();
		System.out.println("error" + error.getMessage());
	}
	
	@OnClose
	public void close(Session session, CloseReason reason) {
		for (Entry<String, Session> keyValue : connectedSessions.entrySet()) {
			if (session.equals(keyValue.getValue())) {
				System.out.println("close:" + keyValue.getKey() + "leaved, reason:" + reason.getReasonPhrase());
			}
		}
	}

}
