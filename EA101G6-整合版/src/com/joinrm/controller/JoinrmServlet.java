package com.joinrm.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import com.joinrm.model.*;


public class JoinrmServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException{
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
if ("insert".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				

				
				String mbrno= req.getParameter("mbrno");
				String rmno= req.getParameter("rmno");
				

				JoinrmVO joinrmVO = new JoinrmVO();
				joinrmVO.setRmno(rmno);
				joinrmVO.setMbrno(mbrno);
				
				
				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/emp/addEmp.jsp");
//					failureView.forward(req, res);
//					return;
//				}
				
				/***************************2.開始新增資料***************************************/
				JoinrmService joinrmSvc = new JoinrmService();
				joinrmVO = joinrmSvc.insertMbr(rmno,mbrno);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
//				String url = "/front-end/create.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println(e);
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/create.jsp");
//				failureView.forward(req, res);
			}
		}

if ("delete".equals(action)) { // 來自listAllEmp.jsp

	List<String> errorMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	req.setAttribute("errorMsgs", errorMsgs);

	try {
		/***************************1.接收請求參數***************************************/
		String mbrno= req.getParameter("mbrno");
		String rmno= req.getParameter("rmno");
		/***************************2.開始刪除資料***************************************/
		JoinrmService joinrmSvc = new JoinrmService();
		joinrmSvc.deleteMbr(rmno, mbrno);
		
		/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
//		String url = "/emp/listAllEmp.jsp";
//		RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//		successView.forward(req, res);
		
		/***************************其他可能的錯誤處理**********************************/
	} catch (Exception e) {
		System.out.println(e);
//		errorMsgs.add("刪除資料失敗:"+e.getMessage());
//		RequestDispatcher failureView = req
//				.getRequestDispatcher("/emp/listAllEmp.jsp");
//		failureView.forward(req, res);
	}
}

if ("listInfo".equals(action)) { // 來自select_page.jsp的請求

	List<String> errorMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	req.setAttribute("errorMsgs", errorMsgs);

	try {
		/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
		String rmno= req.getParameter("rmno");
		String mbrno= req.getParameter("mbrno");
		
		/***************************2.開始查詢資料*****************************************/
		JoinrmService joinrmSvc = new JoinrmService();
		List<JoinrmVO> joinrmVO = joinrmSvc.findByPK(rmno, mbrno);
		if (joinrmVO == null) {
			errorMsgs.add("查無資料");
		}
		// Send the use back to the form, if there were errors
//		if (!errorMsgs.isEmpty()) {
//			RequestDispatcher failureView = req
//					.getRequestDispatcher("/emp/select_page.jsp");
//			failureView.forward(req, res);
//			return;//程式中斷
//		}
		
		/***************************3.查詢完成,準備轉交(Send the Success view)*************/
		req.setAttribute("joinrmVO", joinrmVO); // 資料庫取出的empVO物件,存入req
		String url = "/front-end/list_findByPK.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); 
//		successView.forward(req, res);

		/***************************其他可能的錯誤處理*************************************/
	} catch (Exception e) {
		System.out.println(e);
//		errorMsgs.add("無法取得資料:" + e.getMessage());
//		RequestDispatcher failureView = req
//				.getRequestDispatcher("/emp/select_page.jsp");
//		failureView.forward(req, res);
	}
}

if ("listInfo2".equals(action)) { // 來自select_page.jsp的請求

	List<String> errorMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	req.setAttribute("errorMsgs", errorMsgs);

	try {
		/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
		String rmno= req.getParameter("rmno");
		String mbrno= req.getParameter("mbrno");
		
		/***************************2.開始查詢資料*****************************************/
		JoinrmService joinrmSvc = new JoinrmService();
		List<JoinrmVO> joinrmVO = joinrmSvc.findByPK(rmno, mbrno);
		if (joinrmVO == null) {
			errorMsgs.add("查無資料");
		}
		// Send the use back to the form, if there were errors
//		if (!errorMsgs.isEmpty()) {
//			RequestDispatcher failureView = req
//					.getRequestDispatcher("/emp/select_page.jsp");
//			failureView.forward(req, res);
//			return;//程式中斷
//		}
		
		/***************************3.查詢完成,準備轉交(Send the Success view)*************/
		PrintWriter out = res.getWriter();
		  out.append(String.valueOf(joinrmVO.size()));
		  out.close();


		/***************************其他可能的錯誤處理*************************************/
	} catch (Exception e) {
		System.out.println(e);
//		errorMsgs.add("無法取得資料:" + e.getMessage());
//		RequestDispatcher failureView = req
//				.getRequestDispatcher("/emp/select_page.jsp");
//		failureView.forward(req, res);
	}
}
		
	}
}