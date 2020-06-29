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
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				

				
				String mbrno= req.getParameter("mbrno");
				String rmno= req.getParameter("rmno");
				

				JoinrmVO joinrmVO = new JoinrmVO();
				joinrmVO.setRmno(rmno);
				joinrmVO.setMbrno(mbrno);
				
				
				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("empVO", empVO); // �t����J�榡���~��empVO����,�]�s�Jreq
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/emp/addEmp.jsp");
//					failureView.forward(req, res);
//					return;
//				}
				
				/***************************2.�}�l�s�W���***************************************/
				JoinrmService joinrmSvc = new JoinrmService();
				joinrmVO = joinrmSvc.insertMbr(rmno,mbrno);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
//				String url = "/front-end/create.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
//				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				System.out.println(e);
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/create.jsp");
//				failureView.forward(req, res);
			}
		}

if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

	List<String> errorMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	req.setAttribute("errorMsgs", errorMsgs);

	try {
		/***************************1.�����ШD�Ѽ�***************************************/
		String mbrno= req.getParameter("mbrno");
		String rmno= req.getParameter("rmno");
		/***************************2.�}�l�R�����***************************************/
		JoinrmService joinrmSvc = new JoinrmService();
		joinrmSvc.deleteMbr(rmno, mbrno);
		
		/***************************3.�R������,�ǳ����(Send the Success view)***********/								
//		String url = "/emp/listAllEmp.jsp";
//		RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
//		successView.forward(req, res);
		
		/***************************��L�i�઺���~�B�z**********************************/
	} catch (Exception e) {
		System.out.println(e);
//		errorMsgs.add("�R����ƥ���:"+e.getMessage());
//		RequestDispatcher failureView = req
//				.getRequestDispatcher("/emp/listAllEmp.jsp");
//		failureView.forward(req, res);
	}
}

if ("listInfo".equals(action)) { // �Ӧ�select_page.jsp���ШD

	List<String> errorMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	req.setAttribute("errorMsgs", errorMsgs);

	try {
		/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
		String rmno= req.getParameter("rmno");
		String mbrno= req.getParameter("mbrno");
		
		/***************************2.�}�l�d�߸��*****************************************/
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
		
		/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
		req.setAttribute("joinrmVO", joinrmVO); // ��Ʈw���X��empVO����,�s�Jreq
		String url = "/front-end/list_findByPK.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); 
//		successView.forward(req, res);

		/***************************��L�i�઺���~�B�z*************************************/
	} catch (Exception e) {
		System.out.println(e);
//		errorMsgs.add("�L�k���o���:" + e.getMessage());
//		RequestDispatcher failureView = req
//				.getRequestDispatcher("/emp/select_page.jsp");
//		failureView.forward(req, res);
	}
}

if ("listInfo2".equals(action)) { // �Ӧ�select_page.jsp���ШD

	List<String> errorMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	req.setAttribute("errorMsgs", errorMsgs);

	try {
		/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
		String rmno= req.getParameter("rmno");
		String mbrno= req.getParameter("mbrno");
		
		/***************************2.�}�l�d�߸��*****************************************/
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
		
		/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
		PrintWriter out = res.getWriter();
		  out.append(String.valueOf(joinrmVO.size()));
		  out.close();


		/***************************��L�i�઺���~�B�z*************************************/
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