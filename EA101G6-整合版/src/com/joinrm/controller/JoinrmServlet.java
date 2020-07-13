package com.joinrm.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import com.joinrm.model.*;
import com.rminfo.model.*;


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
			
			List<String> joinMsg = new LinkedList<String>();

			req.setAttribute("joinMsg", joinMsg);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				

				
				String mbrno= req.getParameter("mbrno");
				String rmno= req.getParameter("rmno");
				
				JoinrmService joinrmSvc = new JoinrmService();
				List<JoinrmVO> findByPK = joinrmSvc.findByPK(rmno,"");
				HttpSession session =req.getSession();
				String account = (String) session.getAttribute("account");
				
				if(account == null) {
					joinMsg.add("請先登入");
				}else {
					for(JoinrmVO memberNo:findByPK) {
						if(memberNo.getMbrno().equals(mbrno)) {
							joinMsg.add("您已經在此房間內");
						}							
					}
				}
				System.out.println(mbrno + "," + rmno);
				// Send the use back to the form, if there were errors
				if (!joinMsg.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/room/create.jsp");
					failureView.forward(req, res);
					return;
				}
				
				JoinrmVO joinrmVO = new JoinrmVO();
				joinrmVO.setRmno(rmno);
				joinrmVO.setMbrno(mbrno);
				/***************************2.開始新增資料***************************************/
				joinrmVO = joinrmSvc.insertMbr(rmno,mbrno);
				List<JoinrmVO> memberNumber = joinrmSvc.findByPK(rmno,"");
				RminfoService rminfoSvc = new RminfoService();
				RminfoVO rminfoVO = rminfoSvc.getOneRm(rmno);
				
				if(memberNumber.size() == rminfoVO.getUplimit()) {
					rminfoSvc.update(2, 0, rmno);
					System.out.println("change status to 2");
				}else if(memberNumber.size() == rminfoVO.getLowlimit()) {
					rminfoSvc.update(1, 0, rmno);
					System.out.println("change status to 1");
				}
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front-end/room/create.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println(e);
//				sqlException.add("您已經在此房間內");
//				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/room/create.jsp");
//				failureView.forward(req, res);
			}
		}

if ("delete".equals(action)) { 

	List<String> errorMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	req.setAttribute("errorMsgs", errorMsgs);

	try {
		/***************************1..接收請求參數 - 輸入格式的錯誤處理***************************************/
		String mbrno= req.getParameter("mbrno");
		String rmno= req.getParameter("rmno");
		/***************************2.開始新增資料***************************************/
		JoinrmService joinrmSvc = new JoinrmService();
		joinrmSvc.deleteMbr(rmno, mbrno);
		
		/***************************3.新增完成,準備轉交(Send the Success view)***********/								
//		String url = "/emp/listAllEmp.jsp";
//		RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
//		successView.forward(req, res);
		
		/***************************其他可能的錯誤處理**********************************/
	} catch (Exception e) {
		System.out.println(e);
//		errorMsgs.add("�R����ƥ���:"+e.getMessage());
//		RequestDispatcher failureView = req
//				.getRequestDispatcher("/emp/listAllEmp.jsp");
//		failureView.forward(req, res);
	}
}

if ("listInfo".equals(action)) { 

	List<String> errorMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	req.setAttribute("errorMsgs", errorMsgs);

	try {
		/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
		String rmno= req.getParameter("rmno");
		String mbrno= req.getParameter("mbrno");
		
		/***************************2.開始新增資料*****************************************/
		JoinrmService joinrmSvc = new JoinrmService();
		List<JoinrmVO> joinrmVO = joinrmSvc.findByPK(rmno, mbrno);
		if (joinrmVO == null) {
			errorMsgs.add("�d�L���");
		}
		// Send the use back to the form, if there were errors
//		if (!errorMsgs.isEmpty()) {
//			RequestDispatcher failureView = req
//					.getRequestDispatcher("/emp/select_page.jsp");
//			failureView.forward(req, res);
//			return;//�{�����_
//		}
		
		/***************************3.新增完成,準備轉交(Send the Success view)*************/
//		req.setAttribute("joinrmVO", joinrmVO); // ��Ʈw���X��empVO����,�s�Jreq
//		String url = "/front-end/room/list_findByPK.jsp";
//		RequestDispatcher successView = req.getRequestDispatcher(url); 
//		successView.forward(req, res);

		/***************************其他可能的錯誤處理*************************************/
	} catch (Exception e) {
		System.out.println(e);
//		errorMsgs.add("�L�k���o���:" + e.getMessage());
//		RequestDispatcher failureView = req
//				.getRequestDispatcher("/emp/select_page.jsp");
//		failureView.forward(req, res);
	}
}

		
	}
}