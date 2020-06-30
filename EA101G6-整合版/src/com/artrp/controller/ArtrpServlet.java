package com.artrp.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.artrp.model.*;


@MultipartConfig
public class ArtrpServlet  extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("insert".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String artno = req.getParameter("artno");
				
				String detail = req.getParameter("rp_detail");
				if (detail == null || detail.trim().length() == 0) {
					errorMsgs.add("檢舉內容不可空白!");
				}
				
				String mbrno = req.getParameter("mbrno");
				
				Integer status = new Integer(req.getParameter("status").trim());
				
				ArtrpVO artrpVO = new ArtrpVO();
				artrpVO.setArtno(artno);
				artrpVO.setDetail(detail);
				artrpVO.setMbrno(mbrno);
				artrpVO.setStatus(status);
				
				
				if(!errorMsgs.isEmpty()) {
					
				}
				
				/***************************2.開始新增資料***************************************/
				ArtrpService artrpSvc = new ArtrpService();
				artrpVO = artrpSvc.addArtrp(artno, detail, mbrno, status);
				
				/***************************3.新增完成,不跳轉(Send the Success view)***********/
//				RequestDispatcher successView = req.getRequestDispatcher("/font-end/art/listOneArt.jsp"); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch(Exception e) {
				errorMsgs.add(e.getMessage());
//				RequestDispatcher successView = req.getRequestDispatcher("/font-end/art/listOneArt.jsp"); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*******************1.接收請求參數，處理錯誤訊息************************/
				String artrpno = req.getParameter("artrpno");
				
				/***************************2.開始刪除資料***************************************/
				ArtrpService artrpSvc = new ArtrpService();
				artrpSvc.deleteArtrp(artrpno);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
				RequestDispatcher successView = req.getRequestDispatcher("listAllArtrp.jsp"); 
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("listAllArtrp.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("get_One_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String artno = req.getParameter("artno");
				
				
				
				/***************************2.開始查詢資料***************************************/
				ArtrpService artrpSvc = new ArtrpService();
				List<ArtrpVO> artrpVO = artrpSvc.getAllByArtno(artno);
				
				if (artrpVO == null) {
					errorMsgs.add("查無資料!");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllArtrp.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/**********************3.查詢完成，開始轉交****************************/
				req.setAttribute("artrpVO", artrpVO);
				RequestDispatcher successView = req.getRequestDispatcher("list_By_Artno.jsp");
				successView.forward(req, res);
				
				/**********************其他可能的錯誤處理**********************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料");
				RequestDispatcher failureView = req.getRequestDispatcher("listAllArtrp.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
