package com.rminfo.controller;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.rminfo.model.RminfoService;
import com.rminfo.model.*;

public class RminfoServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException{
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				
				String shopno = req.getParameter("shopno");
				if (shopno == null || shopno.trim().length() == 0) {
					errorMsgs.add("���a: �п�ܩ��a");
				}
				
				String naming = req.getParameter("naming");
				String namingReg = "^(.|\\r|\\n){1,10}$";
				if (naming == null || naming.trim().length() == 0) {
					errorMsgs.add("�п�J�ЦW");
				} else if(!naming.trim().matches(namingReg)) { 
					errorMsgs.add("�ЦW�u��b10�Ӧr���H��");
	            }
				
				String mbrno= req.getParameter("mbrno");
				
				String game= req.getParameter("game");
				String gameReg = "^(.|\\r|\\n){1,50}$";
				if (game == null || game.trim().length() == 0) {
					errorMsgs.add("�п�J�C���C��");
				} else if(!game.trim().matches(gameReg)) {
					errorMsgs.add("�C���C��: �б���b50�Ӧr������");
	            }
				
				String remarks= req.getParameter("remarks");
				String remarksReg = "^(.|\\r|\\n){0,100}$";
				if(!game.trim().matches(remarksReg)) {
					errorMsgs.add("�Ƶ�: �r�ƹL�h");
	            }
								
				java.sql.Timestamp starttime = null;
				try {
					starttime = java.sql.Timestamp.valueOf(req.getParameter("starttime").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.add("�п�ܶ}�l�ɶ�!");
				}
				
				java.sql.Timestamp endtime = null;
				try {
					endtime = java.sql.Timestamp.valueOf(req.getParameter("endtime").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.add("�п�ܵ����ɶ�!");
				}
				
				if((endtime.getTime()-starttime.getTime()) <= 0) {
					errorMsgs.add("�C���ɶ�:�����ɶ����i����ε���}�l�ɶ�!");
				}
				
				java.sql.Timestamp cutoff= null;
				try {
					cutoff = new Timestamp(endtime.getTime()-(1000*60*60*24*4));
				} catch (IllegalArgumentException e) {
					errorMsgs.add("�I��ɶ����~");
				}
			
				Integer uplimit = new Integer(req.getParameter("uplimit").trim());
				try {
					uplimit = new Integer(req.getParameter("uplimit").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("�п�ܤH�ƤW��.");
				}
				
				Integer lowlimit = new Integer(req.getParameter("lowlimit").trim());
				try {
					lowlimit = new Integer(req.getParameter("lowlimit").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("�п�ܤH�ƤU��.");
				}
				Integer restriction = new Integer(req.getParameter("restriction").trim());
				Integer confirmed = new Integer(req.getParameter("confirmed").trim());
				
				RminfoVO rminfoVO = new RminfoVO();
				rminfoVO.setShopno(shopno);
				rminfoVO.setCutoff(cutoff);
				rminfoVO.setNaming(naming);
				rminfoVO.setUplimit(uplimit);
				rminfoVO.setLowlimit(lowlimit);
				rminfoVO.setStarttime(starttime);
				rminfoVO.setEndtime(endtime);
				rminfoVO.setMbrno(mbrno);
				rminfoVO.setGame(game);
				rminfoVO.setRemarks(remarks);
				rminfoVO.setRestriction(restriction);
				rminfoVO.setConfirmed(confirmed);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("rminfoVO", rminfoVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/create.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				RminfoService rminfoSvc = new RminfoService();
				rminfoVO = rminfoSvc.createRm(shopno, cutoff, naming, uplimit, lowlimit, starttime, endtime, mbrno, game, remarks, restriction, confirmed);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/front-end/create.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
//				System.out.println(e);
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/create.jsp");
//				failureView.forward(req, res);
			}
		}
		
		
	}
}