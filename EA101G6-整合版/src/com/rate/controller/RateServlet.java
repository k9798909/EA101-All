package com.rate.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.rate.model.*;


public class RateServlet extends HttpServlet{
	
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
			

			
			String rmno= req.getParameter("rmno");
			String ratingmbrno= req.getParameter("ratingmbrno");
			String ratedmbrno= req.getParameter("ratedmbrno");
			String detail= req.getParameter("detail");
			
			Integer score = new Integer(req.getParameter("score").trim());

			RateVO rateVO = new RateVO();
			rateVO.setRmno(rmno);
			rateVO.setRatingmbrno(ratingmbrno);
			rateVO.setRatedmbrno(ratedmbrno);
			rateVO.setDetail(detail);
			rateVO.setScore(score);
			
			
			
			
			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//req.setAttribute("empVO", empVO); // �t����J�榡���~��empVO����,�]�s�Jreq
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/addEmp.jsp");
//				failureView.forward(req, res);
//				return;
//			}
			
			/***************************2.�}�l�s�W���***************************************/
			RateService rateSvc = new RateService();
			rateVO = rateSvc.sendRate(rmno,ratingmbrno,ratedmbrno,detail,score);
			
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