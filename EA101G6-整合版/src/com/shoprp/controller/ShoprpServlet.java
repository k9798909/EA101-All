package com.shoprp.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.shoprp.model.*;


public class ShoprpServlet extends HttpServlet{
	
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
			

			
			String mbrno = req.getParameter("mbrno");
			String rmno = req.getParameter("rmno");
			String detail = req.getParameter("detail");
			
			Integer attend = new Integer(req.getParameter("attend").trim());

			ShoprpVO shoprpVO = new ShoprpVO();
			shoprpVO.setMbrno(mbrno);
			shoprpVO.setRmno(rmno);
			shoprpVO.setDetail(detail);
			shoprpVO.setAttend(attend);
			
			
			
			
			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//req.setAttribute("empVO", empVO); // �t����J�榡���~��empVO����,�]�s�Jreq
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/addEmp.jsp");
//				failureView.forward(req, res);
//				return;
//			}
			
			/***************************2.�}�l�s�W���***************************************/
			ShoprpService shoprpSvc = new ShoprpService();
			shoprpVO = shoprpSvc.report(mbrno,rmno,detail,attend);
			
			/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
//			String url = "/front-end/create.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
//			successView.forward(req, res);				
			
			/***************************��L�i�઺���~�B�z**********************************/
		} catch (Exception e) {
			System.out.println(e);
//			errorMsgs.add(e.getMessage());
//			RequestDispatcher failureView = req
//					.getRequestDispatcher("/front-end/create.jsp");
//			failureView.forward(req, res);
		}
		}
	}
}	