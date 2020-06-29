package com.tfcord.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/TfcordServlet")
public class TfcordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TfcordServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("addTfcord".equals(action)) {
			List<String> errorMsgs = new ArrayList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String mbrno = req.getParameter("mbrno");
				if(mbrno == null) {
					
				}
				
			}catch(Exception e) {
				
			}
			
			
			
			
		}
		
		
	}

}
