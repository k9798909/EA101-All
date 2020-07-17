package com.shopbk.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopbk.model.*;


@MultipartConfig
public class ShopbkServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String shopbkno = req.getParameter("shopbkno");
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllShopbk.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				ShopbkService shopbkSvc = new ShopbkService();
				ShopbkVO shopbkVO = shopbkSvc.getOneShopbk(shopbkno);
				if (shopbkVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllShopbk.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("shopbkVO", shopbkVO); // ��Ʈw���X��shopVO����,�s�Jreq
				String url = "listOneshopbk.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneshop.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("輸入有錯:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("listAllShopbk.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getSome_For_Display".equals(action)||"getSome_For_Display2".equals(action)) { // �Ӧ�select_page.jsp���ШD
			System.out.println(11111);
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String shopno = null;
				java.sql.Timestamp shoppds = null;
				if(req.getParameter("shopno")==null) {
					System.out.println(11111);
					try {
						String s = req.getParameter("shoppds").trim()+":00";
						shoppds = java.sql.Timestamp.valueOf(s);
						System.out.println(2222);
					} catch (IllegalArgumentException e) {
						shoppds = new java.sql.Timestamp(System.currentTimeMillis());
						errorMsgs.add("請輸入日期");
					}
					
					
				}
				if(req.getParameter("shopps")==null || req.getParameter("shopps").trim().length()==0) {
					shopno = req.getParameter("shopno");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllShopbk.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				ShopbkService shopbkSvc = new ShopbkService();
				List<ShopbkVO> shopbkVO = null;
				if(req.getParameter("shopno")==null)
					shopbkVO = shopbkSvc.getShopbkByTime(shoppds);
				if(req.getParameter("shopps")==null || req.getParameter("shoppe")==null)
					shopbkVO = shopbkSvc.getShopbkByShop(shopno);
				if (shopbkVO == null) {
					errorMsgs.add("查無資料");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllShopbk.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				System.out.println(11111);
				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("shopbkVO", shopbkVO); // ��Ʈw���X��shopVO����,�s�Jreq
				String url = null;
				if("getSome_For_Display".equals(action)) {
					System.out.println(11111);
				url = "listSomeShopbk.jsp";
				}
					
				if("getSome_For_Display2".equals(action)) {
					System.out.println(1112);
				url = "listSomeShopbk2.jsp";
				}
					
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneshop.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("有錯誤:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("listAllShopbk.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllshop.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				String shopbkno = req.getParameter("shopbkno");

				/*************************** 2.�}�l�d�߸�� ****************************************/
				ShopbkService shopbkSvc = new ShopbkService();
				ShopbkVO shopbkVO = shopbkSvc.getOneShopbk(shopbkno);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("shopbkVO", shopbkVO); // ��Ʈw���X��shopVO����,�s�Jreq
				String url = "update_shopbk_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_shop_input.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("有錯誤:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("listAllShopbk.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // �Ӧ�update_shop_input.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			Map successMsgs = new HashMap();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String shopbkno = req.getParameter("shopbkno");
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				String shopno = req.getParameter("shopno");
				Integer ofdtable = new Integer(req.getParameter("ofdtable"));

				java.sql.Timestamp shoppds = null;
				try {
					shoppds = java.sql.Timestamp.valueOf(req.getParameter("shoppds").trim());
				} catch (IllegalArgumentException e) {
					shoppds = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期");
				}
				
				java.sql.Timestamp shoppde = null;
				try {
					shoppde = java.sql.Timestamp.valueOf(req.getParameter("shoppde").trim());
				} catch (IllegalArgumentException e) {
					shoppde = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期");
				}
				
				
				
				Integer payinfohr = new Integer(req.getParameter("payinfohr"));
				Integer payinfoday = new Integer(req.getParameter("payinfoday"));
				
				ShopbkVO shopbkVO = new ShopbkVO();
				shopbkVO.setShopbkno(shopbkno);
				shopbkVO.setShopno(shopno);
				shopbkVO.setOfdtable(ofdtable);
				shopbkVO.setShoppds(shoppds);
				shopbkVO.setShoppde(shoppde);
				shopbkVO.setPayinfohr(payinfohr);
				shopbkVO.setPayinfoday(payinfoday);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("shopbkVO", shopbkVO); // �t����J�榡���~��shopVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("update_shopbk_input.jsp");
					failureView.forward(req, res);
					return; // �{�����_
				}

				/*************************** 2.�}�l�ק��� *****************************************/
				ShopbkService shopbkSvc = new ShopbkService();
				shopbkVO = shopbkSvc.updateShopbk(shopbkno, shopno, ofdtable, shoppds, shoppde, payinfohr, payinfoday);

				/*************************** 3.�ק粒��,�ǳ����(Send the Success view) *************/
				req.setAttribute("shopbkVO", shopbkVO); // ��Ʈwupdate���\��,���T����shopVO����,�s�Jreq
				String url = "listOneShopbk.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneshop.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("update_shopbk_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // �Ӧ�addshop.jsp���ШD
System.out.println(1111111111);
			List<String> errorMsgs = new LinkedList<String>();
			Map successMsgs = new HashMap();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
//			try {
				/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/

				String shopno = req.getParameter("shopno");
				Integer ofdtable = null;
				try {
					ofdtable = new Integer(req.getParameter("ofdtable").trim());
				}catch(Exception e) {
					errorMsgs.add("提供人數格式錯誤");
				}
				
				if (req.getParameter("ofdtable").trim() == null||req.getParameter("ofdtable").trim().length()==0) {
					ofdtable = 15;
					errorMsgs.add("提供位置不可空白");
				}
				java.sql.Timestamp shoppds = null;
				try {
System.out.println(1111111111);
					String s = req.getParameter("shoppds").trim()+":00";
					shoppds = java.sql.Timestamp.valueOf(s);
					System.out.println(1111111111);
				} catch (IllegalArgumentException e) {
					shoppds = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期");
				}
				
				java.sql.Timestamp shoppde = null;
				try {
System.out.println(1111111111);
					String s1 = req.getParameter("shoppde").trim()+":00";
					shoppde = java.sql.Timestamp.valueOf(s1);
				} catch (IllegalArgumentException e) {
					shoppde = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期");
				}
				
				System.out.println(1111111111);
				Integer payinfohr = null;
				try {
					payinfohr = new Integer(req.getParameter("payinfohr").trim());
				}catch(Exception e) {
					errorMsgs.add("每小時價位格式錯誤");
				}
				System.out.println(1111111111);
				
				
				
				
				Integer payinfoday = null;
				try {
					payinfoday = new Integer(req.getParameter("payinfoday").trim());
				}catch(Exception e) {
					errorMsgs.add("每小時價位格式錯誤");
				}
				System.out.println(1111111111);
				ShopbkVO shopbkVO = new ShopbkVO();
				shopbkVO.setShopno(shopno);
				shopbkVO.setOfdtable(ofdtable);
				shopbkVO.setShoppds(shoppds);
				shopbkVO.setShoppde(shoppde);
				shopbkVO.setPayinfohr(payinfohr);
				shopbkVO.setPayinfoday(payinfoday);
				
System.out.println(1111111111);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					System.out.println("error");
					req.setAttribute("shopbkVO", shopbkVO); // �t����J�榡���~��shopVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("listSomeShopbk2.jsp");
					failureView.forward(req, res);
					return;
				}
System.out.println(1111111111);
				/*************************** 2.�}�l�s�W��� ***************************************/
				ShopbkService shopbkSvc = new ShopbkService();
				shopbkVO = shopbkSvc.addShopbk(shopno, ofdtable, shoppds, shoppde, payinfohr, payinfoday);

				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "listSomeShopbk2.jsp";
				successMsgs.put("successMsgs","新增成功!");
				req.setAttribute("successMsgs", successMsgs);
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllshop.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("listSomeShopbk2.jsp");
//				failureView.forward(req, res);
//			}
		}
	
	}

}
	
