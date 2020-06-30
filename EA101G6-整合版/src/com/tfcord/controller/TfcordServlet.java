package com.tfcord.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tfcord.model.*;


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
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String mbrno = req.getParameter("mbrno");
				HttpSession session = req.getSession();
				session.setAttribute("mbrno", mbrno);
				
				if(mbrno == null || (mbrno.trim()).length() == 0) {
					errorMsgs.add("請先登入帳號");
				}
				
				String tftype = req.getParameter("tftype");
				req.setAttribute("tftype", tftype);
				
				Integer tfstatus = new Integer (req.getParameter("tfstatus"));
				
				Integer price = new Integer (req.getParameter("price"));
				req.setAttribute("price", price);//給buyPoint.jsp(成功畫面)取得買多少點，後續給會員個人點數 作 加總的動作
				
				if(price == null || price == 0) {
					errorMsgs.add("請選擇儲值的金額");
				}
				
				String card1 = req.getParameter("card1");
				String card2 = req.getParameter("card2");
				String card3 = req.getParameter("card3");
				String card4 = req.getParameter("card4");
				if(card1 == null || (card1.trim()).length() != 4 || 
				   card2 == null || (card2.trim()).length() != 4 || 
				   card3 == null || (card3.trim()).length() != 4 || 
				   card4 == null || (card4.trim()).length() != 4) {
					errorMsgs.add("請輸入正確信用卡格式");
				}
				
				String ccv = req.getParameter("ccv");
				if(ccv == null || (ccv.trim()).length() != 3) {
					errorMsgs.add("請輸入正確ccv格式");
				}
				
				TfcordVO tfcordVO = new TfcordVO();
				tfcordVO.setMbrno(mbrno);
				tfcordVO.setPrice(price);
				tfcordVO.setTfstatus(tfstatus);
				tfcordVO.setTftype(tftype);
				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("tfcordVO", tfcordVO);
					RequestDispatcher failView = req.getRequestDispatcher("/front-end/tfcord/buyPoint.jsp");
					failView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增點數轉換紀錄*****************************************/
				TfcordService TfcordSvc = new TfcordService();
				tfcordVO = TfcordSvc.addTfcord(mbrno, tftype, price, tfstatus);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front-end/tfcord/listOneMbrtf.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			}catch(Exception e) {
				errorMsgs.add("購買點數失敗");
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/tfcord/buyPoint.jsp");
				failView.forward(req, res);
			}	
		}
		
		if("addTfMoney".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("erroMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String mbrno = req.getParameter("mbrno");//先寫死的，等會員的寫好在抓session內的會員物件
				HttpSession session = req.getSession();
				session.setAttribute("mbrno", mbrno);
				
				if(mbrno == null || (mbrno.trim()).length() == 0) {
					errorMsgs.add("請先登入帳號");
				}
				
				String tftype = req.getParameter("tftype");
				req.setAttribute("tftype", tftype);
				
				Integer tfstatus = new Integer (req.getParameter("tfstatus"));
				
				Integer price = new Integer (req.getParameter("price"));
				if(price == null || price == 0) {
					errorMsgs.add("請選擇儲值的金額");
				}
				req.setAttribute("price", price);//給listOneMbrtf.jsp(成功畫面)新增一條取得換多少點的資料，後續給會員個人點數 作 加總的動作
				
				
				
				TfcordVO tfcordVO = new TfcordVO();
				tfcordVO.setMbrno(mbrno);
				tfcordVO.setPrice(price);
				tfcordVO.setTfstatus(tfstatus);
				tfcordVO.setTftype(tftype);
				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("tfcordVO", tfcordVO);
					RequestDispatcher failView = req.getRequestDispatcher("/front-end/tfcord/tfMoney.jsp");
					failView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增點數轉換紀錄*****************************************/
				TfcordService TfcordSvc = new TfcordService();
				tfcordVO = TfcordSvc.addTfcord(mbrno, tftype, price, tfstatus);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url ="/front-end/tfcord/listOneMbrtf.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			}catch(Exception e) {
				errorMsgs.add("兌換現金失敗：" + e.getMessage());
			}
		}
		
		if("getMbr_Tfcord".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數****************************************/
				String mbrno = req.getParameter("mbrno");
				String mbrnoReg = "^BM[0-9]{5}$";
				
				if(mbrno == null || (mbrno.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}else if(!mbrno.trim().matches(mbrnoReg)) {
					errorMsgs.add("會員編號格式不正確");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failView = req.getRequestDispatcher("/back-end/tfcord/select_page_Tfcord.jsp");
					failView.forward(req, res);
					return;
				}
				
				/***************************2.開始查詢資料****************************************/
				TfcordService tfcordSvc = new TfcordService();
				List<TfcordVO> tfcordVOAll = tfcordSvc.getWhoAll(mbrno);
				if(tfcordVOAll == null) {
					errorMsgs.add("此會員沒有點數交易紀錄");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failView = req.getRequestDispatcher("/back-end/tfcord/select_page_Tfcord.jsp");
					failView.forward(req, res);
					return;
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("tfcordVOAll", tfcordVOAll);
				String url = "/back-end/tfcord/listMbrtf.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/	
			}catch(Exception e) {
				errorMsgs.add("查詢紀錄失敗" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/back-end/tfcord/select_page_Tfcord.jsp");
				failView.forward(req, res);
			}
		}
		
		if("changeStatue".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL");
			
			try {
				/***************************1.接收請求參數****************************************/
				String mbrno = req.getParameter("mbrno");
				
				String tfno = req.getParameter("tfno");
				if(tfno == null) {
					errorMsgs.add("該會員之兌換編號有誤");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failView = req.getRequestDispatcher("/back-end/tfcord/listMbrtf.jsp");
					failView.forward(req, res);
					return;
				}
				
				/***************************2.開始修改狀態****************************************/
				TfcordService tfcordSvc = new TfcordService();
				tfcordSvc.changeTfcordStatus(tfno);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				
				if(requestURL.equals("/back-end/tfcord/listMbrtf.jsp")) {//如果來源網頁是從 listMbrtf.jsp 就回到 listMbrtf.jsp
					List<TfcordVO> tfcordVOAll = tfcordSvc.getWhoAll(mbrno);
					req.setAttribute("tfcordVOAll", tfcordVOAll);
					String url = requestURL;
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
					return;
				}
				
				//如果是從其他網頁過來的，就回到 listAllTfcord.jsp 頁面
				List<TfcordVO> tfcordVOAll = tfcordSvc.getAll();
				req.setAttribute("tfcordVOAll", tfcordVOAll);
				String url = "/back-end/tfcord/listAllTfcord.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			}catch(Exception e) {
				errorMsgs.add("確認審核失敗" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/back-end/tfcord/listMbrtf.jsp");
				failView.forward(req, res);
			}		
		}
		
		if("getOne_Tfcord".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數****************************************/
				String tfno = req.getParameter("tfno");
				String tfnoReg = "^[0-9]{8}-[0-9]{7}$";
				
				if(tfno == null || (tfno.trim()).length() == 0) {
					errorMsgs.add("請輸入兌換編號");
				}else if(!tfno.trim().matches(tfnoReg)) {
					errorMsgs.add("兌換編號格式不正確");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failView = req.getRequestDispatcher("/back-end/tfcord/select_page_Tfcord.jsp");
					failView.forward(req, res);
					return;
				}
				
				/***************************2.開始查詢資料****************************************/
				TfcordService tfcordSvc = new TfcordService();
				TfcordVO tfcordVO = tfcordSvc.getOneTfcord(tfno);
				if(tfcordVO == null) {
					errorMsgs.add("此兌換編號無效");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failView = req.getRequestDispatcher("/back-end/tfcord/select_page_Tfcord.jsp");
					failView.forward(req, res);
					return;
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("tfcordVO", tfcordVO);
				String url = "/back-end/tfcord/listOnetf.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/	
			}catch(Exception e) {
				errorMsgs.add("查詢紀錄失敗" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/back-end/tfcord/select_page_Tfcord.jsp");
				failView.forward(req, res);
			}
		}
		
		
		
		
		
		
		
		
		
	}
}
